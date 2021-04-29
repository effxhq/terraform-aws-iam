output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = data.aws_region.current.region.name
}

ouput "iam_role_name" {
  value = aws_iam_role.effx_aws_ecs_integration_role.name
}

ouput "external_id" {
  value = var.external_id
}


