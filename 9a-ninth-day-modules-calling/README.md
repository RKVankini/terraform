# Terraform Modules Calling

This repository demonstrates how to call and use Terraform Modules for creating reusable and organized infrastructure configurations.

Terraform Modules help:
- Reuse infrastructure code
- Reduce duplication
- Improve maintainability
- Organize Terraform configurations
- Build scalable Infrastructure as Code (IaC)

Modules are containers for multiple Terraform resources that are used together. :contentReference[oaicite:0]{index=0}

---

# Repository Structure

```bash
9a-ninth-day-modules-calling/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
│
├── modules/
│   └── ec2/
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
- Linux
- Git & GitHub

---

# What is a Terraform Module?

A Terraform Module is a collection of Terraform configuration files grouped together to perform a specific task.

Examples:
- EC2 Module
- VPC Module
- RDS Module
- Security Group Module

Terraform modules allow infrastructure code to be reused across multiple environments and projects. :contentReference[oaicite:1]{index=1}

---

# Why Use Modules?

Without modules:

```hcl
resource "aws_instance" "web1" {}
resource "aws_instance" "web2" {}
resource "aws_instance" "web3" {}
```

Infrastructure code becomes:
- Repetitive
- Difficult to manage
- Hard to scale

Using modules:

```hcl
module "ec2" {
  source = "./modules/ec2"
}
```

The same module can be reused multiple times with different values.

---

# Module Structure

Example:

```bash
modules/
└── ec2/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

A module generally contains:
- Resources
- Variables
- Outputs

Terraform treats every module as an independent infrastructure component. :contentReference[oaicite:2]{index=2}

---

# Example Child Module

## modules/ec2/main.tf

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Module-EC2"
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

The `source` argument tells Terraform where the module is located. Terraform modules can be stored locally, in Git repositories, or in the Terraform Registry. :contentReference[oaicite:3]{index=3}

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

Variables make modules reusable across different environments.

---

# Accessing Module Outputs

Example:

```hcl
output "server_id" {
  value = module.ec2.instance_id
}
```

Module outputs allow values from child modules to be used in the root module.

---

# Example Architecture

```text
Root Module
    │
    └── EC2 Module
            │
            ├── main.tf
            ├── variables.tf
            └── outputs.tf
```

---

# Types of Terraform Modules

| Module Type | Description |
|---|---|
| Root Module | Main Terraform configuration |
| Child Module | Module called by another module |
| Local Module | Stored locally |
| Remote Module | Stored in GitHub or Terraform Registry |

Terraform supports modules from local paths, Git repositories, and module registries. :contentReference[oaicite:4]{index=4}

---

# Example Remote Module

Example GitHub module:

```hcl
module "ec2" {

  source = "git::https://github.com/example/modules.git//ec2"
}
```

Terraform can download modules directly from Git repositories. :contentReference[oaicite:5]{index=5}

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

When modules are used, Terraform automatically downloads module code during initialization. :contentReference[oaicite:6]{index=6}

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
- Child Module Calling
- Reusable Infrastructure Code
- Variable Passing
- Module Outputs
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- Terraform Modules
- Root and Child Modules
- Module Reusability
- Variable Passing
- Output Management
- Infrastructure as Code Best Practices

---

# Advantages of Modules

| Feature | Benefit |
|---|---|
| Reusability | Reuse infrastructure code |
| Maintainability | Easier updates |
| Scalability | Manage larger infrastructures |
| Organization | Cleaner Terraform structure |
| Flexibility | Environment-specific deployments |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Modular Terraform Design
- Reusable Infrastructure Components
- Clean Code Organization
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/9a-ninth-day-modules-calling)

---

# References

- Terraform Modules Documentation  
  https://developer.hashicorp.com/terraform/language/modules

- Terraform Module Sources  
  https://developer.hashicorp.com/terraform/language/modules/sources

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- Terraform Git Module Sources  
  https://developer.hashicorp.com/terraform/language/modules/sources

- Terraform Language Documentation  
  https://developer.hashicorp.com/terraform/language
