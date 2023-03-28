# AWS Region
variable "aws_region" {
  description       = "Region in which AWS resources to be Created"
  type              = string
  default           = "us-east-1"
}

# Environment Variable
variable "environment" {
  description       = "Environment Variable used as prefix"
  type              = string
  default           = "dev"
}

# Departement Variable
variable "department" {
  description = "Department to which this infrastructure belongs"
  type = string
  default = "Taas"
}

