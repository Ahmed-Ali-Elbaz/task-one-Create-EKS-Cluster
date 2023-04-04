
# Terraform Configuration Block

terraform {
  # Required Terraform Version
  required_version = "~> 1.3.0" # Symbol Allows 1.3.xx only and Denys any other version
  
  # Required Providers and their Versions
  required_providers {
    # AWS Provider
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }

  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket      = "myterraformstatebucket1"
    key         = "eks-cluster/terraform.tfstate"
    region      = "us-east-1"
  # encrypt     = true
  # kms_key_id  = "KEY_ID"

    dynamodb_table = "infra"
  }

}


# Providers Configuration Blocks

provider "aws" {
  region = "us-east-1"
}

