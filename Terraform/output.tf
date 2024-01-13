output "s3_backend_id" {
  value = aws_s3_bucket.s3_backend.id
  description = "The name of the bucket."
}

output "s3_backend_hosted_zone" {
  value = aws_s3_bucket.s3_backend.hosted_zone_id
  description = "The Hosted zone of the bucket."
}

output "dynamodb_name" {
  value = aws_dynamodb_table.basic-dynamodb-table.name
  description = "The name of the bucket."
}
