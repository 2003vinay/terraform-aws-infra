resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform_key"
  public_key = file("C:/Users/Manasa malyala/.ssh/terraform-key.pub")
}