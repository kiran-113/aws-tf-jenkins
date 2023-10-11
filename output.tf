output "public_ip" {
  value       = aws_instance.jenkins_instance.public_ip
  description = "Public IP Address of EC2 instance"
}

output "instance_id" {
  value       = aws_instance.jenkins_instance.id
  description = "Instance ID"
}
