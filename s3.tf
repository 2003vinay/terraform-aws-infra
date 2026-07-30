resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "vinay-terraform-demo-084047255648"

  tags = {
    Name        = "Terraform Bucket"
    Environment = "dev"
    Owner       = "Vinay"
  }
}