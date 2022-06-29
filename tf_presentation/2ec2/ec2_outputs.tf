# AWS EC2 Instance Terraform Outputs

## ec2_bastion_public_instance_ids
output "ec2_instance_id" {
  description = "List of IDs of instances"
  value       = aws_instance.ec2_inst_datasource.id
}

## ec2_bastion_public_ip
output "ec2_instance_public_ip" {
  description = "Public IP addresses assigned to the instances"
  value       = aws_instance.ec2_inst_datasource.public_ip 
}
