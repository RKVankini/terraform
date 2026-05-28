# Terraform State File Testing Same Key

This repository demonstrates Terraform remote backend testing using the same backend key for storing Terraform state files.

The setup helps understand:
- Terraform backend behavior
- State file conflicts
- Same backend key usage
- State locking concepts
- Remote state management

Terraform backend keys define the exact location of the Terraform state file inside the remote backend storage. :contentReference[oaicite:0]{index=0}

---

# Repository Structure

```bash
6sixth-day-statefiletesting-sameKey/
│
├── main.tf
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- AWS S3
- DynamoDB
- Linux
- Git & GitHub

---

# What is Backend Key in Terraform?

In Terraform remote backends, the `key` parameter defines where the Terraform state file is stored.

Example:

```hcl
terraform {

  backend "s3" {

    bucket = "terraform-state-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"

  }
}
```

Example state location:

```bash
s3://terraform-state-bucket/dev/terraform.tfstate
```

Terraform uses the backend key to identify and manage infrastructure state files. :contentReference[oaicite:1]{index=1}

---

# Purpose of This Setup

This setup demonstrates what happens when:
- Multiple Terraform configurations
- Use the same backend key
- Point to the same Terraform state file

This helps understand:
- Shared state behavior
- State overwriting risks
- State locking
- Infrastructure conflicts

---

# Same Backend Key Example

## backend.tf

```hcl
terraform {

  backend "s3" {

    bucket         = "terraform-state-bucket"
    key            = "shared/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"

  }
}
```

If multiple Terraform projects use:

```hcl
key = "shared/terraform.tfstate"
```

they will all reference the same Terraform state file.

---

# Risks of Using Same Backend Key

Using the same backend key across multiple Terraform projects can create issues.

| Issue | Description |
|---|---|
| State Overwrite | One project may overwrite another project's state |
| Resource Conflicts | Infrastructure may become inconsistent |
| Drift Problems | Terraform may detect unexpected changes |
| Shared Resource Tracking | Multiple configs track same resources |
| Accidental Deletion | Resources may be destroyed unintentionally |

Terraform state is considered the source of truth for infrastructure management. :contentReference[oaicite:2]{index=2}

---

# State Locking

This setup may also demonstrate Terraform state locking using DynamoDB.

Example:

```hcl
dynamodb_table = "terraform-lock-table"
```

State locking prevents multiple users or Terraform processes from modifying the same state file simultaneously.

Without locking:
- Infrastructure corruption may occur
- Parallel operations may fail

Terraform recommends state locking for remote backends. :contentReference[oaicite:3]{index=3}

---

# Example Terraform Resource

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "StateFile-Test-Server"
  }
}
```

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform:
- Configures remote backend
- Downloads providers
- Initializes state management

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

Terraform checks:
- Existing remote state
- Resource differences
- Infrastructure changes

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

# Testing Same Backend Key

## Scenario Example

### Project A

```hcl
key = "shared/terraform.tfstate"
```

### Project B

```hcl
key = "shared/terraform.tfstate"
```

Both projects use the same remote state file.

Possible outcomes:
- Shared infrastructure tracking
- Resource conflicts
- State overwrite issues

---

# Best Practice Recommendation

It is recommended to use separate backend keys for different environments or projects.

Example:

```hcl
key = "dev/terraform.tfstate"
```

```hcl
key = "test/terraform.tfstate"
```

```hcl
key = "prod/terraform.tfstate"
```

This helps isolate infrastructure states safely.

---

# Example Recommended Backend Structure

```bash
s3://terraform-state-bucket/dev/terraform.tfstate
s3://terraform-state-bucket/test/terraform.tfstate
s3://terraform-state-bucket/prod/terraform.tfstate
```

---

# Important Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
terraform state list
terraform force-unlock
```

---

# Features

- Terraform Remote Backend
- Shared State File Testing
- Same Backend Key Usage
- AWS S3 Backend
- DynamoDB State Locking
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- Terraform Backend Keys
- Terraform Remote State
- State Locking
- Shared State Risks
- Backend Configuration
- Infrastructure State Management

---

# Advantages of Proper Backend Management

| Feature | Benefit |
|---|---|
| State Isolation | Separate environments safely |
| Team Collaboration | Shared infrastructure management |
| State Locking | Prevents concurrent modification |
| Security | Better infrastructure protection |
| Scalability | Easier infrastructure management |

---

# Best Practices Used

- Remote State Management
- Separate Backend Keys
- State Locking with DynamoDB
- Infrastructure as Code (IaC)
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/6sixth-day-statefiletesting-sameKey)

---

# References

- Terraform Backend Documentation  
  https://developer.hashicorp.com/terraform/language/backend

- Terraform State Documentation  
  https://developer.hashicorp.com/terraform/language/state

- Terraform Remote State  
  https://developer.hashicorp.com/terraform/language/state/remote

- Terraform State Locking  
  https://developer.hashicorp.com/terraform/language/state/locking

- AWS S3 Backend Documentation  
  https://developer.hashicorp.com/terraform/language/backend/s3
