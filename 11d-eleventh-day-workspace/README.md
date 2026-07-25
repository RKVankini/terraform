# Terraform Workspace Project

This project demonstrates how to use Terraform Workspaces to manage multiple environments using the same Terraform configuration.

Terraform workspaces allow you to create separate state files for environments like:
- Development (dev)
- Testing (test)
- Staging (stage)
- Production (prod)

This helps manage infrastructure efficiently without duplicating Terraform code. Terraform CLI workspaces create separate instances of state data within the same working directory. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
11d-eleventh-day-workspace/
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

# What are Terraform Workspaces?

Terraform workspaces allow multiple state files to exist within the same Terraform project.

Each workspace manages its own:
- Terraform state
- Infrastructure resources
- Variable values

Terraform starts with a default workspace named `default`. :contentReference[oaicite:1]{index=1}

---

# Why Use Workspaces?

Workspaces help:
- Separate environments
- Reuse same Terraform code
- Avoid duplicate project folders
- Manage dev/test/prod infrastructure easily

---

# Example Workspace Commands

## List Workspaces

```bash
terraform workspace list
```

---

## Create New Workspace

```bash
terraform workspace new dev
```

---

## Switch Workspace

```bash
terraform workspace select dev
```

---

## Show Current Workspace

```bash
terraform workspace show
```

---

## Delete Workspace

```bash
terraform workspace delete dev
```

---

# Example Terraform Code

```hcl
resource "aws_instance" "example" {

  ami           = var.ami_id
  instance_type = terraform.workspace == "prod" ? "t2.medium" : "t2.micro"

  tags = {
    Environment = terraform.workspace
  }
}
```

This configuration:
- Uses different instance types based on workspace
- Automatically tags resources with workspace name

Terraform provides `${terraform.workspace}` to access the current workspace name. :contentReference[oaicite:2]{index=2}

---

# Features

- Terraform Workspace Management
- Multiple Environment Deployment
- Separate State Management
- Dynamic Infrastructure Configuration
- Environment-Based Resource Creation
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
- AWS Region
- Output Format

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

---

## Create Workspace

```bash
terraform workspace new dev
```

---

## Select Workspace

```bash
terraform workspace select dev
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

# Example Workflow for Multiple Environments

## Create Development Environment

```bash
terraform workspace new dev
terraform apply
```

---

## Create Production Environment

```bash
terraform workspace new prod
terraform apply
```

Both environments use same Terraform code but maintain separate state files.

---

# Destroy Infrastructure

```bash
terraform destroy
```

---

# Example Variables

Example `terraform.tfvars`

```hcl
region         = "ap-south-1"
ami_id         = "ami-xxxxxxxx"
```

---

# Important Terraform Commands

```bash
terraform init
terraform workspace list
terraform workspace new dev
terraform workspace select dev
terraform workspace show
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform Workspaces
- State Management
- Multi-Environment Deployment
- Dynamic Infrastructure Configuration
- Infrastructure Automation
- Infrastructure as Code Best Practices

---

# Advantages of Workspaces

| Feature | Benefit |
|---|---|
| Environment Separation | Separate dev/test/prod infrastructure |
| Reusability | Same Terraform code for all environments |
| Simplicity | Avoid duplicate Terraform folders |
| State Isolation | Separate state files for each environment |
| Scalability | Easy environment management |

---

# Best Practices Used

- Environment-Based Infrastructure
- Reusable Terraform Code
- Separate Terraform States
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/11d-eleventh-day-workspace

---

# References

- Terraform Workspace Documentation  
  https://developer.hashicorp.com/terraform/cli/workspaces

- Terraform State and Workspaces  
  https://developer.hashicorp.com/terraform/language/state/workspaces

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
