output "subnet_id" {
  description = "ID subnet create AWS"
  value       = aws_subnet.subnet-prd-s3.id
}

output "security_group_id" {
  description = "ID security group create AWS"
  value       = aws_security_group.sg-prd-s3.id
}