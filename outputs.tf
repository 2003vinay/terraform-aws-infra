/*
output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "EC2 Public IP"
  value       = module.ec2.public_ip
}

output "public_dns" {
  description = "EC2 public dns"
  value       = module.ec2.public_dns
}
*/
output "security_group_id" {
  description = "Security Group ID"
  value       = module.security_group.security_group_id
}