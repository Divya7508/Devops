locals {
    hash_key_local = "LockID"
}

resource "aws_s3_bucket" "s3_backend" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_backend_sse" {
  bucket = aws_s3_bucket.s3_backend.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "s3_backend_sse_versioning" {
  bucket = aws_s3_bucket.s3_backend.id
  versioning_configuration {
    status = "Enabled"
  }
  depends_on = [ aws_s3_bucket_server_side_encryption_configuration.s3_backend_sse ]
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = var.dynamodb_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = local.hash_key_local

  attribute {
    name = local.hash_key_local
    type = "S"
  }
}
