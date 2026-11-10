
# EC2 Security Group
resource "aws_security_group" "web" {
  name        = "${var.project_name}-sg"
  description = "Security group for demonstration EC2 instance"

  # SSH access restricted to an approved IP range
  ingress {
    description = "Restricted SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ingress_cidr_blocks
  }

  # Allow outbound HTTPS traffic
  egress {
    description = "HTTPS outbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-sg"
    Environment = "Assignment"
  }
}

# EC2 Instance
resource "aws_instance" "demo" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = false

  # Mandatory IMDSv2 configuration
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = var.imdsv2_http_tokens
    http_put_response_hop_limit = 1
  }

  # Encrypted root storage
  root_block_device {
    encrypted   = var.ebs_encrypted
    volume_type = "gp3"
    volume_size = 8
  }

  tags = {
    Name        = "${var.project_name}-ec2"
    Environment = "Assignment"
  }
}

# Additional EBS Volume
resource "aws_ebs_volume" "data" {
  availability_zone = var.aws_availability_zone
  size              = 10
  type              = "gp3"
  encrypted         = var.ebs_encrypted

  tags = {
    Name        = "${var.project_name}-data"
    Environment = "Assignment"
  }
}

# S3 Bucket for sensitive data residency testing
resource "aws_s3_bucket" "sensitive_data" {
  bucket = var.s3_bucket_name

  tags = {
    Name                = "${var.project_name}-data"
    DataClassification  = "Sensitive"
    DataResidencyRegion = var.aws_region
    Environment         = "Assignment"
  }
}

# S3 Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "sensitive_data" {
  bucket = aws_s3_bucket.sensitive_data.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "sensitive_data" {
  bucket = aws_s3_bucket.sensitive_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable bucket versioning
resource "aws_s3_bucket_versioning" "sensitive_data" {
  bucket = aws_s3_bucket.sensitive_data.id

  versioning_configuration {
    status = "Enabled"
  }
}
