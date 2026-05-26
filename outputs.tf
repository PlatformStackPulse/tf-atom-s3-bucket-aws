output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}

output "bucket_id" {
  description = "Name of the bucket"
  value       = try(aws_s3_bucket.this[0].id, null)
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = try(aws_s3_bucket.this[0].arn, null)
}

output "bucket_regional_domain_name" {
  description = "Regional domain name of the bucket"
  value       = try(aws_s3_bucket.this[0].bucket_regional_domain_name, null)
}

output "bucket_domain_name" {
  description = "Domain name of the bucket"
  value       = try(aws_s3_bucket.this[0].bucket_domain_name, null)
}
