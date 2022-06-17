## DR RDS

# In terraform.tfvars file modify the variables of generic variables like
  aws_region    
  environment      
  business_divsion

## VPC
# Modify the value of VPC Modules in vpc.auto.tfvars
  vpc_name
  cidr            
  azs             
  public_subnets  
  private_subnets
  database_subnets             
  create_database_subnet_group 
  create_database_subnet_route_table
  enable_nat_gateway 
  single_nat_gateway

# local_values.tf
# Modify all environments common variables in local_values.tf like
  owners 
  environment 
  name 
  tags


# Created a 2nd provider with alias "region2" modify the 2nd region in provider_region2.tf
  region2
  
## RDS 
# VPC in Region2 For RDS, modify region2 values in vpc_region2.auto.tfvars
  vpc_name
  cidr            
  azs             
  public_subnets  
  private_subnets
  database_subnets             
  create_database_subnet_group 
  create_database_subnet_route_table
  enable_nat_gateway 
  single_nat_gateway

# Modify the value of RDS engine configurations in rds_locals.tf like
  engine              
  engine_version    
  family              
  major_engine_version  
  instance_class      
  allocated_storage     
  max_allocated_storage
  port                  
  db_storage_encrypted  
  skip_final_snapshot  
  deletion_protection   
  backup_retention_period  
  
# Modify the variables of both master and replica of RDS engine in rds.auto.tfvars like
  identifier 
  db_name   
  username    
  multi_az

