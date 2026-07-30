variable "ami" {}

variable "instance_type" {}

variable "key_name" {}

variable "security_group_id" {}

variable "subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {}

variable "common_tags" {
  type = map(string)
}