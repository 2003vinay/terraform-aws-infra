variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "public_subnet_1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.2.0/24"
}

variable "availability_zone_1" {
  default = "ap-south-1a"
}

variable "availability_zone_2" {
  default = "ap-south-1b"
}