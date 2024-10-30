resource "aws_subnet" "public" {
  for_each          = var.public_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name              = each.value.name
    Availability_zone = each.value.az
  }
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name              = each.value.name
    Availability_zone = each.value.az
  }
}

resource "aws_subnet" "database" {
  for_each          = var.database_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name              = each.value.name
    Availability_zone = each.value.az
  }
}