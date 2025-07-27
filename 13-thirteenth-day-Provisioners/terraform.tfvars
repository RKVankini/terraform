# AWS region to deploy resources into
aws_region = "ap-south-1" # Mumbai region

# Ubuntu 22.04 LTS AMI ID for Mumbai (ap-south-1)
ami_id = "ami-0f918f7e67a3323f0" # Ubuntu 22.04 LTS for ap-south-1 # You can confirm via AWS AMI catalog

# EC2 instance type (Free-tier eligible)
instance_type = "t2.micro"

# CIDR block for the VPC (large IP range)
vpc_cidr = "10.0.0.0/16"

# CIDR block for the public subnet (smaller IP range inside VPC)
subnet_cidr = "10.0.0.0/24"

# Availability Zone in Mumbai
az = "ap-south-1a"

# Key pair name used in AWS (must exist or be created)
key_name = "RK-terra-key"

# Path to your public SSH key file (used to create key pair)
public_key_path = "C:/Users/vsai9/.ssh/id_ed25519.pub"

# Path to your private SSH key file (used for provisioning)
private_key_path = "C:/Users/vsai9/.ssh/id_ed25519"
