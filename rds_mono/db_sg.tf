module "db_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${local.name}-db-sg"
  description = "RDS PostgreSQL security group"
  #vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
      #cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
  egress_rules = ["all-all"]

  tags = local.common_tags
}
