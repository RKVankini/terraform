# Terraform Count and for_each Project

This project demonstrates how to use Terraform `count` and `for_each` meta-arguments for creating multiple resources dynamically in AWS infrastructure.

Both `count` and `for_each` help automate infrastructure creation and reduce repetitive Terraform code.

This project helps understand:
- Dynamic Resource Creation
- Terraform Iteration Concepts
- Infrastructure Automation
- Infrastructure as Code (IaC)

---

# Project Structure

```bash
12-twelveth-day-count-foreach/
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

# Terraform Meta-Arguments Covered

## 1. count

Terraform `count` creates multiple copies of the same resource using a numeric value.

Example:

```hcl
resource "aws_instance" "server" {

  count = 3

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "Server-${count.index}"
  }
}
```

This creates:
- Server-0
- Server-1
- Server-2

---

## 2. for_each

Terraform `for_each` creates resources dynamically using maps or sets.

Example:

```hcl
resource "aws_instance" "server" {

  for_each = toset(["dev", "test", "prod"])

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}
```

This creates:
- dev
- test
- prod

---

# Difference Between count and for_each

| Feature | count | for_each |
|---|---|---|
| Input Type | Number | Map or Set |
| Resource Access | count.index | each.key / each.value |
| Best Use Case | Identical resources | Unique resources |
| Flexibility | Limited | More flexible |
| Readability | Simple | Better for dynamic configs |

---

# Project Objective

The goal of this project is to:
- Learn Terraform iteration techniques
- Create multiple AWS resources dynamically
- Reduce duplicate code
- Understand `count` vs `for_each`

---

# Features

- Terraform `count`
- Terraform `for_each`
- Dynamic AWS Resource Creation
- Automated Infrastructure Deployment
- Reusable Terraform Code
- Infrastructure as Code (IaC)

---

# Example Use Cases

## Using count
- Create multiple EC2 instances
- Create repeated resources
- Scale identical infrastructure

---

## Using for_each
- Create resources with different names
- Dynamic security group rules
- Environment-based resources

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
region         = "ap-south-1"
instance_type  = "t2.micro"
ami_id         = "ami-xxxxxxxx"
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

- Terraform `count`
- Terraform `for_each`
- Dynamic Resource Creation
- AWS Infrastructure Automation
- Infrastructure Scaling
- Infrastructure as Code Best Practices

---

# Advantages of count and for_each

| Feature | Benefit |
|---|---|
| Automation | Creates multiple resources automatically |
| Scalability | Easy infrastructure expansion |
| Reusability | Less repetitive code |
| Maintainability | Cleaner Terraform configuration |
| Flexibility | Dynamic infrastructure creation |

---

# Best Practices Used

- Dynamic Infrastructure Design
- Reusable Terraform Code
- Clean Terraform Structure
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/12-twelveth-day-count-foreach

---

# References

- Terraform count Documentation  
  https://developer.hashicorp.com/terraform/language/meta-arguments/count

- Terraform for_each Documentation  
  https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
