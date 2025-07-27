resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = toset(var.env)
   #   count = length(var.env)  if it is count 

  tags = {
    Name = each.value # for a set, each.value and each.key is the same
  }
}
