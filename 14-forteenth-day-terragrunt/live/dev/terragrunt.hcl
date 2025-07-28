include {
  path = find_in_parent_folders()
}

locals {
  region = "ap-south-1"  # Replace with your desired AWS region
}

terraform {
  source = "../../modules/vpc"
}

inputs = {
  cidr_block = "10.0.0.0/16"
  vpc_name   = "dev-vpc"
  region     = local.region
}