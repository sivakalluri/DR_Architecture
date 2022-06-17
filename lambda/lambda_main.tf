locals {
  lambda_zip_location = "lambda_script.zip"
}
data "archive_file" "init" {
  type        = "zip"
  source_file = "lambda_script.py"
  output_path = "${local.lambda_zip_location}"
}

resource "aws_lambda_function" "dr_lambda" {
  filename      = "${local.lambda_zip_location}"
  function_name = "lambda_script"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "lambda_script.lambda_fucntion"

  source_code_hash = "${filebase64sha256(local.lambda_zip_location)}"

  runtime = "python3.9"
  environment {
    variables = {
      MASTER_INSTANCE_COUNT = var.MASTER_INSTANCE_COUNT
      MASTER_VOLUME_SIZE    = var.MASTER_VOLUME_SIZE
      MASTER_INSTANCE_TYPE  = var.MASTER_INSTANCE_TYPE
      SLAVE_INSTANCE_COUNT  = var.SLAVE_INSTANCE_COUNT
    }
  }
}

