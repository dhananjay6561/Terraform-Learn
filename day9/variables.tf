variable "environment" {
  description = "Environment name (dev, staging, production)"
  type        = string
  default     = "staging"
  
  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "Environment must be dev, staging, or production."
  }
}

variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
  
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "VPC CIDR must be a valid IPv4 CIDR block."
  }
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}



variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "monitoring_enabled" {
  default = true
  type = bool
}

variable "associate_public_ip" {
  default = true
  type = bool
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = list(string)
  default     = ["10.0.0.0/8","192.168.0.0/16", "172.16.0.0/12"]
}

variable "allowed_regions" {
  type = set(string)
  default = ["us-east-1", "us-west-2"] 
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    Name        = "EC2-Instance"
    created_by  = "terraform"
  }
  
}

variable "ingress_values" {
  type = tuple([ number, string, number ])
  default = [ 443, "tcp", 443 ]
}

variable "config" {
  type = object({
    region = string,
    monitoring = bool,
    instance_count = number
  })
  default = {
    region = "us-east-1",
    monitoring = true,
    instance_count = 1
  }
}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
  default     = ["dj-terraform-state6561", "dj-terraform-state6562", "dj-terraform-state6563"]
}

variable "bucket_name_set" {
  description = "Set of S3 bucket names"
  type        = set(string)
  default     = ["dj-terraform-state6561", "dj-terraform-state6562", "dj-terraform-state6563"]
}

variable "allowed_vm_types" {
  description = "Set of allowed VM instance types"
  type        = list(string)
  default     = ["t3.micro", "t2.small", "t2.medium"]
}