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


  
## RDS 

# Modify the value of RDS engine configurations in db_locals.tf like
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
  
# Modify the variables of RDS engine in db.auto.tfvars like
  identifier 
  db_name   
  username    
  multi_az

# Passwordd is passed as environment variables in secrets.tfvars
# To call the password  while planning or applying or destroying pass it using the followed by command
terraform apply -var-file="secrets.tfvars"
