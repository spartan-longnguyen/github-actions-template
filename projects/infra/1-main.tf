# Example resource - S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "${var.stack_name}-bucket-${var.environment}-${random_id.bucket_suffix.hex}"

  tags = {
    Environment = var.environment
    StackName   = var.stack_name
    ManagedBy   = "Terraform"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
