data "aws_ecr_authorization_token" "this" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_security_groups" "this" {
  filter {
    name   = "group-name"
    values = var.vpc_security_group_names
  }
}

data "aws_subnet" "this" {
  for_each = toset(var.vpc_subnet_names)

  filter {
    name   = "tag:Name"
    values = [each.value]
  }
}
