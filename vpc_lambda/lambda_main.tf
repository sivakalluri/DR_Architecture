data "archive_file" "vpc_lambda_zip" {
    type        = "zip"
    source_file = "lambda_script.py"
    output_path = "${local.lambda_zip_location}"
  }

data "aws_iam_policy_document" "vpc_lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "vpc_lambda_list_s3_buckets" {
  statement {
    actions = [
      "s3:ListAllMyBuckets",
      "s3:ListBucket"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "vpc_lambda_list_s3_buckets" {
  policy = data.aws_iam_policy_document.vpc_lambda_list_s3_buckets.json
}

resource "aws_iam_role" "vpc_lambda" {
  name = "${local.resource_name_prefix}-role"
  assume_role_policy = data.aws_iam_policy_document.vpc_lambda_assume_role_policy.json
  managed_policy_arns = [
    aws_iam_policy.vpc_lambda_list_s3_buckets.arn,
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
  tags = merge(
    {
      Name = "${local.resource_name_prefix}-role"
    },
    local.common_tags
  )
}


resource "aws_security_group" "vpc_lambda" {
  name        = "${local.resource_name_prefix}-sg"
  description = "Allow outbound traffic for ${local.resource_name_prefix}-lambda"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    {
      Name = local.resource_name_prefix
    },
    local.common_tags
  )
}

resource "aws_lambda_function" "vpc_lambda" {
  function_name = local.resource_name_prefix
  source_code_hash = data.archive_file.vpc_lambda_zip.output_base64sha256
  filename = data.archive_file.vpc_lambda_zip.output_path
  description = local.lambda_description
  role          = aws_iam_role.vpc_lambda.arn
  handler = local.lambda_handler
  runtime = local.lambda_runtime
  timeout = local.lambda_timeout

  vpc_config {
    security_group_ids = [aws_security_group.vpc_lambda.id]
    subnet_ids         = module.vpc.private_subnets
  }
  environment {
    variables = {
      MASTER_INSTANCE_COUNT = var.MASTER_INSTANCE_COUNT
      MASTER_VOLUME_SIZE    = var.MASTER_VOLUME_SIZE
      MASTER_INSTANCE_TYPE  = var.MASTER_INSTANCE_TYPE
      SLAVE_INSTANCE_COUNT  = var.SLAVE_INSTANCE_COUNT
}
}
  tags = merge(
    {
      Name = local.resource_name_prefix
    },
    local.common_tags
  )

  reserved_concurrent_executions = local.lambda_concurrent_executions
}

# CloudWatch Log Group for the Lambda function
resource "aws_cloudwatch_log_group" "vpc_lambda" {
  name = local.lambda_cw_log_group_name
  retention_in_days = local.lambda_log_retention_in_days
}
