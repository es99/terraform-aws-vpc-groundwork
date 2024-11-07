resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = format("%s-vpc", var.project_name)
  }
}

resource "aws_flow_log" "vpc" {
  traffic_type = "ALL"
  vpc_id       = aws_vpc.main.id
}