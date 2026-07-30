/*
resource "aws_security_group" "web_sg" {
  name        = var.security_group_name
  description = "security group for terraform demo"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.security_group_name
    Environment = "dev"
    Project     = "Terraform learning"
    Owner       = "Vinay"
  }
}

*/

module "security_group" {
  source                     = "./modules/security-group"
  security_group_name        = local.security_group_name
  security_group_description = "security group for terraform demo"
  vpc_id                     = module.vpc.vpc_id
  common_tags                = local.common_tags
}

/*
module "ec2" {
  source            = "./modules/ec2"
  instance_name     = local.instance_name
  ami               = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.security_group.security_group_id
  key_name          = aws_key_pair.terraform_key.key_name
  subnet_id         = module.vpc.public_subnet_1_id

  environment = var.environment
  owner       = var.owner
  project     = var.project

  common_tags = local.common_tags
}
*/

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone

  common_tags = local.common_tags
}



module "alb" {
  source = "./modules/alb"

  vpc_id = module.vpc.vpc_id
  subnet_ids = [
    module.vpc.public_subnet_1_id,
    module.vpc.public_subnet_2_id
  ]
  security_group_id = module.security_group.security_group_id
  common_tags       = local.common_tags
}


module "autoscaling" {
  source = "./modules/autoscaling"

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.terraform_key.key_name

  security_group_id = module.security_group.security_group_id

  subnet_ids = [
    module.vpc.public_subnet_1_id,
    module.vpc.public_subnet_2_id
  ]

  target_group_arn = module.alb.target_group_arn
  common_tags      = local.common_tags
}