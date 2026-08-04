# 🚀 Terraform AWS Infrastructure Provisioning

![Terraform](https://img.shields.io/badge/Terraform-1.x-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-blue?logo=githubactions)

## 📖 Overview

This project provisions production-style AWS infrastructure using Terraform.

The infrastructure is organized into reusable Terraform modules and follows Infrastructure as Code (IaC) best practices. The project also includes GitHub Actions workflows for Continuous Integration and manual deployment.

---



## ✨ Features

- Modular Terraform code
- Remote backend (S3)
- State locking (DynamoDB)
- VPC with public subnets
- Internet Gateway
- Route Tables
- Security Groups
- EC2
- Application Load Balancer
- Launch Template
- Auto Scaling Group
- CloudWatch Auto Scaling
- GitHub Actions CI/CD

---

## 📁 Project Structure

terraform-aws-infra/
├── .github/
│   └── workflows/
│       ├── terraform.yml
│       ├── apply.yml
│       └── destroy.yml
├── environments/
│   └── dev.tfvars.example
├── modules/
│   ├── alb/
│   ├── autoscaling/
│   ├── ec2/
│   ├── security-group/
│   └── vpc/
├── backend.tf
├── main.tf
├── outputs.tf
├── variables.tf
└── README.md

---

## ☁️ AWS Services Used

- VPC
- EC2
- ALB
- Auto Scaling
- Launch Template
- CloudWatch
- IAM Key Pair
- S3
- DynamoDB

---

## 🔄 GitHub Actions

### CI Pipeline

- Terraform fmt
- Terraform init
- Terraform validate
- Terraform plan
- Upload tfplan artifact

### Apply Workflow

Manual workflow that initializes Terraform and applies the infrastructure.

### Destroy Workflow

Manual workflow to destroy infrastructure.

---

## 🔐 Remote Backend

Terraform state is stored remotely using:

- Amazon S3
- DynamoDB State Locking

---

## 📈 Auto Scaling

- Launch Template
- Auto Scaling Group
- CPU-based Scale Up
- CPU-based Scale Down

---

## ▶️ Getting Started

Clone repository

git clone https://github.com/2003vinay/terraform-aws-infra.git

Create tfvars

Copy

environments/dev.tfvars.example

to

terraform.tfvars

Run

terraform init

terraform plan

terraform apply

---



- GitHub Actions
- AWS Console
- ALB
- Auto Scaling Group
- CloudWatch
- EC2
- Terraform Apply

---

## 📚 Learning Outcomes

- Terraform Modules
- Remote State
- GitHub Actions
- Auto Scaling
- CloudWatch
- ALB
- Infrastructure as Code
- CI/CD Automation

---

## 🔮 Future Enhancements

- RDS
- Bastion Host
- Private Subnets
- NAT Gateway
- ECS
- EKS
- WAF
- Route53
- ACM