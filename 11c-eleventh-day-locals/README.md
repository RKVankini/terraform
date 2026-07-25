# Terraform Locals Project

This project demonstrates how to use Terraform `locals` to simplify code, reduce repetition, and improve readability in Terraform configurations.

Terraform locals allow you to define reusable values inside your Terraform project.

This project helps understand:
- Terraform Locals
- Code Reusability
- Cleaner Terraform Configurations
- Infrastructure as Code (IaC)

---

# Project Structure

```bash
11c-eleventh-day-locals/
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

# What are Terraform Locals?

Terraform `locals` are named values that can be reused throughout the Terraform configuration.

Locals help:
- Reduce duplicate code
- Improve readability
- Centralize repeated values
- Simplify maintenance

---

# Example Local Block

```hcl
locals {
  instance_type = "t2.micro"
  environment   = "dev"
  project_name  = "terraform-project"
}
```

You can access locals using:

```hcl
local.instance_type
```

---

# Example Usage

```hcl
resource "aws_instance" "example" {

  ami           = var.ami_id
  instance_type = local.instance_type

  tags = {
    Name        = local.project_name
    Environment = local.environment
  }
}
```

---

# Project Objective

The goal of this project is to:
- Learn Terraform locals
- Reduce repetitive code
- Improve Terraform readability
- Create reusable configurations

---

# Features

- Terraform Locals
- Reusable Configuration Values
- AWS EC2 Deployment
- Improved Code Readability
- Cleaner Infrastructure Code
- Infrastructure as Code (IaC)

---

# Advantages of Locals

| Feature | Benefit |
|---|---|
| Reusability | Use same values multiple times |
| Readability | Cleaner Terraform code |
| Maintainability | Easy to update configurations |
| Centralization | Manage values from one place |
| Reduced Duplication | Less repetitive code |

---

# Prerequisites

Before running this project, install:

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

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

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

---

## Deploy Infrastructure

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

---

# Example Variables

Example `terraform.tfvars`

```hcl
region  = "ap-south-1"
ami_id  = "ami-xxxxxxxx"
```

---

# Important Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
terraform output
```

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform Locals
- Reusable Infrastructure Code
- Terraform Expressions
- Cleaner Terraform Design
- Infrastructure Automation
- Infrastructure as Code Best Practices

---

# Best Practices Used

- Reusable Configuration Values
- Centralized Variable Management
- Clean Terraform Structure
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/11c-eleventh-day-locals

---

# References

- Terraform Locals Documentation  
  https://developer.hashicorp.com/terraform/language/values/locals

- Terraform Expressions Documentation  
  https://developer.hashicorp.com/terraform/language/expressions

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
