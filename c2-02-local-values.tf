# Local Values we can implement a complex expressions with it

locals {
  owners        = var.department
  environment   = var.environment
  name          = "${var.department}-${var.environment}"
  
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }

  eks_cluster_name = "${local.name}-${var.cluster_name}"

}
