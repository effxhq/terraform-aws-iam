data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "random_string" "external_id" {
  length = 32
}

module "effx_aws_ecs" {
  source     = "./ecs"
  enable_ecs = var.enable_ecs
}

module "effx_aws_lambda" {
  source        = "./lambda"
  enable_lambda = var.enable_lambda
}

resource "aws_iam_role" "effx_aws_ecs_integration_role" {
  name                = "effx-AWS-ECS-Integration-Role"
  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json
  managed_policy_arns = [effx_aws_ecs.iam_policy_arn, effx_aws_lambda.iam_policy_arn]

  tags = var.resource_tags
}
