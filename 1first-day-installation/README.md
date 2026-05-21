# Terraform Installation Practice

This practice demonstrates how to install and configure Terraform for Infrastructure as Code (IaC) automation.

Terraform is an open-source Infrastructure as Code tool developed by HashiCorp that helps automate cloud infrastructure creation and management.

This practice helps understand:
- Terraform Installation
- Terraform Setup
- Infrastructure as Code Basics
- Terraform CLI Commands
- AWS Configuration

Terraform allows infrastructure to be managed using declarative configuration files. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform?utm_source=chatgpt.com))

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- Linux / Windows
- Git & GitHub

---

# What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool used to:
- Create infrastructure
- Manage cloud resources
- Automate deployments
- Maintain infrastructure consistency

Terraform supports multiple cloud providers including:
- AWS
- Azure
- Google Cloud
- Kubernetes

Terraform uses HCL (HashiCorp Configuration Language) for defining infrastructure. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language?utm_source=chatgpt.com))

---

# Terraform Installation

## Windows Installation

### Step 1: Download Terraform

Download Terraform from:

https://developer.hashicorp.com/terraform/downloads

---

### Step 2: Extract ZIP File

Extract the downloaded Terraform ZIP file.

Example:

```bash
terraform.exe
```

---

### Step 3: Add Terraform to Environment Variables

Add Terraform folder path to:
- System Environment Variables
- PATH variable

Example path:

```bash
C:\terraform
```

---

### Step 4: Verify Installation

Open Command Prompt and run:

```bash
terraform version
```

Expected output:

```bash
Terraform v1.x.x
```

Terraform CLI should display the installed version. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/cli?utm_source=chatgpt.com))

---

# Linux Installation

## Install using Package Manager

Example for Ubuntu:

```bash
sudo apt update
sudo apt install terraform -y
```

---

## Verify Installation

```bash
terraform version
```

---

# AWS CLI Installation

Terraform commonly works with AWS cloud infrastructure.

Download AWS CLI from:

https://aws.amazon.com/cli/

---

# Configure AWS Credentials

Run:

```bash
aws configure
```

Provide:
- AWS Access Key
- AWS Secret Key
- AWS Region
- Output Format

Terraform uses AWS credentials to authenticate with AWS services. ([docs.aws.amazon.com](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html?utm_source=chatgpt.com))

---

# First Terraform Configuration

Create a file named:

```bash
main.tf
```

Example configuration:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

This initializes the AWS provider.

---

# Terraform Workflow

## Initialize Terraform

```bash
terraform init
```

Terraform downloads:
- Providers
- Dependencies
- Plugins

Terraform initialization prepares the working directory. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/cli/commands/init?utm_source=chatgpt.com))

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

## Apply Configuration

```bash
terraform apply
```

Type:

```bash
yes
```

to confirm execution.

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Important Terraform Commands

```bash
terraform version
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
terraform fmt
```

---

# Features

- Terraform Installation
- Terraform CLI Setup
- AWS Provider Configuration
- Infrastructure as Code (IaC)
- Terraform Workflow Basics
- Cloud Automation

---

# Learning Outcomes

By completing this practice, you will understand:

- Terraform Installation Process
- Terraform CLI Basics
- AWS Provider Setup
- Terraform Workflow
- Infrastructure as Code Concepts
- Cloud Infrastructure Automation

---

# Advantages of Terraform

| Feature | Benefit |
|---|---|
| Automation | Automates infrastructure deployment |
| Multi-Cloud Support | Works with many cloud providers |
| Infrastructure as Code | Infrastructure managed using code |
| Reusability | Reusable configurations |
| Scalability | Easy infrastructure scaling |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Version Control with GitHub
- Reusable Infrastructure Configuration
- Automated Infrastructure Management
- Cloud Infrastructure Automation

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/1first-day-installation

---

# References

- Terraform Official Documentation  
  https://developer.hashicorp.com/terraform

- Terraform CLI Documentation  
  https://developer.hashicorp.com/terraform/cli

- AWS CLI Documentation  
  https://docs.aws.amazon.com/cli/

- Terraform Language Documentation  
  https://developer.hashicorp.com/terraform/language
