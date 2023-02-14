provider "aws" {
  region     = var.region
}

resource "aws_instance" "ec2" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  subnet_id     = var.SUBNET_ID
  
  tags = {
    Name = "my-instance"
  }
}
