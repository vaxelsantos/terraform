terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "PRD"
      Owner       = "GRUPO32"
      Managed-by  = "Terraform"
    }
  }
}