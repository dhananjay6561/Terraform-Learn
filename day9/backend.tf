terraform {
      backend "s3" {
      bucket         = "dj-terraform-state6561"
      key            = "dev/terraform.tfstate"
      region         = "eu-north-1"
      encrypt = true
      use_lockfile = true
    }
}