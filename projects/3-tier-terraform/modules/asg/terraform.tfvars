# General naming
name_prefix = "rk-terraform"   # Prefix for naming all resources

# AMI for Ubuntu 22.04 in ap-south-1 (Mumbai)
ami_id = "ami-0f918f7e67a3323f0"   # Ubuntu 22.04 LTS (ap-south-1)

# EC2 instance type
instance_type = "t2.micro"

# EC2 key pair name (must exist in your AWS account)
key_name = "RK-terra-key"

# Private subnet IDs — from VPC module outputs
# Fill these from the VPC output values
private_subnet_ids = [
  "subnet-0abcd1234efgh5678",  # ap-south-1a
  "subnet-0123abcd4567efgh"    # ap-south-1b
]

# Security group for the EC2/ASG instances
# Fill this with your instance SG ID from outputs
instance_sg_id = "sg-0a1b2c3d4e5f67890"

# User data script (example: install Apache/Node)
user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install -y apache2
systemctl start apache2
systemctl enable apache2
echo "Hello from ASG instance $(hostname)" > /var/www/html/index.html
EOF

# Auto Scaling configuration
min_size         = 1
max_size         = 3
desired_capacity = 2
