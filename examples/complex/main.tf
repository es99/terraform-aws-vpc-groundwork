module "vpc-groundwork" {
  source  = "es99/vpc-groundwork/aws"
  version = "1.0.1"


  role = "Test"
  database_subnets = {
    database1 = {
      cidr_block = "192.168.51.0/24",
      name       = "database_subnet_a",
      az         = "us-east-2a"
    },
    database2 = {
      cidr_block = "192.168.52.0/24",
      name       = "database_subnet_b",
      az         = "us-east-2b"
    },
    database3 = {
      cidr_block = "192.168.53.0/24",
      name       = "database_subnet_c",
      az         = "us-east-2c"
    }
  }
  private_subnets = {
    private1 = {
      cidr_block = "192.168.0.0/20",
      name       = "private_subnet_a",
      az         = "us-east-2a"
    },
    private2 = {
      cidr_block = "192.168.32.0/20",
      name       = "private_subnet_b",
      az         = "us-east-2b"
    },
    private3 = {
      cidr_block = "192.168.64.0/20",
      name       = "private_subnet_c",
      az         = "us-east-2c"
    }
  }
  public_subnets = {
    public_subnets = {
      public1 = {
        cidr_block = "192.168.48.0/24",
        name       = "public_subnet_a",
        az         = "us-east-2a"
      },
      public2 = {
        cidr_block = "192.168.49.0/24",
        name       = "public_subnet_b",
        az         = "us-east-2b",
      },
      public3 = {
        cidr_block = "192.168.50.0/24",
        name       = "public_subnet_c",
        az         = "us-east-2c"
      }
    }
  }
}