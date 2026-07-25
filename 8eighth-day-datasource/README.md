# Terraform Data Source

This repository demonstrates how to use Terraform Data Sources to fetch and use existing AWS resource information dynamically.

Terraform Data Sources help retrieve details about already existing infrastructure resources without creating them.

Data sources are commonly used to:
- Fetch existing AMIs
- Read VPC details
- Retrieve subnet IDs
- Access security groups
- Reuse existing infrastructure

Terraform data sources allow infrastructure information to be queried from providers. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/data-sources))

---

# Repository Structure

```bash
8eighth-day-datasource/
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
- AWS EC2
- Linux
- Git & GitHub

---

# What is a Terraform Data Source?

A Terraform Data Source is used to fetch information about existing resources managed outside the current Terraform configuration.

Unlike Terraform resources:
- Resources create infrastructure
- Data sources only read infrastructure information

Terraform data sources help integrate existing infrastructure into Terraform workflows. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/data-sources))

---

# Why Use Data Sources?

Data sources are useful when:
- Infrastructure already exists
- Resource IDs change dynamically
- Reusing existing AWS resources
- Avoiding hardcoded values
- Building modular Terraform configurations

Example use cases:
- Get latest AMI ID
- Fetch default VPC
- Retrieve subnet information
- Access existing security groups

---

# Example Data Source

## Fetch Latest Ubuntu AMI

```hcl
data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
```

This data source retrieves the latest Ubuntu AMI dynamically.

Terraform data sources help avoid hardcoded AMI IDs. ([registry.terraform.io](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami))

---

# Using Data Source in Resource

```hcl
resource "aws_instance" "web" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-DataSource-Server"
  }
}
```

Terraform references data sources using:

```hcl
data.DATA_SOURCE_TYPE.NAME.attribute
```

Example:

```hcl
data.aws_ami.ubuntu.id
```

---

# Common Terraform Data Sources

| Data Source | Purpose |
|---|---|
| aws_ami | Fetch AMI details |
| aws_vpc | Fetch VPC details |
| aws_subnet | Fetch subnet information |
| aws_security_group | Fetch security groups |
| aws_availability_zones | Fetch AWS AZs |

Terraform supports many AWS data sources through the AWS provider. ([registry.terraform.io](https://registry.terraform.io/providers/hashicorp/aws/latest/docs))

---

# Example AWS Availability Zones Data Source

```hcl
data "aws_availability_zones" "available" {}
```

Retrieve zones using:

```hcl
data.aws_availability_zones.available.names
```

---

# Example Fetch Existing VPC

```hcl
data "aws_vpc" "default" {

  default = true
}
```

This retrieves the default AWS VPC.

---

# Example Architecture

```text
Terraform
    │
    ├── Data Source
    │       └── Fetch Existing AWS Resource
    │
    └── Resource
            └── Uses Retrieved Data
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

Terraform retrieves:
- Existing resource information
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

Terraform removes created resources only.

Data sources are read-only and are not destroyed.

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
data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["amazon"]
}

resource "aws_instance" "web" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}
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

- Terraform Data Sources
- Dynamic Infrastructure Configuration
- Existing AWS Resource Retrieval
- Dynamic AMI Lookup
- Reusable Terraform Code
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- Terraform Data Sources
- Dynamic Resource Fetching
- Existing AWS Infrastructure Access
- AMI Lookup
- Terraform Expressions
- Infrastructure as Code Best Practices

---

# Advantages of Data Sources

| Feature | Benefit |
|---|---|
| Dynamic Values | Avoid hardcoded resource IDs |
| Reusability | Reuse existing infrastructure |
| Flexibility | Automatically fetch latest resources |
| Integration | Combine old and new infrastructure |
| Automation | Simplifies infrastructure management |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Dynamic Infrastructure Configuration
- Reusable Terraform Code
- Avoid Hardcoded Values
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/8eighth-day-datasource)

---

# References

- Terraform Data Sources Documentation  
  https://developer.hashicorp.com/terraform/language/data-sources

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- Terraform AWS AMI Data Source  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

- Terraform AWS Availability Zones  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones

- Terraform Language Documentation  
  https://developer.hashicorp.com/terraform/language
