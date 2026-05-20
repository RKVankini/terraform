# Terraform Environment-Based Dev, Test, and Prod Modules Project

This project demonstrates how to use Terraform Modules for managing multiple environments such as:

- Development (dev)
- Testing (test)
- Production (prod)

The project follows a modular Infrastructure as Code (IaC) approach where reusable Terraform modules are used across different environments.

This helps:
- Avoid duplicate code
- Maintain separate environments
- Improve scalability
- Simplify infrastructure management

Terraform modules allow reusable and organized infrastructure configurations. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/modules?utm_source=chatgpt.com))

---

# Project Structure

```bash
12b-twelveth-day-terraform-env-dev-test-prod-modules/
│
├── dev/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
│
├── test/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
│
├── prod/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
│
├── modules/
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── provider.tf
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- Linux
- Git & GitHub

---

# Project Objective

The goal of this project is to:
- Create reusable Terraform modules
- Manage multiple environments
- Separate dev/test/prod infrastructure
- Improve Terraform code organization
- Learn modular Infrastructure as Code

---

# What are Terraform Modules?

Terraform modules are reusable infrastructure components.

A module can contain:
- EC2 instances
- VPCs
- Security Groups
- RDS Databases
- Load Balancers

Modules improve:
- Reusability
- Scalability
- Maintainability

---

# Example Module Usage

```hcl
module "ec2" {

  source = "../modules/ec2"

  ami_id         = var.ami_id
  instance_type  = var.instance_type
  environment    = var.environment
}
```

Terraform modules are loaded using the `source` argument. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/modules/sources?utm_source=chatgpt.com))

---

# Environment-Based Infrastructure

Each environment has:
- Separate variable files
- Separate Terraform state
- Separate infrastructure configuration

Example:

| Environment | Purpose |
|---|---|
| dev | Development and testing |
| test | QA and validation |
| prod | Production workload |

---

# Example Variables

## Dev Environment

```hcl
instance_type = "t2.micro"
environment   = "dev"
```

---

## Production Environment

```hcl
instance_type = "t2.medium"
environment   = "prod"
```

This allows infrastructure customization based on environment.

---

# Features

- Terraform Modules
- Multi-Environment Infrastructure
- Dev/Test/Prod Setup
- Reusable Infrastructure Code
- Environment Separation
- Infrastructure as Code (IaC)

---

# Advantages of Environment-Based Modules

| Feature | Benefit |
|---|---|
| Reusability | Same module used across environments |
| Scalability | Easy infrastructure expansion |
| Maintainability | Cleaner Terraform structure |
| Environment Isolation | Separate infrastructure per environment |
| Consistency | Standardized deployments |

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

## Navigate to Environment Folder

Example:

```bash
cd dev
```

---

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

# Example Workflow

## Deploy Development Environment

```bash
cd dev
terraform init
terraform apply
```

---

## Deploy Test Environment

```bash
cd test
terraform init
terraform apply
```

---

## Deploy Production Environment

```bash
cd prod
terraform init
terraform apply
```

Each environment uses the same reusable module with different variables.

---

# Destroy Infrastructure

```bash
terraform destroy
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

- Terraform Modules
- Multi-Environment Infrastructure
- Dev/Test/Prod Architecture
- Reusable Infrastructure Design
- Infrastructure Automation
- Infrastructure as Code Best Practices

---

# Best Practices Used

- Modular Infrastructure Design
- Environment Separation
- Reusable Terraform Code
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/12b-twelveth-day-terraform-env-dev-test-prod-modules

---

# References

- Terraform Modules Documentation  
  https://developer.hashicorp.com/terraform/language/modules

- Terraform Module Sources  
  https://developer.hashicorp.com/terraform/language/modules/sources

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
