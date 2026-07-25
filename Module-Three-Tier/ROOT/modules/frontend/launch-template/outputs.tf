output "frontend_launch_template_id" {
  value = aws_launch_template.frontend.id
}



output "frontend_launch_template_name" {
  value = aws_launch_template.frontend.name
}

output "ami-frontend" {
  value = aws_ami_from_instance.ami_frontend.id
}