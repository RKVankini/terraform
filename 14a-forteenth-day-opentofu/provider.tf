provider "aws" {
  
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # opentofu official repo
      version = "~> 5.0"
    }
  }
}
