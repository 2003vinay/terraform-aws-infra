resource "aws_autoscaling_policy" "cpu_scale_up" {
    name = "cpu-scale-up"
    autoscaling_group_name = aws_autoscaling_group.web_asg.name
    adjustment_type = "ChangeInCapacity"
    scaling_adjustment = 1
    cooldown = 120
}


resource "aws_cloudwatch_metric_alarm" "high_cpu" {
    alarm_name = "terraform-high-cpu"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods = 2
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = 60
    statistic = "Average"
    threshold = 20

    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.web_asg.name
    }

    alarm_actions = [
        aws_autoscaling_policy.cpu_scale_up.arn
    ]
}


resource "aws_autoscaling_policy" "cpu_scale_down" {
  name                   = "cpu-scale-down"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 120
}


resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "terraform-low-cpu"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 10

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }

  alarm_actions = [
    aws_autoscaling_policy.cpu_scale_down.arn
  ]
}

