output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = aws_instance.public_bastion.public_ip
}

output "privateEC2_private_ip" {
  description = "Private IP of the Private EC2 Instance"
  value       = aws_instance.private_EC2.private_ip
}

output "rds_endpoint" {
  value       = aws_db_instance.private_rds.endpoint
  description = "RDS PostgreSQL endpoint"
}

