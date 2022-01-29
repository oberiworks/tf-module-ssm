# Terraform module for SSM Parameter Store

Taken from the work of Rolf Streefkerk

(https://github.com/rpstreef/terraform-aws-ssm-parameter-store)

This extends the work of Rolf to add an extra tier to the store

## About:

This Terraform module creates Systems Manager Parameters and uses standard prefixes ``app_name``, ``mod_name``, and ``env_name`` and for your parameters.

For instance:
``//thebigapp/authentication/dev/cognito_user_pool_arn``

## How to use:

```terraform
module "ssm_parameters" {
  source = "github.com/oberiworks/tf-module-ssm?ref=master"

  app_name      = "thebigapp"
  mod_name      = "authentication"
  env_name      = "dev"

  parameters = {
    "cognito_user_pool_arn" = {
      "type"  = "String"
      "value" = module.cognito.cognito_user_pool_arn
    },
    "cognito_user_pool_client_id" = {
      "type"  = "String"
      "value" = module.cognito.cognito_user_pool_client_id
    },
    "cognito_identity_pool_id" = {
      "type"  = "String"
      "value" = module.cognito.cognito_identity_pool_id
    }
  }
}
```

## Changelog

### v1.0

Initial release
