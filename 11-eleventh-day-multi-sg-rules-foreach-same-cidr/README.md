# Terraform Multi Security Group Rules using for_each

This project demonstrates how to create multiple AWS Security Group rules dynamically using Terraform `for_each` with the same CIDR block.

Using `for_each` helps automate repetitive security group rule creation and reduces duplicate Terraform code.

This project is useful for:
- AWS Networking
- Security Group Automation
- Terraform Iteration Concepts
- Infrastructure as Code (IaC)

---

# Project Structure

```bash
11-eleventh-day-multi-sg-rules-foreach-same-cidr/
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

Terraform `for_each` is used to create multiple resources dynamically from a map or set of values.

Example:

```hcl
for_each = toset(["22", "80", "443"])
```

This creates multiple resources automatically.

---

# Project Objective

The goal of this project is to:
- Create multiple Security Group rules
- Use same CIDR block for all rules
- Avoid writing repetitive code
- Learn Terraform iteration concepts

---

# Example Security Group Rules

This project creates rules like:

| Port | Protocol | Purpose |
|---|---|---|
| 22 | TCP | SSH Access |
| 80 | TCP | HTTP Access |
| 443 | TCP | HTTPS Access |

Using same CIDR:

```hcl
0.0.0.0/0
```

---

# Example Terraform Code

```hcl
resource "aws_security_group_rule" "multi_ports" {

  for_each = toset(["22", "80", "443"])

  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}
```

---

# Features

- Dynamic Security Group Rule Creation
- Terraform `for_each`
- AWS Security Group Automation
- Reusable Infrastructure Code
- Reduced Duplicate Code
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
- Terraform Iteration Concepts
- Infrastructure Automation
- Infrastructure as Code Best Practices

---

# Advantages of using for_each

| Feature | Benefit |
|---|---|
| Automation | Creates multiple resources automatically |
| Reusability | Less repetitive code |
| Scalability | Easy to add more rules |
| Maintainability | Cleaner Terraform files |
| Flexibility | Dynamic infrastructure creation |

---

# Best Practices Used

- Dynamic Infrastructure Creation
- Reusable Terraform Code
- Clean Terraform Structure
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/11-eleventh-day-multi-sg-rules-foreach-same-cidr

---

# References

- Terraform for_each Documentation  
  https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

- AWS Security Group Documentation  
  https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html

- Terraform AWS Provider  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
