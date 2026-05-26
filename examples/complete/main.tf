# -----------------------------------------------------
# Example: Complete S3 Bucket Atom Usage
# -----------------------------------------------------

provider "aws" {
  region = "eu-west-2"
}

module "s3_bucket" {
  source = "../../"

  namespace   = "psp"
  environment = "dev"
  name        = "assets"

  force_destroy = true

  # Or pass full context from upstream:
  # context = module.this.context
}

output "bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}
