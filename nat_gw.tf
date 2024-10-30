locals {
  eip_names = toset([
    "nat-gw-eip1",
    "nat-gw-eip2",
    "nat-gw-eip3"
  ])
}

### Elastic IPs ###

resource "aws_eip" "eips" {
  for_each = local.eip_names
  domain   = "vpc"

  tags = {
    Name = each.key
  }
}

### NAT Gateways ###

resource "aws_nat_gateway" "nat_gw_public_subnet_1a" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.public["public1"].id
  allocation_id     = aws_eip.eips["nat-gw-eip1"].id

  tags = {
    Name = format("%s-nat-gw-1a", var.project_name)
  }
}


resource "aws_nat_gateway" "nat_gw_public_subnet_1b" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.public["public2"].id
  allocation_id     = aws_eip.eips["nat-gw-eip2"].id

  tags = {
    Name = format("%s-nat-gw-1b", var.project_name)
  }
}

resource "aws_nat_gateway" "nat_gw_public_subnet_1c" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.public["public3"].id
  allocation_id     = aws_eip.eips["nat-gw-eip3"].id

  tags = {
    Name = format("%s-nat-gw-1c", var.project_name)
  }
}