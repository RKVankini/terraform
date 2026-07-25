# Terraform Multi Security Group Rules with Different CIDR Blocks

This project demonstrates how to create multiple AWS Security Group rules dynamically using Terraform `for_each` with different CIDR blocks.

Using `for_each` allows Terraform to create multiple security group rules efficiently without writing repetitive code.

This project is useful for understanding:
- AWS Security Groups
- Dynamic Infrastructure Creation
- Terraform Iteration
- Infrastructure as Code (IaC)

---

# Project Structure

```bash
11a-eleventh-day-multi-sg-rules-diff-cidr/
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

# Terraform Concept Used

## for_each

Terraform `for_each` is used to create multiple resources dynamically using maps or sets.

Example:

```hcl
for_each = {
  ssh   = "0.0.0.0/0"
  http  = "10.0.0.0/16"
  https = "192.168.1.0/24"
}
```

Each item creates a separate resource automatically.

---

# Project Objective

The goal of this project is to:
- Create multiple Security Group rules
- Use different CIDR blocks for each rule
- Reduce duplicate Terraform code
- Learn dynamic resource creation

---

# Example Security Group Rules

| Port | Protocol | CIDR Block | Purpose |
|---|---|---|---|
| 22 | TCP | 0.0.0.0/0 | SSH Access |
| 80 | TCP | 10.0.0.0/16 | HTTP Access |
| 443 | TCP | 192.168.1.0/24 | HTTPS Access |

---

# Example Terraform Code

```hcl
resource "aws_security_group_rule" "multi_rules" {

  for_each = {
    "22"  = "0.0.0.0/0"
    "80"  = "10.0.0.0/16"
    "443" = "192.168.1.0/24"
  }

  type              = "ingress"
  from_port         = each.key
  to_port           = each.key
  protocol          = "tcp"
  cidr_blocks       = [each.value]
  security_group_id = aws_security_group.main.id
}
```

---

# Features

- Dynamic Security Group Rule Creation
- Multiple CIDR Block Management
- Terraform `for_each`
- AWS Security Group Automation
- Infrastructure as Code (IaC)
- Reduced Repetitive Code

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
region = "ap-south-1"
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
terraform state list
```

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform `for_each`
- AWS Security Groups
- Dynamic Resource Creation
- Multiple CIDR Configurations
- Infrastructure Automation
- Infrastructure as Code Best Practices

---

# Advantages of using for_each

| Feature | Benefit |
|---|---|
| Automation | Creates multiple resources automatically |
| Scalability | Easy to add more rules |
| Maintainability | Cleaner Terraform code |
| Reusability | Less repetitive code |
| Flexibility | Supports dynamic configurations |

---

# Best Practices Used

- Dynamic Infrastructure Creation
- Reusable Terraform Code
- Clean Terraform Structure
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/11a-eleventh-day-multi-sg-rules-diff-cidr

---

# References

- Terraform for_each Documentation  
  https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

- AWS Security Group Documentation  
  https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
