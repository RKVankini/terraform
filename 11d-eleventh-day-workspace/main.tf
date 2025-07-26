resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = var.Name
    }
  
}

# terraform workspace new <workspace name>  ===>> to create new workspace
# terraform workspace show                  ===>> to see our current workspace
# terraform workspace list                  ===>> to see list of workspaces
# terraform workspace select default        ===>> to change workspace
