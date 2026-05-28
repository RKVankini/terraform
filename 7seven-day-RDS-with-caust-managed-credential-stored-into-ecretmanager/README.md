# Terraform RDS with Custom Managed Credentials Stored in Secrets Manager

This repository demonstrates how to create an AWS RDS database using Terraform with credentials securely managed through AWS Secrets Manager.

The setup includes:
- AWS RDS Database
- AWS Secrets Manager
- Custom Managed Credentials
- Secure Password Storage
- Terraform Infrastructure Automation

This approach improves security by avoiding hardcoded database usernames and passwords inside Terraform configuration files.

AWS Secrets Manager helps securely store, manage, and retrieve sensitive credentials. ([docs.aws.amazon.com](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html))

---

# Repository Structure

```bash
7seven-day-RDS-with-caust-managed-credential-stored-into-ecretmanager/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── secrets.tf
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- AWS RDS
- AWS Secrets Manager
- Linux
- Git & GitHub

---

# AWS Resources Used

## 1. Amazon RDS

Amazon RDS (Relational Database Service) is a managed database service provided by AWS.

Supported databases include:
- MySQL
- PostgreSQL
- MariaDB
- Oracle
- SQL Server

Amazon RDS simplifies database administration tasks such as:
- Backups
- Patching
- Monitoring
- Scaling

([docs.aws.amazon.com](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html))

---

## 2. AWS Secrets Manager

AWS Secrets Manager securely stores sensitive information such as:
- Database credentials
- API keys
- Tokens
- Passwords

Secrets Manager supports automatic credential rotation and secure access management. ([docs.aws.amazon.com](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html))

---

# Why Use Secrets Manager for RDS Credentials?

Instead of storing credentials directly inside Terraform files:

❌ Bad Practice:

```hcl
username = "admin"
password = "Admin123"
```

Use Secrets Manager:

✅ Recommended Practice:
- Secure credential storage
- Improved security
- Reduced credential exposure
- Easier secret management

Terraform supports integration with AWS Secrets Manager for securely handling sensitive data.

---

# Example Secret Creation

## secrets.tf

```hcl
resource "aws_secretsmanager_secret" "db_secret" {

  name = "rds-db-secret"
}
```

This creates a secret inside AWS Secrets Manager.

---

# Store Secret Value

```hcl
resource "aws_secretsmanager_secret_version" "db_secret_value" {

  secret_id = aws_secretsmanager_secret.db_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = "Admin123"
  })
}
```

The credentials are stored securely as JSON data.

---

# Example RDS Configuration

## main.tf

```hcl
resource "aws_db_instance" "rds" {

  allocated_storage = 20
  engine            = "mysql"
  instance_class    = "db.t3.micro"

  username = jsondecode(
    aws_secretsmanager_secret_version.db_secret_value.secret_string
  )["username"]

  password = jsondecode(
    aws_secretsmanager_secret_version.db_secret_value.secret_string
  )["password"]

  skip_final_snapshot = true
}
```

Terraform retrieves database credentials dynamically from Secrets Manager.

Terraform supports sensitive data handling using functions like `jsondecode()`. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/functions/jsondecode))

---

# Security Benefits

| Feature | Benefit |
|---|---|
| Secure Credential Storage | Avoids hardcoded passwords |
| Centralized Secret Management | Easier administration |
| Reduced Exposure | Sensitive data protection |
| Credential Rotation | Improved security practices |
| Access Control | IAM-based permissions |

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform downloads:
- AWS provider
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

Terraform displays:
- RDS resources
- Secrets Manager resources
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

## Destroy Infrastructure

```bash
terraform destroy
```

Terraform removes:
- RDS database
- Secrets
- Related resources

---

# Example Architecture

```text
Terraform
    │
    ├── AWS Secrets Manager
    │       └── Stores DB Credentials
    │
    └── Amazon RDS
            └── Retrieves Credentials Securely
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
terraform state list
```

---

# Features

- AWS RDS Deployment
- AWS Secrets Manager Integration
- Secure Credential Management
- Dynamic Secret Retrieval
- Infrastructure as Code (IaC)
- Terraform AWS Automation

---

# Learning Outcomes

By completing this setup, you will understand:

- Amazon RDS
- AWS Secrets Manager
- Secure Credential Management
- Terraform Sensitive Data Handling
- Terraform Functions
- Infrastructure as Code Best Practices

---

# Best Practices Used

- Secure Secret Management
- Avoid Hardcoded Credentials
- Infrastructure as Code (IaC)
- Reusable Terraform Configuration
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/7seven-day-RDS-with-caust-managed-credential-stored-into-ecretmanager)

---

# References

- AWS RDS Documentation  
  https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html

- AWS Secrets Manager Documentation  
  https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- Terraform jsondecode Function  
  https://developer.hashicorp.com/terraform/language/functions/jsondecode

- Terraform Sensitive Data Documentation  
  https://developer.hashicorp.com/terraform/language/manage-sensitive-data
