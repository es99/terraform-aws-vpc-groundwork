#### Empty Route Table ####
resource "aws_route_table" "null_route" {
  vpc_id = aws_vpc.main.id

  route = []

  tags = {
    Name = "Empty Route to database subnets"
  }
}

#### Route Tables ####
resource "aws_route_table" "igw" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public subnets to igw"
  }


}

resource "aws_route_table" "private_subnet_1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_public_subnet_1a.id
  }

  tags = {
    Name = "private_subnet_1a to nat-gw"
  }
}

resource "aws_route_table" "private_subnet_1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_public_subnet_1b.id
  }

  tags = {
    Name = "private_subnet_1b to nat-gw"
  }
}

resource "aws_route_table" "private_subnet_1c" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_public_subnet_1c.id
  }

  tags = {
    Name = "private_subnet_1c to nat-gw"
  }
}

#### Route Tables Association Publics Subnets to IGW ####

resource "aws_route_table_association" "public_subnets_1a_to_igw" {
  subnet_id      = aws_subnet.public["public1"].id
  route_table_id = aws_route_table.igw.id
}

resource "aws_route_table_association" "public_subnets_1b_to_igw" {
  subnet_id      = aws_subnet.public["public2"].id
  route_table_id = aws_route_table.igw.id
}

resource "aws_route_table_association" "public_subnets_1c_to_igw" {
  subnet_id      = aws_subnet.public["public3"].id
  route_table_id = aws_route_table.igw.id
}

#### Route Tables Association Privates Subnets to Nat Gateways ####

resource "aws_route_table_association" "private_subnet_1a_to_nat_gw1" {
  subnet_id      = aws_subnet.private["private1"].id
  route_table_id = aws_route_table.private_subnet_1a.id
}

resource "aws_route_table_association" "private_subnet_1b_to_nat_gw2" {
  subnet_id      = aws_subnet.private["private2"].id
  route_table_id = aws_route_table.private_subnet_1b.id
}

resource "aws_route_table_association" "private_subnet_1c_to_nat_gw3" {
  subnet_id      = aws_subnet.private["private3"].id
  route_table_id = aws_route_table.private_subnet_1c.id
}

#### Route Tables Association DB Subnets to empty route ####

resource "aws_route_table_association" "database_subnet_1a_to_empty_route" {
  subnet_id      = aws_subnet.database["database1"].id
  route_table_id = aws_route_table.null_route.id
}

resource "aws_route_table_association" "database_subnet_1b_to_empty_route" {
  subnet_id      = aws_subnet.database["database2"].id
  route_table_id = aws_route_table.null_route.id
}

resource "aws_route_table_association" "database_subnet_1c_to_empty_route" {
  subnet_id      = aws_subnet.database["database3"].id
  route_table_id = aws_route_table.null_route.id
}