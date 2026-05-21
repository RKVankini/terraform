# Terraform Provisioners Practice

This project demonstrates how to use Terraform Provisioners for executing scripts and commands during infrastructure creation or destruction.

Terraform Provisioners help automate:
- Software installation
- Server configuration
- Remote command execution
- File transfers
- Post-deployment tasks

This project helps understand:
- Terraform Provisioners
- EC2 Automation
- Remote Execution
- Infrastructure as Code (IaC)

Terraform provisioners can execute scripts locally or remotely after resource creation. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax?utm_source=chatgpt.com))

---

# Project Structure

```bash
13-thirteenth-day-Provisioners/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── install.sh
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

# What are Terraform Provisioners?

Provisioners are used to execute scripts or commands on local or remote machines as part of resource creation or destruction.

Terraform supports:
- `local-exec`
- `remote-exec`
- `file`

Provisioners should be used only when necessary because Terraform mainly focuses on infrastructure provisioning. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec?utm_source=chatgpt.com))

---

# Types of Provisioners

## 1. local-exec

Runs commands on the local machine where Terraform is executed.

Example:

```hcl
provisioner "local-exec" {
  command = "echo EC2 Created Successfully"
}
```

### Use Cases
- Logging
- Notifications
- Running local scripts
- Triggering automation tools

---

## 2. remote-exec

Runs commands directly on the remote EC2 instance.

Example:

```hcl
provisioner "remote-exec" {

  inline = [
    "sudo yum update -y",
    "sudo yum install httpd -y",
    "sudo systemctl start httpd"
  ]
}
```

### Use Cases
- Software installation
- Server configuration
- Application deployment

Terraform connects using SSH for Linux instances. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec?utm_source=chatgpt.com))

---

## 3. file Provisioner

Copies files from local machine to remote server.

Example:

```hcl
provisioner "file" {

  source      = "install.sh"
  destination = "/tmp/install.sh"
}
```

### Use Cases
- Upload scripts
- Transfer configuration files
- Copy application files

---

# Example Terraform Configuration

```hcl
resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name

  provisioner "remote-exec" {

    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("terraform-key.pem")
    host        = self.public_ip
  }

  tags = {
    Name = "Provisioner-Server"
  }
}
```

---

# Connection Block

Provisioners require a `connection` block for remote access.

Example:

```hcl
connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("terraform-key.pem")
  host        = self.public_ip
}
```

Terraform supports SSH and WinRM connections. ([developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/resources/provisioners/connection?utm_source=chatgpt.com))

---

# Features

- Terraform Provisioners
- Remote Command Execution
- Automated Server Configuration
- File Transfer Automation
- EC2 Post-Deployment Automation
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
key_name       = "terraform-key"
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

- Terraform Provisioners
- local-exec Provisioner
- remote-exec Provisioner
- file Provisioner
- EC2 Remote Automation
- Infrastructure as Code Best Practices

---

# Advantages of Provisioners

| Feature | Benefit |
|---|---|
| Automation | Automatically configures servers |
| Remote Execution | Run commands on EC2 instances |
| File Transfer | Upload scripts and files |
| Faster Deployment | Reduces manual setup |
| Integration | Works with external tools |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Automated Server Provisioning
- Remote Infrastructure Automation
- Clean Terraform Structure
- Version Control with GitHub

---

# Repository Link

https://github.com/RKVankini/terraform/tree/main/13-thirteenth-day-Provisioners

---

# References

- Terraform Provisioners Documentation  
  https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax

- Terraform remote-exec Provisioner  
  https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec

- Terraform local-exec Provisioner  
  https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec

- Terraform Connection Block Documentation  
  https://developer.hashicorp.com/terraform/language/resources/provisioners/connection
