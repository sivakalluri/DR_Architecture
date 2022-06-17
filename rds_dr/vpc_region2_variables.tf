# VPC Input Variables

# VPC Name
variable "vpc_replica_name" {
  description = "Replica VPC Name"
  type = string
  default = "vpcreplica"
}

# VPC CIDR Block
variable "vpc_replica_cidr_block" {
  description = "Replica VPC CIDR Block"
  type = string
  default = "10.0.0.0/16"
}

# VPC Availability Zones
variable "vpc_replica_availability_zones" {
  description = "Replica VPC Availability Zones"
  type = list(string)
  default = ["us-west-1a", "us-west-1b"]
}

# VPC Public Subnets
variable "vpc_replica_public_subnets" {
  description = "Replica VPC Public Subnets"
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnets
variable "vpc_replica_private_subnets" {
  description = "Replica VPC Private Subnets"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Database Subnets
variable "vpc_replica_database_subnets" {
  description = "Replica VPC Database Subnets"
  type = list(string)
  default = ["10.0.151.0/24", "10.0.152.0/24"]
}

# VPC Create Database Subnet Group (True / False)
variable "vpc_replica_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type = bool
  default = true
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_replica_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type = bool
  default = true
}

