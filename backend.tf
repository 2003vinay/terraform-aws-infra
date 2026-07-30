terraform {
  backend "s3" {
    bucket         = "vinay-terraform-demo-084047255648"
    key            = "terraform-learning/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
  }
}
