# Unit Tests for tf-atom-s3-bucket-aws
#
# These tests use mock providers — no real AWS calls are made.
# Run with: terraform test
# Run verbose: terraform test -verbose

mock_provider "aws" {}

# ---------------------------------------------------------------------------
# Test: Module creates S3 bucket when enabled
# ---------------------------------------------------------------------------
run "creates_bucket_when_enabled" {
  variables {
    name        = "test-bucket"
    environment = "dev"
    namespace   = "unit"
    enabled     = true
  }

  assert {
    condition     = aws_s3_bucket.this[0].bucket == "unit-dev-test-bucket"
    error_message = "Bucket name should follow tf-label format: namespace-environment-name"
  }

  assert {
    condition     = aws_s3_bucket.this[0].force_destroy == false
    error_message = "force_destroy should default to false"
  }

  assert {
    condition     = output.bucket_id != null
    error_message = "bucket_id output should not be null when enabled"
  }
}

# ---------------------------------------------------------------------------
# Test: Module creates nothing when disabled
# ---------------------------------------------------------------------------
run "creates_nothing_when_disabled" {
  variables {
    name        = "test-bucket"
    environment = "dev"
    namespace   = "unit"
    enabled     = false
  }

  assert {
    condition     = length(aws_s3_bucket.this) == 0
    error_message = "No bucket should be created when disabled"
  }

  assert {
    condition     = output.bucket_id == null
    error_message = "bucket_id output should be null when disabled"
  }
}

# ---------------------------------------------------------------------------
# Test: force_destroy can be set to true
# ---------------------------------------------------------------------------
run "force_destroy_enabled" {
  variables {
    name          = "ephemeral"
    environment   = "test"
    namespace     = "unit"
    force_destroy = true
  }

  assert {
    condition     = aws_s3_bucket.this[0].force_destroy == true
    error_message = "force_destroy should be true when explicitly set"
  }
}
