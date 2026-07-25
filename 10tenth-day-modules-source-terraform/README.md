# Terraform Modules Source Project

This project demonstrates different ways to use the `source` argument in Terraform modules.

Terraform modules help organize infrastructure code into reusable components.  
Using the `source` argument, modules can be loaded from:

- Local paths
- GitHub repositories
- Terraform Registry
- Remote sources

This project helps understand how Terraform downloads and manages modules from different locations.

---

# Project Structure

```bash
10tenth-day-modules-source-terraform/
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

# Terraform Module Source

Terraform uses the `source` argument to identify the location of a module.

Example:

```hcl
module "ec2" {
  source = "./modules/ec2"
}
```

---

# Types of Module Sources

## 1. Local Module Source

Loads modules from the local project directory.

Example:

```hcl
module "vpc" {
  source = "./modules/vpc"
}
```

### Benefits
- Easy development
- Faster testing
- Good for small projects

---

## 2. GitHub Module Source

Terraform can download modules directly from GitHub repositories.

Example:

```hcl
module "ec2" {
  source = "github.com/username/repository-name"
}
```

### Benefits
- Centralized code
- Team collaboration
- Version control support

---

## 3. Terraform Registry Module Source

Terraform Registry provides officially published reusable modules.

Example:

```hcl
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
}
```

### Benefits
- Community maintained
- Production ready
- Saves development time

---

## 4. Remote Module Source

Modules can also be downloaded from remote storage systems.

Supported sources:
- Git
- Bitbucket
- S3
- HTTP URLs

Example:

```hcl
module "example" {
  source = "git::https://github.com/example/modules.git"
}
```

---

# Features

- Terraform Module Source Examples
- Local and Remote Modules
- GitHub Module Integration
- Terraform Registry Usage
- Reusable Infrastructure Components
- Infrastructure as Code (IaC)

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
- Region
- Output Format

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

This command:
- Downloads providers
- Downloads modules
- Initializes backend configuration

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
region         = "ap-south-1"
instance_type  = "t2.micro"
ami_id         = "ami-xxxxxxxx"
```

---

# Important Terraform Commands

```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
terraform destroy
terraform providers
```

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform Module Sources
- Local vs Remote Modules
- GitHub Module Integration
- Terraform Registry Usage
- Reusable Infrastructure Design
- AWS Infrastructure Automation

---

# Best Practices Used

- Modular Infrastructure Design
- Reusable Terraform Code
- Version Controlled Infrastructure
- Infrastructure as Code (IaC)
- Organized Terraform Structure

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/10tenth-day-modules-source-terraform

---

# References

- Terraform Modules Documentation  
  https://developer.hashicorp.com/terraform/language/modules

- Terraform Registry  
  https://registry.terraform.io/

- Terraform Module Sources  
  https://developer.hashicorp.com/terraform/language/modules/sources

- Terraform GitHub Repository  
  https://github.com/hashicorp/terraform
