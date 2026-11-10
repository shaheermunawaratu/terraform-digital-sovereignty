
variable "project_name" {
  description = "Name of the digital sovereignty project"
  type        = string
  default     = "atul0012345-sovereignty"
}

variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-west-1"
}

variable "aws_availability_zone" {
  description = "AWS availability zone for EBS"
  type        = string
  default     = "eu-west-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Placeholder AMI ID for plan-only testing"
  type        = string
  default     = "ami-0123456789abcdef0"
}

variable "ebs_encrypted" {
  description = "Whether EBS storage is encrypted"
  type        = bool
  default     = true
}

variable "imdsv2_http_tokens" {
  description = "EC2 metadata token requirement"
  type        = string
  default     = "required"
}

variable "ssh_ingress_cidr_blocks" {
  description = "Approved source IP ranges for SSH"
  type        = list(string)
  default     = ["203.0.113.10/32"]
}

variable "s3_bucket_name" {
  description = "Demo bucket for sensitive data residency testing"
  type        = string
  default     = "atul0012345-digital-sovereignty-demo"
}
