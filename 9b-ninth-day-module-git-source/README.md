# Terraform Module Git Source

This repository demonstrates how to use Terraform Modules directly from Git repositories using the `source` argument.

Terraform supports downloading modules from:
- GitHub repositories
- GitLab repositories
- Bitbucket repositories
- Private Git repositories
- Public Git repositories

Using Git-based modules helps:
- Reuse infrastructure code
- Centralize module management
- Share modules across teams
- Maintain version-controlled infrastructure

Terraform can download and install modules directly from Git repositories during initialization. :contentReference[oaicite:0]{index=0}

---

# Repository Structure

```bash
9b-ninth-day-module-git-source/
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
- Git
- GitHub
- Linux
- Git & GitHub

---

# What is a Git Source Module?

A Git Source Module is a Terraform module stored inside a Git repository and downloaded using the `source` argument.

Instead of using a local path:

```hcl
module "ec2" {
  source = "./modules/ec2"
}
```

Terraform can directly download the module from Git:

```hcl
module "ec2" {
  source = "git::https://github.com/user/terraform-modules.git//ec2"
}
```

Terraform clones module source code into a hidden directory during initialization. :contentReference[oaicite:1]{index=1}

---

# Why Use Git Modules?

Git-based modules provide:

| Feature | Benefit |
|---|---|
| Reusability | Reuse modules across projects |
| Version Control | Track infrastructure changes |
| Collaboration | Share modules across teams |
| Centralization | Store modules in one repository |
| Scalability | Easier infrastructure management |

---

# Example Git Module Source

```hcl
module "ec2" {

  source = "git::https://github.com/example/terraform-modules.git//ec2"

  ami_id        = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
```

Explanation:

- `git::` → Tells Terraform to use Git
- Repository URL → Git repository location
- `//ec2` → Module folder inside repository

Terraform supports module installation directly from Git repositories. :contentReference[oaicite:2]{index=2}

---

# Using Module from GitHub

Example:

```hcl
module "vpc" {

  source = "git::https://github.com/example/terraform-modules.git//vpc"

}
```

Terraform downloads the VPC module from GitHub during:

```bash
terraform init
```

---

# Using Specific Git Branch

Example:

```hcl
module "vpc" {

  source = "git::https://github.com/example/terraform-modules.git//vpc?ref=develop"

}
```

The `ref` argument tells Terraform which branch to use. :contentReference[oaicite:3]{index=3}

---

# Using Specific Git Tag

Example:

```hcl
module "vpc" {

  source = "git::https://github.com/example/terraform-modules.git//vpc?ref=v1.0.0"

}
```

This downloads the module from a specific version tag. :contentReference[oaicite:4]{index=4}

---

# Using Specific Commit

Example:

```hcl
module "vpc" {

  source = "git::https://github.com/example/terraform-modules.git//vpc?ref=51d462976"

}
```

Using commit hashes provides immutable module versions. :contentReference[oaicite:5]{index=5}

---

# Example Terraform Configuration

## provider.tf

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

## main.tf

```hcl
module "ec2" {

  source = "git::https://github.com/example/terraform-modules.git//ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
}
```

---

# Module Source Syntax

Basic syntax:

```hcl
source = "git::https://github.com/ORG/REPO.git//MODULE_PATH"
```

Example:

```hcl
source = "git::https://github.com/company/terraform-modules.git//ec2"
```

Syntax structure:

```text
git::https://github.com/org/repo.git//module-path?ref=version
```

Components:

| Component | Description |
|---|---|
| git:: | Git protocol identifier |
| Repository URL | Git repository location |
| //module-path | Module directory |
| ?ref= | Branch, tag, or commit |

Terraform supports Git URLs with module subdirectories and version references. :contentReference[oaicite:6]{index=6}

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform:
- Downloads providers
- Downloads Git modules
- Creates module cache

Module code is automatically downloaded during initialization. :contentReference[oaicite:7]{index=7}

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

---

# Example Architecture

```text
Terraform Root Module
          │
          │
          ▼
Git Repository
          │
          ▼
Terraform Module
          │
          ▼
AWS Resources
```

---

# Important Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
terraform output
terraform fmt
```

---

# Features

- Terraform Git Modules
- GitHub Module Sources
- Branch-Based Modules
- Tag-Based Modules
- Commit-Based Modules
- Reusable Infrastructure Code
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- Terraform Git Module Sources
- Module Reusability
- Git-Based Infrastructure Modules
- Module Versioning
- Remote Module Management
- Infrastructure as Code Best Practices

---

# Advantages of Git Source Modules

| Feature | Benefit |
|---|---|
| Centralized Modules | Easy management |
| Version Control | Track module changes |
| Reusability | Reuse modules everywhere |
| Collaboration | Team-friendly infrastructure |
| Scalability | Supports large projects |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Git-Based Module Management
- Reusable Infrastructure Design
- Version-Controlled Modules
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/9b-ninth-day-module-git-source)

---

# References

- Terraform Module Documentation  
  https://developer.hashicorp.com/terraform/language/modules

- Terraform Module Source Documentation  
  https://developer.hashicorp.com/terraform/language/modules/sources

- Terraform Module Block Reference  
  https://developer.hashicorp.com/terraform/language/block/module

- Terraform Git Module Sources  
  https://developer.hashicorp.com/terraform/language/modules/sources

- Terraform Official Documentation  
  https://developer.hashicorp.com/terraform
