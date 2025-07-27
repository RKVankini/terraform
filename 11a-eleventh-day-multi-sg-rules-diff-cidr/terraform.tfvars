aws_region = "ap-south-1"

allowed_ports = {
  "22"    = "203.0.113.0/24"    # SSH (Restrict to office IP)
  "80"    = "0.0.0.0/0"         # HTTP (Public)
  "443"   = "0.0.0.0/0"         # HTTPS (Public)
  "8080"  = "10.0.0.0/16"       # Internal App (Restrict to VPC)
  "9000"  = "192.168.1.0/24"    # SonarQube/Jenkins (Restrict to VPN)
  "3389"  = "10.0.1.0/24"       # RDP (Restrict to subnet)
}
