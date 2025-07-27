aws_region         = "ap-south-1"

sg_name            = "RK-terra-project"
sg_description     = "Allow TLS inbound traffic"

ingress_ports      = [22, 80, 443, 8080, 9000, 3000, 8082, 8081]

cidr_blocks_ingress = ["0.0.0.0/0"]
cidr_blocks_egress  = ["0.0.0.0/0"]

tags = {
  Name = "RK-terra-project"
}
