# Terraform Block
terraform {
  required_version = ">= 0.14" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6"
  }
 }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "multi-purpose-office-bkt"
    key    = "dev/proj2-ec2/terraform.tfstate"
    region = "us-east-1" 

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "proj2-ec2"    
  }    
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
}

