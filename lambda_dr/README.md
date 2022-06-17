## DR LAMBDA

# In terraform.tfvars file modify the variables of generic variables like
  aws_region    
  environment      
  business_divsion

# local_values.tf
# Modify all environments common variables in local_values.tf like
  owners 
  environment 
  name 
  tags

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

## LAMBDA
# Modify the values of lambda function in lambda_locals.tf
    prefix                        
    resource_name_prefix         
    lambda_handler                
    lambda_description            
    lambda_runtime                
    lambda_timeout                
    lambda_concurrent_executions

# Modify the lambda script with the updates pythoon script in lambda_script.py

# Update the lambda script Environment variables in lambda.auto.tfvars
MASTER_INSTANCE_COUNT  
MASTER_VOLUME_SIZE     
MASTER_INSTANCE_TYPE   
SLAVE_INSTANCE_COUNT   
SLAVE_VOLUME_SIZE      
SLAVE_INSTANCE_TYPE   
EC2_SUBNET_ID         
EC2KEY_NAME           
MASTER_SG             
SLAVE_SG              
SERVICE_ACCESS_SG     
CLUSTER_NAME          
RELEASE_LABEL         
EMR_BOOTSTRAP_PATH    
EMR_STEP_SCRIPTS_PATH 
ENV                  
DFS_REPLICATION        
