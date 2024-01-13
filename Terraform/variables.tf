variable "s3_bucket_name" {
    type = string
    default = "s3-ilkal"
}

variable "dynamodb_name" {
    type = string
    default = "s3_tumkur-locking-table"
}

variable "hash_key_variable" {
    type = string
    default = "LockID"
}
