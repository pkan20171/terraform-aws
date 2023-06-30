terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region_name
  profile = var.profile

  default_tags {
    tags = {
      "Application" = "EKS-Cluster"
      "Tool"        = "Terragrunt-managed-resource"
    }
  }
}