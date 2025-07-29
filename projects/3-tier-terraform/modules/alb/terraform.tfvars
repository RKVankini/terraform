# Common prefix for all resource names
name_prefix = "rk-terraform"

# VPC ID (replace with actual ID or use from VPC module output if referencing)
vpc_id = "vpc-035ed57807cbe3960"  # Replace this with the actual VPC ID

# Public subnet IDs for ALB across 3 AZs (replace with actual subnet IDs or use from outputs)
public_subnet_ids = [
  "subnet-0f22734c453eb0fc5",  # ap-south-1a
  "subnet-06478e4dba8bf2d69",  # ap-south-1b
  "subnet-0e02212f1b7ffadd6"   # ap-south-1c
]

# Security Group ID for ALB (replace with actual SG ID or use output from SG module)
alb_sg_id = "sg-04e5e210e037bc642"
