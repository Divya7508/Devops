resource "aws_s3_bucket" "S3_backend" {
  bucket = "S3-backend-terra "
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_sse" {
  bucket = aws_s3_bucket.S3_backend.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

  
resource "aws_s3_bucket_versioning" "s3_sse_versioning" {
  bucket = aws_s3_bucket.S3_backend.id
  versioning_configuration {
    status = "Enabled"
  }
  depends_on = [aws_s3_bucket_server_side_encryption_configuration.s3_sse]
}