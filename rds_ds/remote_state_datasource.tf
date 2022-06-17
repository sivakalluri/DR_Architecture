data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "glue-qs-city-data"
    key    = "dev/proj1-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "vpc_region2" {
  backend = "s3"
  config = {
    bucket = "glue-qs-city-data"
    key    = "dev/proj1-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

