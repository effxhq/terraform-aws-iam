output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = data.aws_region.current.name
}

output "iam_role_name" {
  value = aws_iam_role.effx_aws_ecs_integration_role.name
}

output "external_id" {
  value = var.external_id
}
