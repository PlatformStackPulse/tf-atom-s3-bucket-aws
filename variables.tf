# -----------------------------------------------------------------------------
# Module-Specific Variables
#
# Note: Standard labeling variables (enabled, namespace, tenant, environment,
# stage, name, delimiter, attributes, tags, label_order, etc.) are provided
# by context.tf via the tf-label module.
# -----------------------------------------------------------------------------

variable "force_destroy" {
  description = "Allow Terraform to destroy non-empty bucket"
  type        = bool
  default     = false
}
