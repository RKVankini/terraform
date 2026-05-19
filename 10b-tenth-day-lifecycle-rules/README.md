# Terraform Lifecycle Rules Project

This project demonstrates how to use Terraform Lifecycle Rules to manage infrastructure behavior and prevent unwanted resource changes or deletion.

Terraform lifecycle rules help control:
- Resource creation
- Resource updates
- Resource replacement
- Resource deletion

This project is useful for understanding how Terraform handles infrastructure changes in real-world AWS environments.

---

# Project Structure

```bash
10b-tenth-day-lifecycle-rules/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- Linux
- Git & GitHub

---

# Terraform Lifecycle Rules Covered

Terraform lifecycle block is used inside resources to customize resource behavior.

Example:

```hcl
resource "aws_instance" "example" {

  ami           = var.ami_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}
```

---

# Lifecycle Arguments Explained

## 1. create_before_destroy

Terraform creates the new resource first before destroying the old resource.

### Benefits
- Prevents downtime
- Useful in production environments
- Safer deployments

### Example

```hcl
lifecycle {
  create_before_destroy = true
}
```

---

## 2. prevent_destroy

Prevents accidental deletion of important infrastructure resources.

### Benefits
- Protects production resources
- Avoids accidental data loss

### Example

```hcl
lifecycle {
  prevent_destroy = true
}
```

If someone runs:

```bash
terraform destroy
```

Terraform will throw an error and stop deletion.

---

## 3. ignore_changes

Terraform ignores specific attribute changes made outside Terraform.

### Benefits
- Avoids unnecessary updates
- Useful when resources are modified manually

### Example

```hcl
lifecycle {
  ignore_changes = [
    tags
  ]
}
```

Terraform will ignore tag changes done manually in AWS Console.

---

# Features

- Terraform Lifecycle Management
- AWS EC2 Deployment
- Infrastructure Protection
- Prevent Resource Deletion
- Ignore Manual Changes
- Zero Downtime Deployment Concepts

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

## Preview Changes

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

Note:
If `prevent_destroy = true` is enabled, Terraform will block deletion.

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

- Terraform Lifecycle Rules
- Infrastructure Protection Techniques
- Resource Replacement Strategies
- Preventing Accidental Deletion
- Ignoring External Changes
- AWS Infrastructure Automation

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Safe Resource Management
- Modular Terraform Structure
- Version Control with GitHub
- Production-Safe Terraform Deployments

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/10b-tenth-day-lifecycle-rules

---

# References

- Terraform Lifecycle Meta-Arguments  
  https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle

- Terraform Documentation  
  https://developer.hashicorp.com/terraform/docs

- AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs
