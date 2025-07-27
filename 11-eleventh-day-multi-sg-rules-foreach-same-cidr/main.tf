resource "aws_security_group" "RK-terra-project" {
  name        = var.sg_name
  description = var.sg_description

  ingress = [
    for port in var.ingress_ports : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = var.cidr_blocks_ingress
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks_egress
  }

  tags = var.tags
}
