# -----------------------------------------------------
# Atom: S3 Bucket
# Creates a single S3 bucket.
# -----------------------------------------------------
resource "aws_s3_bucket" "this" {
  count = module.this.enabled ? 1 : 0

  bucket        = module.this.id
  force_destroy = var.force_destroy

  tags = local.tags
}
