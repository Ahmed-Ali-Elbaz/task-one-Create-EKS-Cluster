module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"
  name        = "${local.name}-public-bastion-sg"
  description = "Security group for SSH Port 22 open for everybody (IPv4 CIDR)"
  vpc_id      = module.vpc.vpc_id


  # Ingress Rules and CIDR Blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]


  # engress Rules - all - all - open
  egress_rules = ["all-all"]
  tags = local.common_tags

}

