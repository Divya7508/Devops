output "s3_tumkur_id" {
  value = aws_s3_bucket.s3_tumkur.id
  description = "The name of the bucket."
}

output "s3_backend_hosted_zone" {
  value = aws_s3_bucket.s3_tumkur.hosted_zone_id
  description = "The Hosted zone of the bucket."
}

output "dynamodb_name" {
  value = aws_dynamodb_table.basic-dynamodb-table.name
  description = "The name of the bucket."
}


# output will be after terraform apply
# dynamodb_name = "s3_tumkur-locking-table"
# s3_backend_hosted_zone = "Z11RGJOFQNVJUP"
# s3_tumkur_id = "s3-ilkal"
