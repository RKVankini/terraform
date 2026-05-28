# Terraform RDS

This repository demonstrates how to create and manage an AWS RDS (Relational Database Service) instance using Terraform.

The setup includes:
- AWS RDS Database
- DB Subnet Group
- Security Group
- Database Configuration
- Terraform Infrastructure Automation

Amazon RDS is a managed relational database service that simplifies database administration tasks such as backups, patching, monitoring, and scaling. :contentReference[oaicite:0]{index=0}

---

# Repository Structure

```bash
7seventh-day-RDS/
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
- AWS RDS
- Linux
- Git & GitHub

---

# What is Amazon RDS?

Amazon RDS (Relational Database Service) is a managed AWS database service used for running relational databases in the cloud.

Supported database engines include:
- MySQL
- PostgreSQL
- MariaDB
- Oracle
- SQL Server

Amazon RDS automates:
- Database provisioning
- Backups
- Software patching
- Monitoring
- Scaling
- High availability

AWS RDS helps reduce operational overhead compared to self-managed databases. :contentReference[oaicite:1]{index=1}

---

# AWS Resources Used

## 1. RDS DB Instance

The `aws_db_instance` resource creates the database instance.

Example:

```hcl
resource "aws_db_instance" "rds" {

  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"

  db_name              = "mydb"
  username             = "admin"
  password             = "Admin123"

  skip_final_snapshot  = true
}
```

Terraform provides the `aws_db_instance` resource for managing Amazon RDS databases. :contentReference[oaicite:2]{index=2}

---

## 2. DB Subnet Group

RDS databases require subnet groups for network placement.

Example:

```hcl
resource "aws_db_subnet_group" "db_subnet" {

  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}
```

DB subnet groups define which subnets RDS instances can use. :contentReference[oaicite:3]{index=3}

---

## 3. Security Group

Security Groups control database access.

Example:

```hcl
resource "aws_security_group" "rds_sg" {

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

This example allows MySQL access on port `3306`.

---

# Example Architecture

```text
Terraform
    │
    ├── Security Group
    │
    ├── DB Subnet Group
    │
    └── Amazon RDS Instance
```

---

# Example Terraform Configuration

## provider.tf

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

## main.tf

```hcl
resource "aws_db_instance" "rds" {

  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"

  db_name             = "mydb"
  username            = "admin"
  password            = "Admin123"

  publicly_accessible = true

  skip_final_snapshot = true

  tags = {
    Name = "Terraform-RDS"
  }
}
```

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

Terraform shows:
- RDS resources
- Database configuration
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

Terraform removes all created infrastructure resources.

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

# Example Variables

## terraform.tfvars

```hcl
region            = "ap-south-1"
db_instance_class = "db.t3.micro"
db_name           = "mydb"
```

---

# Features

- AWS RDS Deployment
- Terraform Database Automation
- DB Subnet Group
- Security Group Configuration
- Infrastructure as Code (IaC)
- Automated Database Provisioning

---

# Learning Outcomes

By completing this setup, you will understand:

- Amazon RDS
- Terraform RDS Resources
- Database Provisioning
- DB Networking
- Security Group Configuration
- Infrastructure as Code Best Practices

---

# Advantages of Amazon RDS

| Feature | Benefit |
|---|---|
| Managed Service | Reduced operational overhead |
| Automated Backups | Easier recovery |
| Scalability | Easy database scaling |
| High Availability | Improved reliability |
| Monitoring | Built-in AWS monitoring |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Automated Database Deployment
- Secure Security Group Configuration
- Reusable Terraform Configuration
- Version Control with GitHub

---

# Repository Link

:contentReference[oaicite:4]{index=4}

---

# References

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

- Terraform AWS RDS Tutorial  
  https://developer.hashicorp.com/terraform/tutorials/aws/aws-rds

- AWS RDS Documentation  
  https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html

- Terraform AWS RDS Module  
  https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest

- Terraform Language Documentation  
  https://developer.hashicorp.com/terraform/language
