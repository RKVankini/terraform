# Terraform Custom Network

This repository demonstrates how to create a custom network in AWS using Terraform.

The setup includes:
- Custom VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance

This configuration helps build a basic AWS networking architecture using Infrastructure as Code (IaC).

Terraform allows AWS networking resources to be managed using declarative configuration files. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build?utm_source=chatgpt.com))

---

# Repository Structure

```bash
6sixth-day-customNetwork/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- AWS VPC
- Linux
- Git & GitHub

---

# AWS Resources Used

## 1. VPC (Virtual Private Cloud)

A VPC is a logically isolated virtual network in AWS.

Example:

```hcl
resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Custom-VPC"
  }
}
```

The VPC provides networking boundaries for AWS resources. ([docs.aws.amazon.com](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html?utm_source=chatgpt.com))

---

## 2. Public Subnet

A subnet divides the VPC network into smaller networks.

Example:

```hcl
resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

}
```

Public subnets allow internet access through an Internet Gateway.

---

## 3. Internet Gateway

An Internet Gateway enables communication between the VPC and the internet.

Example:

```hcl
resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id
}
```

Internet Gateways provide internet connectivity for public resources. ([docs.aws.amazon.com](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html?utm_source=chatgpt.com))

---

## 4. Route Table

Route tables define how traffic flows inside the VPC.

Example:

```hcl
resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
```

The route sends internet traffic to the Internet Gateway.

---

## 5. Route Table Association

Associates the subnet with the route table.

Example:

```hcl
resource "aws_route_table_association" "public_assoc" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}
```

---

## 6. Security Group

Security Groups act as virtual firewalls for AWS resources.

Example:

```hcl
resource "aws_security_group" "sg" {

  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

This allows SSH access to the EC2 instance.

---

## 7. EC2 Instance

Example:

```hcl
resource "aws_instance" "web" {

  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "Custom-Network-Server"
  }
}
```

The EC2 instance is deployed inside the custom network.

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform downloads:
- AWS provider
- Plugins
- Dependencies

---

## Validate Configuration

```bash
terraform validate
```

---

## Preview Infrastructure

```bash
terraform plan
```

Terraform shows resources that will be created.

---

## Apply Infrastructure

```bash
terraform apply
```

Type:

```bash
yes
```

to confirm deployment.

---

## Destroy Infrastructure

```bash
terraform destroy
```

Terraform safely removes all infrastructure resources.

---

# Network Architecture

```text
Internet
   │
Internet Gateway
   │
Route Table
   │
Public Subnet
   │
EC2 Instance
   │
Security Group
   │
Custom VPC
```

---

# Important Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
terraform fmt
terraform output
```

---

# Features

- Custom AWS VPC
- Public Subnet Configuration
- Internet Gateway Setup
- Route Table Configuration
- Security Group Rules
- EC2 Deployment inside Custom Network
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- AWS VPC Networking
- Terraform Networking Resources
- Public Subnet Configuration
- Internet Connectivity Setup
- Security Groups
- Infrastructure as Code Basics

---

# Advantages of Custom Networks

| Feature | Benefit |
|---|---|
| Isolation | Separate AWS environments |
| Security | Controlled network access |
| Scalability | Easy infrastructure expansion |
| Flexibility | Custom network design |
| Automation | Automated infrastructure deployment |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Modular Networking Design
- Secure Security Group Rules
- Reusable Terraform Configuration
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/6sixth-day-customNetwork)

---

# References

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- Terraform VPC Tutorial  
  https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build

- AWS VPC Documentation  
  https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html

- AWS Internet Gateway Documentation  
  https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html

- Terraform Resource Documentation  
  https://developer.hashicorp.com/terraform/language/resources
