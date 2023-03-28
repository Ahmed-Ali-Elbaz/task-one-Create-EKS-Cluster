# aws availability zones Datasource
data "aws_availability_zones" "available" {
  state   = "available"
}

# Create VPC for our EKS Cluster using Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  # VPC Details
  name                  = "${local.name}-${var.vpc_name}"
  cidr                  = var.vpc_cidr_block

  azs                   = data.aws_availability_zones.available.names

  public_subnets        = var.vpc_public_subnets
  private_subnets       = var.vpc_private_subnets
  
  # NAT Gateway - Outbound traffic
  enable_nat_gateway    = var.vpc_enable_nat_gateway
  single_nat_gateway    = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames  = true
  enable_dns_support    = true

  # tags = local.common_tags
  vpc_tags = local.common_tags

  

}

