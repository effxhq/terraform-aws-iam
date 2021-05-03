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

resource "aws_iam_role" "effx_aws_ecs_integration_role" {
  name                = "effx-AWS-ECS-Integration-Role"
  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.effx_aws_ecs_integration.arn]

  tags = var.resource_tags
}

resource "aws_iam_policy" "effx_aws_ecs_integration" {
  name = "effx-AWS-ECS-Integration"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "cloudformation:Describe*",
          "cloudformation:Get*",
          "cloudformation:List*",
          "cloudtrail:DescribeTrails",
          "cloudtrail:GetTrailStatus",
          "cloudwatch:Describe*",
          "cloudwatch:Get*",
          "cloudwatch:List*",
          "ecs:Describe*",
          "ecs:List*",
          "health:DescribeEvents",
          "health:DescribeEventDetails",
          "health:DescribeAffectedEntities",
          "logs:List*",
          "logs:Describe*",
          "states:ListStateMachines",
          "states:DescribeStateMachine",
          "tag:GetResources",
          "tag:GetTagKeys",
          "tag:GetTagValues",
          "xray:BatchGetTraces",
          "xray:GetTraceSummaries"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}
