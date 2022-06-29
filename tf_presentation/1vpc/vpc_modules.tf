# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  #version = "~> 2.78"

  # VPC Basic Details
  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = local.common_tags
}


