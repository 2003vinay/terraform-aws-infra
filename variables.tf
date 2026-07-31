variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "EC2 name tag"
  type        = string
}

variable "security_group_name" {
  description = "Security Group name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "project" {
  description = "Project Name"
  type        = string
}

variable "owner" {
  description = "Owner name"
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  description = "Availability_zone"
  type        = string
  default     = "ap-south-1a"
}