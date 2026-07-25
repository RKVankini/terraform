variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "three-tier"
}

# Backend ASG
variable "backend_launch_template_id" {
  description = "Launch template ID for backend"
  type        = string
}

variable "app_subnet_1_id" {
  description = "Backend subnet 1"
  type        = string
}

variable "app_subnet_2_id" {
  description = "Backend subnet 2"
  type        = string
}

variable "backend_target_group_arn" {
  description = "Backend ALB Target Group ARN"
  type        = string
}

variable "backend_desired_capacity" {
  type    = number
  default = 1
}

variable "backend_min_size" {
  type    = number
  default = 1
}

variable "backend_max_size" {
  type    = number
  default = 3
}

# Scaling Config
variable "scale_out_target_value" {
  description = "Target CPU utilization % for scaling"
  type        = number
  default     = 80
}
