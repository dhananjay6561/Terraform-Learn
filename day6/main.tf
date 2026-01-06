resource "aws_instance" "example" {

  count = 1
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  region       = var.region


  tags = {
    Environment = var.environment
    Name = "${var.environment}-EC2-Instance"
  }
}