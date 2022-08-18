terraform {

  # cloud {
  #   organization = "org-adlambar"

  #   workspaces {
  #     name = "terraform-ec2-cloud"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }

  required_version = ">= 0.14.0"
}
