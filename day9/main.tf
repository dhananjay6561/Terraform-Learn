resource "aws_instance" "example" {
  ami = "ami-0c02fb55956c7d316"

  instance_type = var.allowed_vm_types[0]
  region = var.region

  tags = var.tags
  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_s3_bucket" "critical_data" {
  bucket = "my-critical-production-data"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_autoscaling_group" "app_servers" {
  # ... other configuration ...
  min_size = 1
  max_size = 5
  desired_capacity = 2
  health_check_type = "EC2"
  availability_zones = ["us-west-2a", "us-west-2b"]

  lifecycle {
    ignore_changes = [
      desired_capacity,  # Ignore capacity changes by auto-scaling
      load_balancers,    # Ignore if added externally
    ]
  }
}

resource "aws_security_group" "app_sg" {
  name = "app-security-group"
  # ... security rules ...
}

resource "aws_instance" "app_with_sg" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  lifecycle {
    replace_triggered_by = [
      aws_security_group.app_sg.id  # Replace instance when SG changes
    ]
  }
}

resource "aws_s3_bucket" "regional_validation" {
  bucket = "validated-region-bucket"

  lifecycle {
    precondition {
      condition     = contains(var.allowed_regions, data.aws_region.current.name)
      error_message = "ERROR: Can only deploy in allowed regions: ${join(", ", var.allowed_regions)}"
    }
  }
}