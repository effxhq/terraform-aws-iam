
# terraform-aws-iam

terraform module for installing effx aws integrations

# Usage

```hcl
module "effx_aws_integration" {
  source  = "git::github.com/effxhq/terraform-aws-iam.git?ref=main"
  enable_ecs = true // defaults to true
  enable_lambda = true
  resource_tags = []
}
```
