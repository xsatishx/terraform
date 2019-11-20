output "bucket_arn" {
  description = "Bucket ARN"
  value       = "${module.s3_bucket.bucket_arn}"
}

output "bucket_domain_name" {
  description = "FQDN of the bucket"
  value       = "${module.s3_bucket.bucket_domain_name}"
}

output "bucket_id" {
  description = "The bucket id or name"
  value       = "${module.s3_bucket.bucket_id}"
}
