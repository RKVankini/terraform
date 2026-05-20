# Terraform Target Resource Project

This project demonstrates how to use Terraform `-target` option to apply, plan, or destroy specific resources instead of managing the entire infrastructure.

Terraform resource targeting helps perform selective infrastructure operations during:
- Debugging
- Testing
- Partial deployments
- Resource recovery
- Incremental changes

Terraform supports resource targeting using the `-target` flag with `terraform plan`, `apply`, and `destroy`. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
12c-twelveth-day-target-resource/
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

# What is Terraform Resource Targeting?

Terraform Resource Targeting allows you to focus Terraform operations on specific resources only.

By default:
- Terraform manages all resources in the configuration.

Using `-target`:
- Terraform applies changes only to selected resources and their dependencies. :contentReference[oaicite:1]{index=1}

---

# Why Use Resource Targeting?

Resource targeting is useful when:

- Testing specific resources
- Fixing failed resources
- Debugging infrastructure issues
- Performing incremental deployments
- Reducing deployment time
- Managing partial infrastructure updates

Terraform recommends using targeting mainly for exceptional situations rather than daily workflows. :contentReference[oaicite:2]{index=2}

---

# Example Terraform Resource

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Web-Server"
  }
}
```

---

# Target Specific Resource

## Plan Only One Resource

```bash
terraform plan -target=aws_instance.web
```

Terraform previews changes only for the selected resource. :contentReference[oaicite:3]{index=3}

---

## Apply Only One Resource

```bash
terraform apply -target=aws_instance.web
```

Terraform creates or updates only the targeted resource. :contentReference[oaicite:4]{index=4}

---

## Destroy Only One Resource

```bash
terraform destroy -target=aws_instance.web
```

Terraform destroys only the specified resource. :contentReference[oaicite:5]{index=5}

---

# Target Resources inside Modules

Example:

```bash
terraform apply -target=module.ec2.aws_instance.web
```

Terraform can also target resources inside modules. :contentReference[oaicite:6]{index=6}

---

# Target Multiple Resources

```bash
terraform apply \
-target=aws_instance.web \
-target=aws_security_group.sg
```

Terraform supports multiple `-target` flags in a single command. :contentReference[oaicite:7]{index=7}

---

# Resource Address Examples

| Resource Type | Example |
|---|---|
| Single Resource | `aws_instance.web` |
| Resource with count | `aws_instance.web[0]` |
| Resource with for_each | `aws_instance.web["dev"]` |
| Module Resource | `module.ec2.aws_instance.web` |

Terraform uses resource addresses to identify target resources. :contentReference[oaicite:8]{index=8}

---

# Features

- Terraform Resource Targeting
- Selective Infrastructure Deployment
- Partial Resource Management
- Faster Debugging and Testing
- Incremental Infrastructure Updates
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

## Plan Target Resource

```bash
terraform plan -target=aws_instance.web
```

---

## Apply Target Resource

```bash
terraform apply -target=aws_instance.web
```

---

## Destroy Target Resource

```bash
terraform destroy -target=aws_instance.web
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

# Best Practices for Resource Targeting

| Best Practice | Reason |
|---|---|
| Use for debugging only | Avoid infrastructure drift |
| Run full plan later | Ensure infrastructure consistency |
| Use cautiously in production | Prevent dependency issues |
| Validate dependencies | Avoid partial failures |

Terraform warns that excessive use of `-target` can lead to inconsistent infrastructure state. :contentReference[oaicite:9]{index=9}

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform Resource Targeting
- Terraform `-target` Flag
- Partial Infrastructure Deployment
- Resource Addressing
- Infrastructure Debugging
- Infrastructure as Code Best Practices

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Selective Resource Management
- Clean Terraform Structure
- Controlled Infrastructure Deployment
- Version Control with GitHub

---

# Repository Link

:contentReference[oaicite:10]{index=10}

---

# References

- Terraform Target Resources Documentation  
  https://developer.hashicorp.com/terraform/tutorials/state/resource-targeting

- Terraform Plan Command  
  https://developer.hashicorp.com/terraform/cli/commands/plan

- Terraform Apply Command  
  https://developer.hashicorp.com/terraform/cli/commands/apply

- Terraform CLI Documentation  
  https://developer.hashicorp.com/terraform/cli
