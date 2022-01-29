# Resource: AWS SSM Parameter Store
# Resource documentation: https://www.terraform.io/docs/providers/aws/r/ssm_parameter.html
#
# Taken from "github.com/rpstreef/terraform-aws-ssm-parameter-store?ref=master"
#
# SSM Parameter name example: /thebigapp/authentication/dev/parameter
# -----------------------------------------------------------------------------
resource "aws_ssm_parameter" "_" {
  for_each = var.parameters

  name            = "/${var.app_name}/${var.mod_name}/${var.env_name}/${each.key}"
  type            = each.value["type"]
  value           = each.value["value"]
  description     = lookup(each.value, "description", null)
  tier            = lookup(each.value, "tier", "Standard")
  allowed_pattern = lookup(each.value, "allowed_pattern", null)
  overwrite       = lookup(each.value, "overwrite", true)
}

