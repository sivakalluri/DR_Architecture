# VPC Output Values

# VPC ID
output "region2_vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_region2.vpc_id
}

# VPC CIDR blocks
output "region2_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc_region2.vpc_cidr_block
}

# VPC Private Subnets
output "region2_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc_region2.private_subnets
}

# VPC Public Subnets
output "region2_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc_region2.public_subnets
}

# VPC Database Subnets
output "region2_database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc_region2.database_subnets
}

# VPC AZs
output "region2_azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc_region2.azs
}
