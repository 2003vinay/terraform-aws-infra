variable "security_group_name" {
  description = "Name of security group"
  type        = string
}

variable "security_group_description" {
  description = "description of security group"
  type        = string
}

variable "common_tags" {
  type = map(string)
}

variable "vpc_id" {
  type = string
}