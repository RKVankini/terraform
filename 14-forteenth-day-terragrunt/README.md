# Terragrunt Project

This project demonstrates how to use Terragrunt with Terraform for managing reusable, scalable, and DRY (Don’t Repeat Yourself) infrastructure code.

Terragrunt is a thin wrapper around Terraform that provides:
- Better code reusability
- Environment management
- Remote state automation
- Dependency management
- DRY Terraform configurations

Terragrunt helps scale Infrastructure as Code (IaC) for real-world production environments. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
14-forteenth-day-terragrunt/
│
├── terragrunt.hcl
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
- Terragrunt
- Amazon Web Services (AWS)
- Linux
- Git & GitHub

---

# What is Terragrunt?

Terragrunt is a wrapper tool for Terraform that reduces code duplication and simplifies infrastructure management. :contentReference[oaicite:1]{index=1}

Terragrunt provides features like:
- DRY configurations
- Remote state management
- Environment management
- Dependency handling
- Module orchestration

Terragrunt is commonly used in large-scale DevOps and Cloud Infrastructure projects. :contentReference[oaicite:2]{index=2}

---

# Why Use Terragrunt?

Managing multiple Terraform environments can create:
- Duplicate code
- Complex configurations
- Difficult state management

Terragrunt solves these problems by:
- Reusing Terraform modules
- Centralizing configurations
- Managing remote state automatically
- Simplifying environment deployment

Terragrunt is designed to keep Terraform/OpenTofu code DRY. :contentReference[oaicite:3]{index=3}

---

# Example Terragrunt Configuration

Example `terragrunt.hcl`

```hcl
terraform {
  source = "./modules/ec2"
}

inputs = {
  instance_type = "t2.micro"
  ami_id        = "ami-xxxxxxxx"
}
```

The `source` parameter tells Terragrunt where to download or locate Terraform modules. :contentReference[oaicite:4]{index=4}

---

# Terragrunt Features

## 1. DRY Infrastructure Code

Terragrunt reduces duplicate Terraform code across environments.

Example:
- dev
- test
- prod

can all reuse the same Terraform modules.

---

## 2. Remote State Management

Terragrunt can automatically configure Terraform remote state.

Example:

```hcl
remote_state {
  backend = "s3"

  config = {
    bucket = "terraform-state-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
```

---

## 3. Environment Management

Terragrunt makes managing multiple environments easier.

Example structure:

```bash
live/
├── dev/
├── test/
└── prod/
```

Terragrunt units help create isolated and reproducible infrastructure deployments. :contentReference[oaicite:5]{index=5}

---

## 4. Module Reusability

Terragrunt works efficiently with reusable Terraform modules.

Example:

```hcl
terraform {
  source = "git::https://github.com/example/modules.git//ec2"
}
```

Terragrunt supports:
- Local modules
- GitHub modules
- Registry modules
- Remote modules :contentReference[oaicite:6]{index=6}

---

# Example Multi-Environment Structure

```bash
live/
├── dev/
│   └── terragrunt.hcl
│
├── test/
│   └── terragrunt.hcl
│
└── prod/
    └── terragrunt.hcl
```

Each environment can use:
- Same Terraform module
- Different variable values
- Separate Terraform state

---

# Features

- Terragrunt Integration
- DRY Terraform Configurations
- Remote State Management
- Multi-Environment Deployment
- Reusable Terraform Modules
- Infrastructure as Code (IaC)

---

# Prerequisites

Before running this project, install:

## 1. Terraform

https://developer.hashicorp.com/terraform

---

## 2. Terragrunt

https://terragrunt.gruntwork.io/

Terragrunt installation documentation: :contentReference[oaicite:7]{index=7}

---

## 3. AWS CLI

https://aws.amazon.com/cli/

---

## 4. Configure AWS Credentials

```bash
aws configure
```

Provide:
- AWS Access Key
- AWS Secret Key
- AWS Region
- Output Format

---

# Terragrunt Workflow

## Initialize Terragrunt

```bash
terragrunt init
```

Terragrunt automatically downloads Terraform modules into `.terragrunt-cache`. :contentReference[oaicite:8]{index=8}

---

## Validate Configuration

```bash
terragrunt validate
```

---

## Preview Infrastructure

```bash
terragrunt plan
```

---

## Deploy Infrastructure

```bash
terragrunt apply
```

Type:

```bash
yes
```

to confirm deployment.

---

## Destroy Infrastructure

```bash
terragrunt destroy
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

# Important Terragrunt Commands

```bash
terragrunt init
terragrunt validate
terragrunt plan
terragrunt apply
terragrunt destroy
terragrunt run-all apply
terragrunt run-all destroy
```

---

# Difference Between Terraform and Terragrunt

| Feature | Terraform | Terragrunt |
|---|---|---|
| Infrastructure Provisioning | Yes | Uses Terraform |
| DRY Support | Limited | Strong |
| Multi-Environment Management | Manual | Simplified |
| Remote State Automation | Manual | Automated |
| Dependency Management | Limited | Better Support |
| Module Reusability | Yes | Enhanced |

---

# Learning Outcomes

By completing this project, you will understand:

- Terragrunt Basics
- Terraform + Terragrunt Integration
- DRY Infrastructure Design
- Multi-Environment Infrastructure
- Remote State Management
- Infrastructure as Code Best Practices

---

# Advantages of Terragrunt

| Feature | Benefit |
|---|---|
| DRY Configurations | Reduces duplicate code |
| Scalability | Easier large infrastructure management |
| Reusability | Reuse Terraform modules |
| Environment Isolation | Separate dev/test/prod infrastructure |
| Automation | Simplifies Terraform workflows |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- DRY Terraform Design
- Reusable Infrastructure Modules
- Environment Separation
- Version Control with GitHub

---

# Repository Link

:contentReference[oaicite:9]{index=9}

---

# References

- Terragrunt Official Documentation  
  https://terragrunt.gruntwork.io/docs/

- Terragrunt GitHub Repository  
  https://github.com/gruntwork-io/terragrunt

- Terraform Modules Documentation  
  https://developer.hashicorp.com/terraform/language/modules

- Terragrunt Units Documentation  
  https://terragrunt.gruntwork.io/docs/features/units
