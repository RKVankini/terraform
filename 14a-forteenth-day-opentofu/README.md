# OpenTofu Project

This project demonstrates how to use OpenTofu for Infrastructure as Code (IaC) automation on AWS Cloud.

OpenTofu is an open-source Infrastructure as Code tool that is compatible with Terraform configurations and providers. It allows you to define, provision, and manage infrastructure using declarative configuration files. :contentReference[oaicite:0]{index=0}

This project helps understand:
- OpenTofu Basics
- Infrastructure as Code (IaC)
- AWS Infrastructure Automation
- Terraform Compatibility
- Open Source IaC Tools

---

# Project Structure

```bash
14a-forteenth-day-opentofu/
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

- OpenTofu
- Amazon Web Services (AWS)
- Linux
- Git & GitHub

---

# What is OpenTofu?

OpenTofu is a community-driven open-source Infrastructure as Code tool managed under the Linux Foundation. It was created as an open-source alternative to Terraform after HashiCorp changed Terraform licensing. :contentReference[oaicite:1]{index=1}

OpenTofu helps automate:
- Cloud infrastructure
- Networking
- Compute resources
- Storage services
- Infrastructure deployment workflows

It uses the same HCL (HashiCorp Configuration Language) syntax as Terraform and supports existing Terraform providers and modules. :contentReference[oaicite:2]{index=2}

---

# Why Use OpenTofu?

OpenTofu provides:
- Fully open-source licensing
- Terraform compatibility
- Community-driven development
- Reusable infrastructure modules
- Multi-cloud support
- Infrastructure automation

OpenTofu is designed as a drop-in replacement for Terraform. :contentReference[oaicite:3]{index=3}

---

# OpenTofu Features

## 1. Infrastructure as Code

Infrastructure is managed using code files.

Example:

```hcl
resource "aws_instance" "example" {

  ami           = var.ami_id
  instance_type = "t2.micro"

}
```

Resources describe infrastructure objects such as EC2 instances, VPCs, and DNS records. :contentReference[oaicite:4]{index=4}

---

## 2. Terraform Compatibility

OpenTofu supports:
- Terraform syntax
- Terraform modules
- Terraform providers

Most Terraform configurations work directly with OpenTofu without changes. :contentReference[oaicite:5]{index=5}

---

## 3. State Management

OpenTofu uses state files to track infrastructure resources and changes. :contentReference[oaicite:6]{index=6}

State helps:
- Track resources
- Detect changes
- Manage dependencies
- Improve deployment performance

---

## 4. Provider Support

OpenTofu supports thousands of providers and modules. :contentReference[oaicite:7]{index=7}

Example provider configuration:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

# Installing OpenTofu

Install OpenTofu from:

:contentReference[oaicite:8]{index=8}

OpenTofu supports:
- Windows
- Linux
- macOS
- Docker
- Package Managers

---

# Verify Installation

```bash
tofu version
```

---

# Example OpenTofu Configuration

```hcl
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "OpenTofu-Server"
  }
}
```

---

# Features

- OpenTofu Infrastructure Automation
- AWS EC2 Deployment
- Terraform-Compatible Syntax
- Infrastructure as Code (IaC)
- Open Source Infrastructure Management
- Reusable Infrastructure Configurations

---

# Prerequisites

Before running this project, install:

## 1. OpenTofu

:contentReference[oaicite:9]{index=9}

---

## 2. AWS CLI

:contentReference[oaicite:10]{index=10}

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

# OpenTofu Workflow

## Initialize OpenTofu

```bash
tofu init
```

This downloads:
- Providers
- Modules
- Dependencies

---

## Validate Configuration

```bash
tofu validate
```

---

## Preview Infrastructure

```bash
tofu plan
```

---

## Deploy Infrastructure

```bash
tofu apply
```

Type:

```bash
yes
```

to confirm deployment.

---

## Destroy Infrastructure

```bash
tofu destroy
```

---

# Example Variables

Example `terraform.tfvars`

```hcl
region         = "ap-south-1"
instance_type  = "t2.micro"
ami_id         = "ami-xxxxxxxx"
```

---

# Important OpenTofu Commands

```bash
tofu init
tofu fmt
tofu validate
tofu plan
tofu apply
tofu destroy
tofu output
```

---

# Difference Between Terraform and OpenTofu

| Feature | Terraform | OpenTofu |
|---|---|---|
| License | BUSL | MPL 2.0 |
| Governance | HashiCorp | Linux Foundation |
| Open Source | Limited | Fully Open Source |
| Terraform Compatibility | Native | Compatible |
| Community Driven | Partial | Yes |

OpenTofu was created to maintain a fully open-source Infrastructure as Code ecosystem. :contentReference[oaicite:11]{index=11}

---

# Learning Outcomes

By completing this project, you will understand:

- OpenTofu Basics
- Infrastructure as Code (IaC)
- AWS Infrastructure Automation
- Terraform Compatibility
- Open Source Infrastructure Management
- Infrastructure Deployment Workflows

---

# Advantages of OpenTofu

| Feature | Benefit |
|---|---|
| Open Source | Fully community-driven |
| Terraform Compatible | Easy migration |
| Automation | Faster infrastructure deployment |
| Reusability | Reusable modules and providers |
| Scalability | Supports large cloud environments |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Open Source Infrastructure Management
- Reusable Infrastructure Design
- Clean Configuration Structure
- Version Control with GitHub

---

# Repository Link

:contentReference[oaicite:12]{index=12}

---

# References

- OpenTofu Official Documentation  
  https://opentofu.org/docs/

- OpenTofu GitHub Repository  
  https://github.com/opentofu/opentofu

- OpenTofu Language Documentation  
  https://opentofu.org/docs/language/

- OpenTofu Installation Guide  
  https://opentofu.org/docs/intro/install/
