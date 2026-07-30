# Terraform AWS Infrastructure Project

## Overview

This project provisions a production-style AWS infrastructure using Terraform.

## Features

- Modular Terraform structure
- Remote State with S3
- State Locking using DynamoDB
- Custom VPC
- Two Public Subnets across Availability Zones
- Internet Gateway
- Route Tables
- Security Groups
- EC2 Launch Template
- Application Load Balancer (ALB)
- Target Group
- Auto Scaling Group
- CloudWatch Scale Up & Scale Down Policies
- GitHub Actions CI Pipeline

## Architecture

Internet
↓
Application Load Balancer
↓
Target Group
↓
Auto Scaling Group
↓
EC2 Instances

## Technologies

- Terraform
- AWS
- EC2
- ALB
- Auto Scaling
- CloudWatch
- GitHub Actions

## Deployment

```bash
terraform init
terraform plan
terraform apply
```

## CI Pipeline

GitHub Actions automatically performs:

- terraform fmt
- terraform init
- terraform validate
- terraform plan

## Author

Vinay Malyala