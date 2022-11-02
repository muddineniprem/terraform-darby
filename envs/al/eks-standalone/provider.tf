#Terraform 0.13 and later(v1.0)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "darby-infra-tf-states"
    key = "al/eks-standalone/terraform.tfstate"
    region = "ap-south-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}


