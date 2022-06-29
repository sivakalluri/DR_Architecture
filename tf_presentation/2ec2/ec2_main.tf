resource "aws_instance" "ec2_inst_datasource" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "key_office"
  vpc_security_group_ids = [module.ec2_inst_sg.this_security_group_id]
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  tags = {
    Name = "terraform_created_ec2"
  }
  user_data = <<EOF
#! /bin/bash
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>Welcome to Terraform created ec2 instance- APP-1</h1>' | sudo tee /var/www/html/index.html
EOF
  depends_on = [module.ec2_inst_sg]
}

