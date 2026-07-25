# Terraform Conditions Practice

This project demonstrates how to use Terraform Conditional Expressions for creating dynamic and flexible infrastructure configurations.

Terraform conditions allow infrastructure behavior to change based on:
- Variable values
- Environment selection
- Resource availability
- Boolean conditions
- User inputs

Conditional expressions help reduce duplicate code and improve infrastructure automation. Terraform conditional expressions use the syntax `condition ? true_val : false_val`. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
14b-forteenth-day-conditions/
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

# What are Terraform Conditions?

Terraform Conditions are expressions that evaluate a condition and return different values based on whether the condition is true or false.

Terraform uses:
- Ternary operators
- Logical operators
- Comparison operators
- Conditional resource creation

Conditional expressions make Terraform configurations dynamic and reusable. :contentReference[oaicite:1]{index=1}

---

# Terraform Conditional Syntax

```hcl
condition ? true_value : false_value
```

If the condition is:
- `true` → Terraform returns `true_value`
- `false` → Terraform returns `false_value`

Terraform evaluates boolean expressions to determine which value to return. :contentReference[oaicite:2]{index=2}

---

# Example Conditional Expression

```hcl
instance_type = var.environment == "prod" ? "t2.medium" : "t2.micro"
```

Explanation:
- If environment is `prod`
  → Instance type becomes `t2.medium`
- Otherwise
  → Instance type becomes `t2.micro`

---

# Example Terraform Resource

```hcl
resource "aws_instance" "example" {

  ami = var.ami_id

  instance_type = var.environment == "prod" ? "t2.medium" : "t2.micro"

  tags = {
    Environment = var.environment
  }
}
```

This creates:
- Larger instances for production
- Smaller instances for development/testing

---

# Using Conditions with count

Terraform conditions are commonly used with `count` for conditional resource creation.

Example:

```hcl
resource "aws_instance" "web" {

  count = var.create_instance ? 1 : 0

  ami           = var.ami_id
  instance_type = "t2.micro"
}
```

Explanation:
- If `create_instance = true`
  → Resource is created
- If `false`
  → Resource is skipped

Terraform uses `count` as a common conditional resource creation technique. :contentReference[oaicite:3]{index=3}

---

# Using Logical Operators

Terraform supports:
- `&&` → AND
- `||` → OR
- `!` → NOT

Example:

```hcl
condition = var.environment != "" && var.environment == "prod"
```

Terraform logical operators help combine multiple conditions together. :contentReference[oaicite:4]{index=4}

---

# Using Conditions with Locals

Example:

```hcl
locals {
  instance_size = var.environment == "prod" ? "large" : "small"
}
```

Access using:

```hcl
local.instance_size
```

---

# Variable Validation Conditions

Terraform supports custom validation rules for variables.

Example:

```hcl
variable "environment" {

  type = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}
```

Terraform validations help enforce configuration standards. :contentReference[oaicite:5]{index=5}

---

# Features

- Terraform Conditional Expressions
- Dynamic Infrastructure Configuration
- Conditional Resource Creation
- Variable Validation
- Environment-Based Deployments
- Infrastructure as Code (IaC)

---

# Advantages of Terraform Conditions

| Feature | Benefit |
|---|---|
| Flexibility | Dynamic infrastructure behavior |
| Reusability | Same code for multiple environments |
| Automation | Automated decision making |
| Reduced Duplication | Cleaner Terraform code |
| Scalability | Easier infrastructure management |

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
region        = "ap-south-1"
environment   = "dev"
ami_id        = "ami-xxxxxxxx"
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

- Terraform Conditional Expressions
- Ternary Operators
- Logical Operators
- Conditional Resource Creation
- Variable Validation
- Infrastructure as Code Best Practices

---

# Best Practices Used

- Dynamic Infrastructure Design
- Environment-Based Configuration
- Reusable Terraform Code
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/14b-forteenth-day-conditions

---

# References

- Terraform Conditional Expressions Documentation  
  https://developer.hashicorp.com/terraform/language/expressions/conditionals

- Terraform Validation Documentation  
  https://developer.hashicorp.com/terraform/language/validate

- Terraform Configuration Syntax  
  https://developer.hashicorp.com/terraform/language/syntax/configuration

- Terraform HCL Conditional Logic  
  https://blog.boltops.com/2020/10/03/terraform-hcl-conditional-logic/
