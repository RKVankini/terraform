# Terraform Root & Child Module Project

This project demonstrates how to use Terraform Root Modules and Child Modules for creating reusable and scalable AWS infrastructure.

The repository contains Terraform configurations that follow a modular approach where:

- The Root Module manages the overall infrastructure deployment.
- The Child Modules contain reusable infrastructure components like EC2, VPC, Security Groups, etc.

This structure helps in:
- Reusability
- Better project organization
- Easier maintenance
- Scalability for production environments

---

# Project Structure

```bash
10a-tenth-day-terraform-root-child-module/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
│
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── vpc/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- Linux
- Git & GitHub

---

# Terraform Concepts Covered

## Root Module

The root module is the main working directory where Terraform commands are executed.

It:
- Calls child modules
- Passes variables
- Manages outputs
- Controls the overall deployment

Example:

```hcl
module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
```

---

## Child Module

Child modules are reusable Terraform configurations stored inside the `modules/` directory.

Benefits:
- Code reuse
- Standardization
- Easier collaboration
- Simplified maintenance

---

# Features

- Reusable Terraform Modules
- AWS EC2 Deployment
- Modular Infrastructure Design
- Variables and Outputs
- Clean Project Structure
- Infrastructure as Code (IaC)

---

# Prerequisites

Before running this project, install:

## 1. Terraform

Install from:

https://developer.hashicorp.com/terraform

---

## 2. AWS CLI

Install from:

https://aws.amazon.com/cli/

---

## 3. Configure AWS Credentials

```bash
aws configure
```

Provide:
- AWS Access Key
- AWS Secret Key
- Region
- Output format

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

This downloads:
- Providers
- Modules
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

# Variables Example

Example `terraform.tfvars`

```hcl
region         = "ap-south-1"
instance_type  = "t2.micro"
ami_id         = "ami-xxxxxxxx"
```

---

# Outputs

Terraform outputs can display:
- EC2 Public IP
- Instance ID
- VPC ID
- Subnet IDs

Example:

```bash
terraform output
```

---

# Advantages of Modules in Terraform

| Feature | Benefit |
|---|---|
| Reusability | Avoid duplicate code |
| Scalability | Easy to expand infrastructure |
| Maintainability | Cleaner code structure |
| Collaboration | Teams can work independently |
| Standardization | Consistent deployments |

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform Module Architecture
- Root vs Child Modules
- Variables and Outputs
- Reusable Infrastructure Design
- AWS Infrastructure Automation
- Infrastructure as Code Best Practices

---

# Useful Commands

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

# Best Practices Used

- Modular Code Design
- Separate Variables and Outputs
- Reusable Components
- Version Control with GitHub
- Infrastructure as Code Principles

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/10a-tenth-day-terraform-root-child-module

---

# References

- Terraform Modules Documentation  
  https://developer.hashicorp.com/terraform/language/modules

- Terraform GitHub Repository  
  https://github.com/hashicorp/terraform
