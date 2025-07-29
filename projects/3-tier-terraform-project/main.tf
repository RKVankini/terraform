## VPC ##

module "vpc" {
  source              = "./modules/vpc"
  name_prefix         = var.name_prefix
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

## ASG ##

module "asg" {
  source             = "./modules/asg"
  name_prefix        = var.name_prefix
  ami_id             = var.ami_id                   # Ubuntu AMI for Mumbai
  instance_type      = var.instance_type
  key_name           = var.key_name
  private_subnet_ids = module.vpc.private_subnet_ids
#  instance_sg_id     = aws_security_group.app_sg.id
instance_sg_id     = module.sg.instance_sg_id  
  user_data          = file("${path.module}/scripts/userdata.sh")  # Setup script
}


# resource "aws_security_group" "app_sg" {
#   name        = "${var.name_prefix}-app-sg"
#   description = "Allow HTTP from ALB only"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]   # Temporarily allow HTTP from anywhere (will restrict to ALB later)
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.name_prefix}-app-sg"
#   }
# }

## ALB ##

module "alb" {
  source            = "./modules/alb"
  name_prefix       = var.name_prefix
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.sg.alb_sg_id   
}


# output "alb_dns_name" {
#   description = "DNS name of the ALB to access application"
#   value       = module.alb.alb_dns_name
# }

## SG ##

module "sg" {
  source      = "./modules/sg"
  name_prefix = var.name_prefix
  vpc_id      = module.vpc.vpc_id
}

## rds ##

module "rds" {
  source              = "./modules/rds"
  name_prefix         = var.name_prefix
  private_subnet_ids  = module.vpc.private_subnet_ids
  db_sg_id            = module.sg.rds_sg_id
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  instance_class      = var.db_instance_class
}
