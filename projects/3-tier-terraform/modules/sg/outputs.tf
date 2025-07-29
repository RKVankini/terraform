output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "Security Group ID for ALB"
}

output "instance_sg_id" {
  value       = aws_security_group.instance.id
  description = "Security Group ID for App EC2 Instances"
}
