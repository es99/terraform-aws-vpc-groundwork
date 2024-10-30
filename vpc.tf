resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = format("%s-vpc", var.project_name)
  }
}