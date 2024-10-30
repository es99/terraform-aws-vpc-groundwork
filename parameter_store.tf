resource "aws_ssm_parameter" "vpc_id" {
  name  = format("/%s/%s/vpc_id", var.project_name, var.role)
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "vpc_cidr_block" {
  name  = format("/%s/%s/vpc_cidr_block", var.project_name, var.role)
  type  = "String"
  value = aws_vpc.main.cidr_block
}

resource "aws_ssm_parameter" "public_subnets" {
  for_each = var.public_subnets
  name     = format("/%s/%s/%s", var.project_name, var.role, each.value.name)
  type     = "String"
  value    = aws_subnet.public[each.key].id
}

resource "aws_ssm_parameter" "private_subnets" {
  for_each = var.private_subnets
  name     = format("/%s/%s/%s", var.project_name, var.role, each.value.name)
  type     = "String"
  value    = aws_subnet.private[each.key].id
}

resource "aws_ssm_parameter" "database_subnets" {
  for_each = var.database_subnets
  name     = format("/%s/%s/%s", var.project_name, var.role, each.value.name)
  type     = "String"
  value    = aws_subnet.database[each.key].id
}

resource "aws_ssm_parameter" "eips" {
  for_each = local.eip_names
  name     = format("/%s/%s/eip-%s", var.project_name, var.role, each.key)
  type     = "String"
  value    = aws_eip.eips[each.key].id
}