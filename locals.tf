locals {
  environment = terraform.workspace
  common_tags = {
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
  instance_name       = "terraform-demo-server-${local.environment}"
  security_group_name = "terraform-demo-sg-${local.environment}"

}