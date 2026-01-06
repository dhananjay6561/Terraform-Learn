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
# Creating S3 bucket

resource "aws_s3_bucket" "my_bucket" {
  bucket = "dj-bucket-name"

  tags = {
    Name        = "My Bucket"
    Environment = "Dev"
  } 
}
