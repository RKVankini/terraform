# output "alb_sg_id" {
#   value       = aws_security_group.alb_sg_id.id
#   description = "Security Group ID for ALB"
# }

# output "instance_sg_id" {
#   value       = aws_security_group.instance.id
#   description = "Security Group ID for App EC2 Instances"
# }

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "instance_sg_id" {
  value = aws_security_group.instance_sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

