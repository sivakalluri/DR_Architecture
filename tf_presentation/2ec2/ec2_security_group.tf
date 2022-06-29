module "ec2_inst_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"

  name = "ec2_inst_sg"
  description = "Security Group with HTTP & SSH port open for entire VPC Block (IPv4 CIDR), egress ports are all world open"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = {
    Name = "terraform_created_ec2_sg"
  }
}
