module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket
  acl    = var.acl

  control_object_ownership = var.control_object_ownership
  object_ownership         = var.object_ownership

  versioning = {
    enabled = true
  }
}