# Terraform All Configurations

This repository contains basic Terraform configuration files required for creating and managing infrastructure using Infrastructure as Code (IaC).

Terraform configurations define:
- Providers
- Resources
- Variables
- Outputs
- Terraform settings

This setup helps organize Terraform infrastructure in a clean and reusable way. Terraform configurations are written using HCL (HashiCorp Configuration Language). 

---

# Repository Structure

```bash
3third-day-all-configrations/
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
- Linux
- Git & GitHub

---

# Terraform Configuration Files

## 1. provider.tf

The provider configuration tells Terraform which cloud provider to use.

Example:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

Providers act as plugins that connect Terraform to cloud platforms. 

---

## 2. main.tf

The `main.tf` file contains the main infrastructure resources.

Example:

```hcl
resource "aws_instance" "example" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-Server"
  }
}
```

Resources define infrastructure objects such as EC2 instances, VPCs, and Security Groups. 

---

## 3. variables.tf

The `variables.tf` file defines reusable input variables.

Example:

```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

Variables help make Terraform configurations reusable and dynamic.

---

## 4. terraform.tfvars

The `terraform.tfvars` file stores variable values.

Example:

```hcl
instance_type = "t2.micro"
ami_id        = "ami-xxxxxxxx"
```

Terraform automatically loads values from `terraform.tfvars`.

---

## 5. outputs.tf

The `outputs.tf` file displays important resource information after deployment.

Example:

```hcl
output "public_ip" {
  value = aws_instance.example.public_ip
}
```

Outputs help retrieve resource details like:
- Public IP
- Instance ID
- DNS Name

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform downloads:
- Providers
- Plugins
- Dependencies

Terraform initialization prepares the working directory. 

---

## Validate Configuration

```bash
terraform validate
```

Checks Terraform configuration syntax.

---

## Preview Infrastructure

```bash
terraform plan
```

Terraform creates an execution plan showing infrastructure changes before deployment.

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

Terraform safely removes infrastructure resources.

---

# Example Complete Configuration

## provider.tf

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

## variables.tf

```hcl
variable "ami_id" {}
variable "instance_type" {}
```

---

## terraform.tfvars

```hcl
ami_id        = "ami-xxxxxxxx"
instance_type = "t2.micro"
```

---

## main.tf

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-Web-Server"
  }
}
```

---

## outputs.tf

```hcl
output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
```

---

# Features

- Terraform Configuration Basics
- Provider Configuration
- Resource Creation
- Variables and Outputs
- Infrastructure as Code (IaC)
- AWS Infrastructure Automation

---

# Prerequisites

Before running this configuration, install:

## 1. Terraform

https://developer.hashicorp.com/terraform

---

## 2. AWS CLI

https://aws.amazon.com/cli/

---

## 3. Configure AWS Credentials

```bash
aws configure
```

Provide:
- AWS Access Key
- AWS Secret Key
- AWS Region
- Output Format

---

# Important Terraform Commands

```bash
terraform version
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
terraform fmt
terraform output
```

---

# Learning Outcomes

By completing this setup, you will understand:

- Terraform Configuration Files
- Terraform Providers
- Terraform Resources
- Variables and Outputs
- Terraform Workflow
- Infrastructure as Code Basics

---

# Advantages of Proper Configuration Structure

| Feature | Benefit |
|---|---|
| Readability | Cleaner Terraform files |
| Reusability | Reusable configurations |
| Scalability | Easier infrastructure expansion |
| Maintainability | Easier updates and troubleshooting |
| Organization | Better project structure |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Reusable Terraform Configurations
- Separate Variables and Outputs
- Clean File Structure
- Version Control with GitHub

---

# Repository Link

:contentReference[oaicite:4]{index=4}

---

# References

- Terraform Official Documentation  
  https://developer.hashicorp.com/terraform/docs

- Terraform Language Documentation  
  https://developer.hashicorp.com/terraform/language

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
