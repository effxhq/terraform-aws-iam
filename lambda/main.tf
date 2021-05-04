resource "aws_iam_policy" "effx_aws_lambda_integration_policy" {
  count = var.enable_lambda ? 1 : 0
  name = "effx-AWS-Lambda-Integration-Policy"

  policy = jsonencode({{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "cloudformation:Describe*",
                "cloudformation:Get*",
                "cloudformation:List*",
                "cloudtrail:DescribeTrails",
                "cloudtrail:GetTrailStatus",
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "health:DescribeEvents",
                "health:DescribeEventDetails",
                "health:DescribeAffectedEntities",
                "lambda:List*",
                "lambda:Get*",
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
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
})
}
