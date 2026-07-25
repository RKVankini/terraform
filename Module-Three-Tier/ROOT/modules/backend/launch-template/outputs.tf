output "backend_launch_template_id" {
  value = aws_launch_template.backend.id
}

output "backend_launch_template_name" {
  value = aws_launch_template.backend.name
}

output "amiid" {
  value = aws_ami_from_instance.ami_backend.id
  
}