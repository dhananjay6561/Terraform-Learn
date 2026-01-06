resource "aws_instance" "example" {
  ami = "ami-0c02fb55956c7d316"

  instance_type = var.allowed_vm_types[0]
  region = var.region

  tags = var.tags
  lifecycle {
    create_before_destroy = false
  }
}