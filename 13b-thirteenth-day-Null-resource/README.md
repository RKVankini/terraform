# Terraform Null Resource Practice

This project demonstrates how to use Terraform `null_resource` for executing commands, scripts, and automation tasks without creating actual infrastructure resources.

The `null_resource` is commonly used with:
- Provisioners
- Automation scripts
- Deployment triggers
- Local commands
- Remote commands

This project helps understand:
- Terraform Null Resource
- Provisioners
- Triggers
- Automation Workflows
- Infrastructure as Code (IaC)

The `null_resource` follows the Terraform resource lifecycle but does not create real infrastructure resources. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
13b-thirteenth-day-Null-resource/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── script.sh
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- Linux
- Bash Scripting
- Git & GitHub

---

# What is Terraform null_resource?

The `null_resource` is a special Terraform resource that performs no infrastructure action but supports:
- Provisioners
- Triggers
- Dependencies
- Automation tasks

It is mainly used as a container for executing arbitrary actions. :contentReference[oaicite:1]{index=1}

---

# Why Use null_resource?

`null_resource` is useful when:
- Running shell scripts
- Executing local commands
- Running remote commands
- Triggering deployment tasks
- Performing post-deployment actions
- Orchestrating workflows

Example use cases:
- Application deployment
- Running Ansible scripts
- Database initialization
- Configuration management

---

# Example Null Resource

```hcl
resource "null_resource" "example" {

  provisioner "local-exec" {
    command = "echo Hello Terraform"
  }
}
```

This executes a local command during Terraform apply. :contentReference[oaicite:2]{index=2}

---

# Using Triggers

The `triggers` argument forces Terraform to recreate the `null_resource` whenever values change.

Example:

```hcl
resource "null_resource" "example" {

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo Running Every Time"
  }
}
```

Using `timestamp()` makes the resource execute during every Terraform apply. :contentReference[oaicite:3]{index=3}

---

# Example with EC2 Dependency

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = "t2.micro"
}

resource "null_resource" "configure_server" {

  depends_on = [aws_instance.web]

  provisioner "local-exec" {
    command = "echo EC2 Instance Created"
  }
}
```

This ensures:
- EC2 instance is created first
- Automation runs afterward

---

# Example with remote-exec

```hcl
resource "null_resource" "remote_setup" {

  provisioner "remote-exec" {

    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("terraform-key.pem")
    host        = aws_instance.web.public_ip
  }
}
```

Terraform can execute commands remotely using provisioners and connection blocks. :contentReference[oaicite:4]{index=4}

---

# Important Note

Terraform 1.4 introduced `terraform_data` as a modern alternative to `null_resource`. :contentReference[oaicite:5]{index=5}

However, `null_resource` is still widely used for:
- Learning Terraform
- Provisioner automation
- Legacy projects
- Simple scripting workflows

---

# Features

- Terraform Null Resource
- local-exec Provisioner
- remote-exec Provisioner
- Trigger-Based Execution
- Automation Workflows
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

# Destroy Infrastructure

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

- Terraform null_resource
- Terraform Triggers
- local-exec Provisioner
- remote-exec Provisioner
- Automation Workflows
- Infrastructure as Code Best Practices

---

# Advantages of null_resource

| Feature | Benefit |
|---|---|
| Automation | Run scripts automatically |
| Flexibility | Execute custom tasks |
| Orchestration | Manage dependencies |
| Reusability | Reuse scripts and workflows |
| Integration | Connect external tools |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Automation with Provisioners
- Trigger-Based Workflows
- Clean Terraform Structure
- Version Control with GitHub

---

# Repository Link

:contentReference[oaicite:6]{index=6}

---

# References

- Terraform Null Resource Documentation  
  https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource

- Terraform Provisioners Documentation  
  https://developer.hashicorp.com/terraform/language/provisioners

- Terraform terraform_data Resource  
  https://developer.hashicorp.com/terraform/language/resources/terraform-data

- Terraform Null Provider  
  https://registry.terraform.io/providers/hashicorp/null/latest/docs
