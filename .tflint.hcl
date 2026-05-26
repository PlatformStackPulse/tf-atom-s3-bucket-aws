plugin "terraform" {
  enabled = true
  preset  = "all"
}

plugin "aws" {
  enabled = true
  version = "0.37.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# Disable terraform_standard_module_structure rule.
# tf-label atoms use context.tf by design to declare context variables
# separately from module-specific variables. This is an intentional pattern
# for composable atoms — not a violation.
rule "terraform_standard_module_structure" {
  enabled = false
}
