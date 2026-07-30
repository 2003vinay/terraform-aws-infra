resource "aws_launch_template" "web" {

  name_prefix = "terraform-launch-template-"

  image_id = var.ami

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = base64encode(<<EOF
#!/bin/bash
dnf update -y
dnf install nginx -y
systemctl enable nginx
systemctl start nginx
echo "<h1>Hello from Auto Scaling Group</h1>" > /usr/share/nginx/html/index.html
EOF
  )

  tag_specifications {

    resource_type = "instance"

    tags = merge(
      var.common_tags,
      {
        Name = "terraform-asg-instance"
      }
    )
  }
}

resource "aws_autoscaling_group" "web_asg" {
  name = "terraform_asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = var.subnet_ids

  target_group_arns = [var.target_group_arn]
  health_check_type = "ELB"

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "terraform-asg-instance"
    propagate_at_launch = true
  }
}