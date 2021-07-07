provider "aws" {
  region     = "us-east-1"
  access_key = "access_key"
  secret_key = "secret_key"

}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "myVPC"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1a"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
