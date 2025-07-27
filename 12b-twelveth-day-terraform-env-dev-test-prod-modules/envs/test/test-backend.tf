terraform {
  backend "s3" {
    bucket         = "rk-terraform-practice"
    key            = "test/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true
  }
}