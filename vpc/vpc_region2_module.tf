
module "vpc_region2" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  providers = {
    aws = aws.region2
  }

  name = "${local.name}-${var.vpc_replica_name}"
  cidr = var.vpc_cidr_block

  azs              = var.vpc_replica_availability_zones
  public_subnets   = var.vpc_replica_public_subnets
  private_subnets  = var.vpc_replica_private_subnets
  database_subnets = var.vpc_replica_database_subnets

  create_database_subnet_group = var.vpc_replica_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  tags = local.common_tags
}
