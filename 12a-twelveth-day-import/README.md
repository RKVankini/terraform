# Terraform Import Project

This project demonstrates how to use Terraform Import to bring existing AWS infrastructure resources under Terraform management.

Terraform Import helps manage resources that were:
- Created manually from AWS Console
- Created outside Terraform
- Already running in production
- Not previously managed using Infrastructure as Code (IaC)

Terraform import updates the Terraform state file and allows Terraform to manage existing infrastructure resources. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
12a-twelveth-day-import/
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

# What is Terraform Import?

Terraform Import allows existing cloud resources to be imported into Terraform state management.

Terraform does not automatically create the `.tf` configuration during import.  
You must manually write the Terraform resource block before importing. :contentReference[oaicite:1]{index=1}

---

# Why Use Terraform Import?

Terraform Import is useful when:
- Migrating manually created infrastructure to Terraform
- Managing existing AWS resources using IaC
- Recovering lost Terraform state
- Bringing production infrastructure under version control

Terraform Import helps organizations adopt Infrastructure as Code incrementally. :contentReference[oaicite:2]{index=2}

---

# Terraform Import Workflow

## Step 1: Create Resource Block

Example:

```hcl
resource "aws_instance" "example" {

  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"

}
```

---

## Step 2: Initialize Terraform

```bash
terraform init
```

---

## Step 3: Import Existing Resource

Syntax:

```bash
terraform import RESOURCE_TYPE.NAME RESOURCE_ID
```

Example:

```bash
terraform import aws_instance.example i-0123456789abcdef0
```

Terraform imports the existing EC2 instance into the Terraform state file. :contentReference[oaicite:3]{index=3}

---

# Example Import Commands

## Import EC2 Instance

```bash
terraform import aws_instance.example i-0123456789abcdef0
```

---

## Import Security Group

```bash
terraform import aws_security_group.example sg-0123456789abcdef0
```

---

## Import S3 Bucket

```bash
terraform import aws_s3_bucket.example my-bucket-name
```

---

# Import Block (Terraform 1.5+)

Terraform also supports configuration-driven import using `import` blocks.

Example:

```hcl
import {
  to = aws_instance.example
  id = "i-0123456789abcdef0"
}
```

Terraform 1.5 introduced import blocks for easier import workflows. :contentReference[oaicite:4]{index=4}

---

# Generate Configuration Automatically

Terraform can generate configuration using:

```bash
terraform plan -generate-config-out=generated.tf
```

This helps generate starter Terraform code for imported resources. :contentReference[oaicite:5]{index=5}

---

# Features

- Terraform Import
- Existing Infrastructure Management
- AWS Resource Import
- Terraform State Management
- Infrastructure as Code (IaC)
- Incremental Terraform Adoption

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

## Import Existing Resource

```bash
terraform import aws_instance.example i-0123456789abcdef0
```

---

## Check Terraform State

```bash
terraform state list
```

---

## Preview Infrastructure

```bash
terraform plan
```

---

# Important Terraform Commands

```bash
terraform init
terraform validate
terraform fmt
terraform import
terraform state list
terraform plan
terraform apply
terraform destroy
```

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform Import
- Terraform State Management
- Existing Infrastructure Migration
- AWS Resource Management
- Infrastructure as Code (IaC)
- Terraform Import Best Practices

---

# Advantages of Terraform Import

| Feature | Benefit |
|---|---|
| Existing Resource Management | Manage old infrastructure using Terraform |
| Incremental Adoption | Move to IaC gradually |
| State Recovery | Restore Terraform state |
| Automation | Centralized infrastructure management |
| Version Control | Infrastructure tracking with Git |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Terraform State Management
- Existing Infrastructure Automation
- Version Control with GitHub
- Clean Terraform Structure

---

# Repository Link

:contentReference[oaicite:6]{index=6}

---

# References

- Terraform Import Documentation  
  https://developer.hashicorp.com/terraform/cli/import

- Terraform Import Workflow  
  https://developer.hashicorp.com/terraform/language/import

- Terraform Import Command  
  https://developer.hashicorp.com/terraform/cli/commands/import

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
