resource "aws_iam_policy" "effx_aws_ecs_integration" {
  count = var.enable_ecs ? 1 : 0
  name  = "effx-AWS-ECS-Integration-Policy"

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
