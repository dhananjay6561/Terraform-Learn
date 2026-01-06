terraform {
  required_providers {
    aws = {
      version = "~> 6.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}
# Creating VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}