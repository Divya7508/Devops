resource "aws_s3_bucket" "s3_tumkur" {
  bucket = "s3-ilkal"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_tk" {
  bucket = aws_s3_bucket.s3_tumkur.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

  
resource "aws_s3_bucket_versioning" "s3_tk_versioning" {
  bucket = aws_s3_bucket.s3_tumkur.id
  versioning_configuration {
    status = "Enabled"
  }
  depends_on = [aws_s3_bucket_server_side_encryption_configuration.s3_tk]
}
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "s3_tumkur-locking-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"
  
  attribute {
    name = "LockId"
    type = "S"
  }
}
