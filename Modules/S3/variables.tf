variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "SCB-s3-bucket-test01"
}

variable "stage" {
  description = "The environment this bucket is used for"
  default     = "dev"
}

variable "namespace" {
  description = "Namespace (e.g. `eg` or `cp`) . S3 bucket name is globally unique, and the namespace is shared by all AWS accounts"
  default     = "cp"
}

variable "enabled" {
  description = "Set this to false if you dont have to create a resource but want to modify its properties"
  default     = "true"
}

variable "versioning_enabled" {
  description = "Versioning is a means of keeping multiple variants of an object in the same bucket. Set it to true if you want backups"
  default     = "true"
}

variable "allowed_bucket_actions" {
  description = "List of actions the user is permitted to perform on the S3 bucket"
  default     = ["s3:PutObject", "s3:PutObjectAcl", "s3:GetObject", "s3:DeleteObject", "s3:ListBucket", "s3:ListBucketMultipartUploads", "s3:GetBucketLocation", "s3:AbortMultipartUpload"]
}

variable "acl" {
  description = "The canned ACL to apply. Always use `private` when possible to avoid exposing sensitive information"
  default     = "private"
}

variable "allow_encrypted_uploads_only" {
  description = "Set to `true` to prevent uploads of unencrypted objects to S3 bucket"
  default     = "false"
}

variable "force_destroy" {
  description = "If true it indicates all objects should be forced delete from the bucket so that the bucket can be deleted without an error"
  default     = "false"
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  default     = "AES256"
}

variable "kms_master_key_id" {
  description = "The AWS KMS master key ID used for the `SSE-KMS` encryption. This can only be used when you set the value of  variable sse_algorithm as aws:kms"
  default     = ""
}

// tags

variable "tag_name" {
  description = "Tag name to be assigned to the instance"
  default     = "app"
}

variable "tag_company" {
  description = "Company name to be tagged to the instance"
  default     = "SCB"
}

variable "tag_applevel" {
  description = "Tag the instance with the app level"
  default     = "4"
}

variable "tag_apptype" {
  description = "Tag the instance with the app type"
  default     = "webapp"
}

variable "tag_appname" {
  description = "Tag the instance with the app name"
  default     = "RPS"
}

variable "tag_function" {
  description = "Tag the instance with the app function"
  default     = "Dev"
}

variable "tag_adminname" {
  description = "Tag the instance with the admins name"
  default     = "admin"
}
