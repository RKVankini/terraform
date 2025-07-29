# Prefix for all resource names
name_prefix = "rk-terraform"

# CIDR block for the VPC
vpc_cidr = "10.0.0.0/16"

# CIDRs for 3 public subnets (ap-south-1a, 1b, 1c)
public_subnet_cidrs = [
  "10.0.1.0/24",  # ap-south-1a
  "10.0.2.0/24",  # ap-south-1b
  "10.0.3.0/24"   # ap-south-1c
]

# CIDRs for 3 private subnets (ap-south-1a, 1b, 1c)
private_subnet_cidrs = [
  "10.0.101.0/24",  # ap-south-1a
  "10.0.102.0/24",  # ap-south-1b
  "10.0.103.0/24"   # ap-south-1c
]
