# Terraform Taint Practice

This project demonstrates how to use Terraform `taint` to force recreation of infrastructure resources.

Terraform taint is used when a resource becomes:
- Corrupted
- Misconfigured
- Unhealthy
- Partially created
- Out of sync

Taint marks the resource for destruction and recreation during the next Terraform apply operation. Terraform automatically replaces tainted resources in the next plan or apply. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
13a-thirteenth-day-taint/
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

# What is Terraform Taint?

Terraform taint marks a resource as damaged or degraded so Terraform will destroy and recreate it during the next apply operation. :contentReference[oaicite:1]{index=1}

Example situations:
- EC2 instance became unhealthy
- Manual changes caused configuration drift
- Resource setup failed partially
- Resource requires full recreation

---

# Important Note

The `terraform taint` command is deprecated starting from Terraform v0.15.2.

HashiCorp now recommends using:

```bash
terraform apply -replace="RESOURCE_NAME"
```

instead of:

```bash
terraform taint RESOURCE_NAME
```

because `-replace` is safer and visible directly in the Terraform plan. :contentReference[oaicite:2]{index=2}

---

# Example Terraform Resource

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Taint-Server"
  }
}
```

---

# Terraform Taint Workflow

## Step 1: Initialize Terraform

```bash
terraform init
```

---

## Step 2: Validate Configuration

```bash
terraform validate
```

---

## Step 3: Deploy Infrastructure

```bash
terraform apply
```

Type:

```bash
yes
```

to confirm deployment.

---

## Step 4: Mark Resource as Tainted

```bash
terraform taint aws_instance.web
```

Terraform marks the resource for recreation. :contentReference[oaicite:3]{index=3}

---

## Step 5: Preview Changes

```bash
terraform plan
```

Terraform shows:

```bash
-/+ destroy and recreate
```

because the resource is tainted. :contentReference[oaicite:4]{index=4}

---

## Step 6: Recreate Resource

```bash
terraform apply
```

Terraform destroys and recreates the tainted resource.

---

# Recommended Modern Approach

Instead of taint:

```bash
terraform taint aws_instance.web
```

Use:

```bash
terraform apply -replace="aws_instance.web"
```

This is the officially recommended replacement workflow. :contentReference[oaicite:5]{index=5}

---

# Terraform Untaint

If a resource was marked accidentally, remove the taint using:

```bash
terraform untaint aws_instance.web
```

Terraform removes the tainted status from the resource state. :contentReference[oaicite:6]{index=6}

---

# Features

- Terraform Taint
- Forced Resource Recreation
- Infrastructure Recovery
- Resource Replacement
- Terraform State Management
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
terraform plan
terraform apply
terraform taint aws_instance.web
terraform untaint aws_instance.web
terraform destroy
```

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform Taint
- Resource Recreation
- Infrastructure Recovery
- Terraform State Management
- Resource Replacement
- Infrastructure as Code Best Practices

---

# Advantages of Taint

| Feature | Benefit |
|---|---|
| Resource Recovery | Fix damaged resources |
| Infrastructure Repair | Recreate unhealthy resources |
| Drift Correction | Restore correct infrastructure state |
| Automation | Automated resource replacement |
| Simplicity | Easy infrastructure recovery |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Controlled Resource Recreation
- Terraform State Management
- Clean Terraform Structure
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/13a-thirteenth-day-taint

---

# References

- Terraform Taint Documentation  
  https://developer.hashicorp.com/terraform/cli/commands/taint

- Terraform Replace Resources  
  https://developer.hashicorp.com/terraform/cli/state/taint

- Terraform Untaint Documentation  
  https://developer.hashicorp.com/terraform/cli/commands/untaint

- Terraform CLI Documentation  
  https://developer.hashicorp.com/terraform/cli
