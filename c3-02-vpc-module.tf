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
  enable_dns_hostnames  = true # argument enables or disables DNS hostnames for the VPC. When set to "true" instances launched in the VPC are assigned a DNS hostname, which is resolved using Amazon-provided DNS servers. When set to "false" instances are not assigned a DNS hostname.
  enable_dns_support    = true # argument enables or disables DNS resolution for the VPC. When set to "true" instances launched in the VPC can resolve DNS hostnames. When set to "false" instances cannot resolve DNS hostnames.
  /*
    Both allow the instance to resolve DNS hostnames and be assigned a DNS hostname within the VPC.
    This can be useful for internal communication between instances within the VPC, as well as for connecting to external services using DNS hostnames.
  */

  # tags = local.common_tags
  vpc_tags = local.common_tags

  

}

