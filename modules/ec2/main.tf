resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name


  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
  #!/bin/bash
  dnf update -y
  dnf install nginx -y
  systemctl enable nginx
  systemctl start nginx
  echo "<h1>Hello Vinay! Terraform is awesome 🚀</h1>" > /usr/share/nginx/html/index.html
  EOF

  tags = merge(
    var.common_tags,
    {
      Name = var.instance_name
    }
  )

}
