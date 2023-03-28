# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description   = "VPC name"
  type          = string
  default       = "eks-cluster-vpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description   = "VPC cidr block"
  type          = string
  default       = "10.0.0.0/16"
}

# NOTE: We will get the VPC Availability Zones from Datasource

# VPC Public Subnets
variable "vpc_public_subnets" {
  description   = "VPC Public Subnets"
  type          = list(string)
  default       = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description   = "VPC Private Subnets"
  type          = list(string)
  default       = [ "10.0.151.0/24", "10.0.152.0/24" ]
}

# VPC Enable NAT Gateway (True or False)
variable "vpc_enable_nat_gateway" {
  description   = "Enable NAT Gateways for Private Subnets Outbound traffic"
  type          = bool
  default       = true
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs"
  type = bool
  default = true
}
