# Terraform Modules

This repository demonstrates how to create and use Terraform Modules for organizing, reusing, and managing infrastructure code efficiently.

Terraform Modules help:
- Reduce code duplication
- Improve maintainability
- Organize infrastructure
- Reuse configurations
- Build scalable Infrastructure as Code (IaC)

A module is a collection of Terraform configuration files that are used together as a reusable unit. :contentReference[oaicite:0]{index=0}

---

# Repository Structure

```bash
9ninth-day-modules/
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
- AWS EC2
- AWS VPC
- Linux
- Git & GitHub

---

# What is a Terraform Module?

A Terraform Module is a container for multiple Terraform resources that are used together.

Modules help create reusable infrastructure components such as:
- VPC
- EC2
- RDS
- Security Groups
- Load Balancers

Terraform modules allow infrastructure to be organized into reusable building blocks. :contentReference[oaicite:1]{index=1}

---

# Types of Terraform Modules

| Module Type | Description |
|---|---|
| Root Module | Main Terraform configuration |
| Child Module | Module called by another module |
| Local Module | Stored locally |
| Remote Module | Stored in GitHub or Terraform Registry |

Every Terraform configuration contains at least one root module. :contentReference[oaicite:2]{index=2}

---

# Why Use Modules?

Without modules:

```hcl
resource "aws_instance" "web1" {}
resource "aws_instance" "web2" {}
resource "aws_instance" "web3" {}
```

Infrastructure becomes:
- Repetitive
- Hard to maintain
- Difficult to scale

Using modules:

```hcl
module "ec2" {
  source = "./modules/ec2"
}
```

The same infrastructure can be reused multiple times with different variable values. :contentReference[oaicite:3]{index=3}

---

# Example EC2 Module

## modules/ec2/main.tf

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-Module-Server"
  }
}
```

---

## modules/ec2/variables.tf

```hcl
variable "ami_id" {}

variable "instance_type" {}
```

---

## modules/ec2/outputs.tf

```hcl
output "instance_id" {
  value = aws_instance.web.id
}
```

---

# Calling the Module

The root module calls the child module.

## main.tf

```hcl
module "ec2" {

  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
}
```

The `source` argument tells Terraform where the module is located. :contentReference[oaicite:4]{index=4}

---

# Passing Variables to Module

Example:

```hcl
module "ec2" {

  source = "./modules/ec2"

  ami_id        = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
```

Input variables allow modules to be reusable and flexible. :contentReference[oaicite:5]{index=5}

---

# Using Module Outputs

Example:

```hcl
output "server_id" {
  value = module.ec2.instance_id
}
```

Module outputs expose values from child modules back to the root module. :contentReference[oaicite:6]{index=6}

---

# Example VPC Module

## modules/vpc/main.tf

```hcl
resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = "Terraform-VPC"
  }
}
```

---

## modules/vpc/variables.tf

```hcl
variable "vpc_cidr" {}
```

---

## modules/vpc/outputs.tf

```hcl
output "vpc_id" {
  value = aws_vpc.main.id
}
```

---

# Calling Multiple Modules

```hcl
module "vpc" {

  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "ec2" {

  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = "t2.micro"
}
```

Terraform allows multiple modules to be combined together inside a root module. :contentReference[oaicite:7]{index=7}

---

# Example Architecture

```text
Root Module
    │
    ├── VPC Module
    │
    └── EC2 Module
```

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform downloads:
- Providers
- Modules
- Dependencies

Terraform automatically installs module dependencies during initialization. :contentReference[oaicite:8]{index=8}

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

- Terraform Modules
- Root and Child Modules
- Reusable Infrastructure Code
- Variable Passing
- Module Outputs
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- Terraform Modules
- Root Modules
- Child Modules
- Module Reusability
- Variable Passing
- Infrastructure as Code Best Practices

---

# Advantages of Modules

| Feature | Benefit |
|---|---|
| Reusability | Reuse infrastructure code |
| Scalability | Manage large environments |
| Maintainability | Easier updates |
| Organization | Cleaner Terraform structure |
| Flexibility | Environment-specific deployments |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Modular Terraform Design
- Reusable Infrastructure Components
- Clean Directory Structure
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/9ninth-day-modules)

---

# References

- Terraform Modules Documentation  
  https://developer.hashicorp.com/terraform/language/modules

- Terraform Module Block Reference  
  https://developer.hashicorp.com/terraform/language/block/module

- Terraform Creating Modules  
  https://developer.hashicorp.com/terraform/language/modules/develop

- AWS Terraform Modules Guide  
  https://docs.aws.amazon.com/prescriptive-guidance/latest/getting-started-terraform/modules.html

- Terraform Registry Modules  
  https://registry.terraform.io/browse/modules
