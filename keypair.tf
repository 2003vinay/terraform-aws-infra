resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform_key"
  public_key = file("${path.module}/terraform-key.pub")
}