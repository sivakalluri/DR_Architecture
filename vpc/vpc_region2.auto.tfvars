# VPC Variables
vpc_replica_name = "region2vpc"
vpc_replica_cidr_block = "10.0.0.0/16"
vpc_replica_availability_zones = ["us-west-1a", "us-west-1b"]
vpc_replica_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_replica_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_replica_database_subnets= ["10.0.151.0/24", "10.0.152.0/24"]
vpc_replica_create_database_subnet_group = true
vpc_replica_create_database_subnet_route_table = true


