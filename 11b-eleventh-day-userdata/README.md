# Terraform EC2 User Data Project

This project demonstrates how to use Terraform `user_data` to automate software installation and server configuration during AWS EC2 instance creation.

Using `user_data`, commands or scripts automatically execute when the EC2 instance launches for the first time.

This project helps understand:
- EC2 Bootstrapping
- Infrastructure Automation
- Automated Server Configuration
- Infrastructure as Code (IaC)

Terraform supports passing startup scripts to EC2 using the `user_data` argument. :contentReference[oaicite:0]{index=0}

---

# Project Structure

```bash
11b-eleventh-day-userdata/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── userdata.sh
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

# What is User Data?

`user_data` is a startup script that automatically runs when an EC2 instance launches.

It is commonly used to:
- Install packages
- Configure servers
- Start services
- Deploy applications
- Automate initialization tasks

---

# Example User Data Script

Example `userdata.sh`

```bash
#!/bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<h1>Terraform User Data Success</h1>" > /var/www/html/index.html
```

This script:
- Updates packages
- Installs Apache HTTP Server
- Starts Apache service
- Enables service on reboot
- Creates a sample web page

---

# Example Terraform Code

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = file("userdata.sh")

  tags = {
    Name = "Terraform-UserData"
  }
}
```

Terraform can load external startup scripts using the `file()` function inside `user_data`. :contentReference[oaicite:1]{index=1}

---

# Features

- EC2 User Data Automation
- Automated Apache Installation
- Server Bootstrapping
- Terraform Infrastructure Automation
- Reusable Startup Scripts
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

# Access the Application

After deployment:

1. Copy EC2 Public IP
2. Open browser
3. Visit:

```bash
http://<EC2-PUBLIC-IP>
```

You should see:

```html
Terraform User Data Success
```

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
terraform output
```

---

# Learning Outcomes

By completing this project, you will understand:

- Terraform User Data
- EC2 Bootstrapping
- Automated Server Configuration
- Apache Installation Automation
- Infrastructure as Code (IaC)
- AWS Infrastructure Deployment

---

# Advantages of User Data

| Feature | Benefit |
|---|---|
| Automation | Automatically configures servers |
| Faster Deployment | No manual setup required |
| Reusability | Same script can be reused |
| Scalability | Useful for Auto Scaling |
| Consistency | Standard server configuration |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Automated Server Provisioning
- External User Data Scripts
- Clean Terraform Structure
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/11b-eleventh-day-userdata

---

# References

- Terraform AWS Instance Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

- Terraform Functions Documentation  
  https://developer.hashicorp.com/terraform/language/functions/file

- AWS EC2 User Data Documentation  
  https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html
