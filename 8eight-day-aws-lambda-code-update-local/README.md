# Terraform AWS Lambda Code Update Local

This repository demonstrates how to deploy and update AWS Lambda function code locally using Terraform.

The setup includes:
- AWS Lambda Function
- Local ZIP Package
- IAM Role for Lambda
- Terraform Lambda Deployment
- Lambda Code Updates using Local Files

This approach helps automate serverless deployments using Infrastructure as Code (IaC).

AWS Lambda is a serverless compute service that allows code execution without managing servers. ([docs.aws.amazon.com](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html))

---

# Repository Structure

```bash
8eight-day-aws-lambda-code-update-local/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── lambda_function.py
├── lambda.zip
└── README.md
```

---

# Technologies Used

- Terraform
- Amazon Web Services (AWS)
- AWS Lambda
- IAM
- Python
- Linux
- Git & GitHub

---

# What is AWS Lambda?

AWS Lambda is a serverless compute service that runs code in response to events.

Lambda automatically handles:
- Server provisioning
- Scaling
- High availability
- Infrastructure management

Lambda supports multiple runtimes including:
- Python
- Node.js
- Java
- Go
- .NET

AWS Lambda executes code only when triggered. ([docs.aws.amazon.com](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html))

---

# AWS Resources Used

## 1. AWS Lambda Function

The `aws_lambda_function` resource creates a Lambda function.

Example:

```hcl
resource "aws_lambda_function" "lambda" {

  function_name = "terraform-lambda"

  filename      = "lambda.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  role = aws_iam_role.lambda_role.arn
}
```

Terraform uploads the ZIP package to AWS Lambda during deployment. ([registry.terraform.io](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function))

---

## 2. IAM Role

AWS Lambda requires an IAM role for execution permissions.

Example:

```hcl
resource "aws_iam_role" "lambda_role" {

  name = "lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"

      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}
```

IAM roles allow Lambda to interact with AWS services securely.

---

# Example Lambda Function

## lambda_function.py

```python
def lambda_handler(event, context):

    return {
        'statusCode': 200,
        'body': 'Hello from Terraform Lambda'
    }
```

This Python function returns a simple HTTP response.

---

# Creating ZIP Package

Before deployment, package the Lambda code into a ZIP file.

Example:

```bash
zip lambda.zip lambda_function.py
```

Terraform uploads this ZIP package during Lambda deployment.

---

# Updating Lambda Code Locally

When the local Lambda code changes:

1. Update the Python file
2. Recreate the ZIP package
3. Run Terraform apply

Example:

```bash
zip lambda.zip lambda_function.py
terraform apply
```

Terraform detects the ZIP file change and updates the Lambda function automatically.

Terraform tracks file changes using source code hashes. ([registry.terraform.io](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function))

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
resource "aws_lambda_function" "lambda" {

  function_name = "terraform-lambda"

  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"

  role = aws_iam_role.lambda_role.arn
}
```

The `source_code_hash` argument helps Terraform detect code changes automatically.

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
- Lambda resources
- IAM resources
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

# Update Lambda Code

## Step 1: Modify Code

Update:

```bash
lambda_function.py
```

---

## Step 2: Recreate ZIP File

```bash
zip lambda.zip lambda_function.py
```

---

## Step 3: Apply Changes

```bash
terraform apply
```

Terraform updates the Lambda function automatically.

---

# Destroy Infrastructure

```bash
terraform destroy
```

Terraform removes:
- Lambda function
- IAM role
- Related resources

---

# Example Architecture

```text
Terraform
    │
    ├── IAM Role
    │
    └── AWS Lambda Function
            │
            └── Local ZIP Package
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

- AWS Lambda Deployment
- Local Lambda Code Updates
- ZIP Package Deployment
- IAM Role Configuration
- Terraform Serverless Automation
- Infrastructure as Code (IaC)

---

# Learning Outcomes

By completing this setup, you will understand:

- AWS Lambda
- Terraform Lambda Deployment
- Lambda Code Packaging
- IAM Role Configuration
- Local Code Updates
- Infrastructure as Code Best Practices

---

# Advantages of AWS Lambda

| Feature | Benefit |
|---|---|
| Serverless | No server management |
| Auto Scaling | Automatic scaling |
| Cost Efficient | Pay only for execution time |
| Fast Deployment | Quick function deployment |
| Integration | Works with many AWS services |

---

# Best Practices Used

- Infrastructure as Code (IaC)
- Automated Serverless Deployment
- Secure IAM Configuration
- Local Code Versioning
- Version Control with GitHub

---

# Repository Link

[GitHub Repository](https://github.com/RKVankini/terraform/tree/main/8eight-day-aws-lambda-code-update-local)

---

# References

- AWS Lambda Documentation  
  https://docs.aws.amazon.com/lambda/latest/dg/welcome.html

- Terraform Lambda Function Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function

- AWS IAM Documentation  
  https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html

- Terraform AWS Provider Documentation  
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs

- Terraform filebase64sha256 Function  
  https://developer.hashicorp.com/terraform/language/functions/filebase64sha256
