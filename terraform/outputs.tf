
output "configured_aws_region" {
  description = "Configured AWS deployment region"
  value       = var.aws_region
}

output "ec2_instance_id" {
  description = "Planned EC2 instance ID"
  value       = aws_instance.demo.id
}

output "ec2_instance_type" {
  description = "Configured EC2 instance type"
  value       = aws_instance.demo.instance_type
}

output "security_group_id" {
  description = "EC2 security group ID"
  value       = aws_security_group.web.id
}

output "sensitive_bucket_name" {
  description = "Sensitive data demonstration bucket"
  value       = aws_s3_bucket.sensitive_data.bucket
}
