# Terraform tfvars

This repository demonstrates how to use `terraform.tfvars` files for managing input variable values in Terraform configurations.

Terraform `tfvars` files help separate:
- Variable declarations
- Variable values
- Environment-specific configurations

Using `terraform.tfvars` makes Terraform code:
- Reusable
- Flexible
- Easier to manage
- Cleaner and more organized

Terraform automatically loads `terraform.tfvars` files during execution. :contentReference[oaicite:0]{index=0}

---

# Repository Structure

```bash
3third-day-tfvars/
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

# What is terraform.tfvars?

The `terraform.tfvars` file is used to assign values to Terraform input variables.

Instead of hardcoding values directly inside resource blocks, Terraform allows values to be stored separately inside `.tfvars` files. :contentReference[oaicite:1]{index=1}

This improves:
- Reusability
- Environment management
- Code maintainability
- Infrastructure flexibility

---

# Variable Declaration Example

## variables.tf

```hcl
variable "ami_id" {}

variable "instance_type" {}

variable "region" {}
```

The `variables.tf` file defines input variables used by Terraform. :contentReference[oaicite:2]{index=2}

---

# Assign Variable Values

## terraform.tfvars

```hcl
ami_id        = "ami-xxxxxxxx"
instance_type = "t2.micro"
region        = "ap-south-1"
```

Terraform automatically reads values from `terraform.tfvars`. :contentReference[oaicite:3]{index=3}

---

# Using Variables in Terraform

## main.tf

```hcl
provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-Web-Server"
  }
}
```

Terraform variables are referenced using:

```hcl
var.variable_name
```

Example:

```hcl
var.instance_type
```

---

# Difference Between variables.tf and terraform.tfvars

| File | Purpose |
|---|---|
| variables.tf | Declares variables |
| terraform.tfvars | Assigns variable values |

`variables.tf` defines what inputs Terraform expects, while `terraform.tfvars` provides actual values during execution. :contentReference[oaicite:4]{index=4}

---

# Advantages of tfvars Files

| Feature | Benefit |
|---|---|
| Reusability | Same Terraform code reused with different values |
| Environment Management | Separate values for dev/test/prod |
| Flexibility | Easy configuration changes |
| Clean Code | Avoids hardcoded values |
| Scalability | Easier infrastructure expansion |

---

# Multiple tfvars Files

Terraform also supports multiple environment files.

Examples:

```bash
dev.tfvars
test.tfvars
prod.tfvars
```

Use specific variable files with:

```bash
terraform apply -var-file="dev.tfvars"
```

Terraform supports custom variable files using the `-var-file` option. :contentReference[oaicite:5]{index=5}

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform downloads:
- Providers
- Plugins
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

## Apply Using Custom tfvars File

```bash
terraform apply -var-file="dev.tfvars"
```

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
terraform fmt
terraform output
```

---

# Features

- Terraform Variables
- terraform.tfvars Usage
- Dynamic Infrastructure Configuration
- Reusable Terraform Code
- Environment-Based Deployments
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- Terraform Variables
- terraform.tfvars Files
- Variable Management
- Dynamic Infrastructure Configuration
- Environment-Specific Values
- Infrastructure as Code Basics

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Reusable Terraform Configurations
- Separate Variable Management
- Environment-Based Configuration
- Version Control with GitHub

---

# Repository Link

:contentReference[oaicite:6]{index=6}

---

# References

- Terraform Variables Documentation  
  https://developer.hashicorp.com/terraform/language/values/variables

- Terraform Variable Block Reference  
  https://developer.hashicorp.com/terraform/language/block/variable

- Terraform Variables Tutorial  
  https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables

- Terraform tfvars Guide  
  https://spacelift.io/blog/terraform-tfvars

- AWS Terraform Variables Guide  
  https://docs.aws.amazon.com/prescriptive-guidance/latest/getting-started-terraform/variables-locals-outputs.html
