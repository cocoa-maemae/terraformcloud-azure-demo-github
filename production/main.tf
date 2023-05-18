terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  cloud {
    organization = "example-org-94ee4a"
    hostname     = "app.terraform.io"

    workspaces {
      name = "terraformcloud-azure-demo-production"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "ap-northeast-1"
}

module "s3" {
  source = "../module/s3"
}

module "sqs" {
  source = "./../module/sqs"
}
