
provider "aws" {
  region = var.aws_region

  # Allow planning without AWS credentials.
  # This project is for policy testing only.
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}
