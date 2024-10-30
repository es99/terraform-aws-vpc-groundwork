output "vpc_id" {
  description = "O id da VPC recém criada"
  value       = aws_vpc.main.id
}

output "public_subnet_availability_zones" {
  description = "AZ's das public subnets"
  value       = { for subnet in aws_subnet.public : subnet.tags["Availability_zone"] => subnet.tags["Name"]... }
}

output "private_subnet_availability_zones" {
  description = "AZ's das private subnets"
  value       = { for subnet in aws_subnet.private : subnet.tags["Availability_zone"] => subnet.tags["Name"]... }
}

output "database_subnet_availability_zones" {
  description = "AZ's das database subnets, subnets totalmente isoladas"
  value       = { for subnet in aws_subnet.database : subnet.tags["Availability_zone"] => subnet.tags["Name"]... }
}

output "public_subnets_ids" {
  description = "ID's das public subnets"
  value       = { for subnet in aws_subnet.public : subnet.tags["Name"] => subnet.id }
}

output "private_subnets_ids" {
  description = "ID's das private subnets"
  value       = { for subnet in aws_subnet.private : subnet.tags["Name"] => subnet.id }
}

output "database_subnet_ids" {
  description = "ID's das database subnets"
  value       = { for subnet in aws_subnet.database : subnet.tags["Name"] => subnet.id }
}

output "eip_ids" {
  description = "Elastic IP's id"
  value       = { for eip in aws_eip.eips : eip.tags["Name"] => eip.id }
}

output "vpc_parameter_store" {
  description = "Nome do parameter store da vpc"
  value       = aws_ssm_parameter.vpc_id.id
}

output "vpc_cidr_block_parameter_store" {
  description = "Nome do parameter store do cidr_block"
  value       = aws_ssm_parameter.vpc_cidr_block.id
}

output "public_subnet_parameter_store_names" {
  description = "Nome do parameter store das public subnets"
  value       = [for subnet in aws_ssm_parameter.public_subnets : subnet.id]
}

output "private_subnet_parameter_store_names" {
  description = "Nome do parameter store das private subnets"
  value       = [for subnet in aws_ssm_parameter.private_subnets : subnet.id]
}

output "database_subnet_parameter_store_names" {
  description = "Nome do parameter store das database subnets"
  value       = [for subnet in aws_ssm_parameter.database_subnets : subnet.id]
}