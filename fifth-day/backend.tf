terraform {
  backend "s3" {
    bucket = "rds.mysql.snopshot1.rk"
    key    = "terraform.tfstate"
    region = "ap-south-1"

  }
}