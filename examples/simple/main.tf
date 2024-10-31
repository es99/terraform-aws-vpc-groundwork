module "vpc-groundwork" {
  source  = "es99/vpc-groundwork/aws"
  version = "1.1.2"

  role = var.role
  database_subnets = var.database_subnets
  private_subnets =  var.private_subnets
  public_subnets =  var.public_subnets
}