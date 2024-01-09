resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id

  tags = {
    Name        = "${var.environment}-public-ec2-instance"
    Environment = var.environment
  }
}

resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id

  tags = {
    Name        = "${var.environment}-private-ec2-instance"
    Environment = var.environment
  }
}
