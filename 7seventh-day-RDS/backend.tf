terraform {
  #required_version = ">=1.10" # this will allow to work same terraform version only 
  backend "s3" {
    bucket = "rds.mysql.snopshot1.rk"
    key    = "Day-7/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
    #encrypt = true
    #dynamodb_table = "value"

  }
}