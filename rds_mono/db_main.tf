  ################################################################################
  # DB Instance Module
  ################################################################################
  
  module "db_instance" {
    source  = "terraform-aws-modules/rds/aws"
    version = "4.3.0"
  
    engine                = local.engine
    engine_version        = local.engine_version
    family                = local.family
    major_engine_version  = local.major_engine_version
    instance_class        = local.instance_class
    storage_encrypted     = local.db_storage_encrypted
    allocated_storage     = local.allocated_storage
    max_allocated_storage = local.max_allocated_storage
  
    # Backups are required in order to create a replica
    backup_retention_period = local.db_backup_retention_period
    skip_final_snapshot     = local.skip_final_snapshot
    deletion_protection     = local.deletion_protection
  
    # Username and password
    identifier = var.db_instance_identifier
    db_name    = var.db_name
    username   = var.db_username
    password   = var.db_password
    multi_az      = var.db_multi_az
  
    # db_subnet_group_name   = module.vpc.database_subnet_group_name
    db_subnet_group_name   = data.terraform_remote_state.vpc_region2.outputs.region2_db_subnet_group_name    
    vpc_security_group_ids = [module.db_security_group.security_group_id]
  
    maintenance_window              = "Mon:00:00-Mon:03:00"
    backup_window                   = "03:00-06:00"
    enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  
    tags = local.common_tags
  }
