resource "aws_security_group" "lambda_sg" {
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


