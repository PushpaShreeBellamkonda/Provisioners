terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

# here the terraform.tfvar file will be stored in s3 bucket(Remote state)
# s3==> for Remote state
# Dynamodb table for Locking mechanism

  backend "s3" {
    bucket = "mybucket"
    key = "remote-state-demo-3" #our wish
    region = "us-east-1"
    dynamodb_table = "table_name"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}