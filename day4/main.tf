terraform {
    backend "s3" {
      bucket         = "dj-terraform-state6561"
      key            = "dev/terraform.tfstate"
      region         = "eu-north-1"
      encrypt = true
      use_lockfile = true
    }
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
