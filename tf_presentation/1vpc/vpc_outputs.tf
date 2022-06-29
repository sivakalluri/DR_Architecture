# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}
# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}

# VPC Public Subnet Group Name
output "public_route_table_ids" {
  description = "Name of Public Subnet Group"
  value       = module.vpc.public_route_table_ids
}
