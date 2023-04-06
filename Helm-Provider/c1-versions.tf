# Terraform Configuration Block
terraform {
  # Required Terraform Version
  required_version = "~> 1.3.0" # symbol allows 0.14.xx 0.15.xx >   "Version constraints"
                                    #   denys  1.0
  # Required Provider and their Versions
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "~> 2.9"
    }



  }  

  # Adding backend as S3 for Remote State Storage
  backend "s3" {
    bucket         = "myterraformstatebucket1"
    key            = "application"
    region         = "us-east-1"
 #   encrypt        = true
 #   kms_key_id     = "THE_ID_OF_THE_KMS_KEY"

  # For State Locking
    dynamodb_table = "app01"
  }

}

# Provider Configuration Block
provider "aws" {

  region = var.aws_region

}

