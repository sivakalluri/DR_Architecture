data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "multi-purpose-office-bkt"
    key    = "dev/proj1-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

