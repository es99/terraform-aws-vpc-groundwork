variable "role" {
  type        = string
  description = "Role, por exemplo: Infra, Testes"
}

variable "public_subnets" {
  description = "Informações para criação das public subnets"
  type = map(object({
    cidr_block = string,
    name       = string,
    az         = string
  }))
}

variable "private_subnets" {
  description = "Informações para criação das private subnets"
  type = map(object({
    cidr_block = string,
    name       = string,
    az         = string
  }))
}

variable "database_subnets" {
  description = "Informações para criação das database subnets"
  type = map(object({
    cidr_block = string,
    name       = string,
    az         = string
  }))
}