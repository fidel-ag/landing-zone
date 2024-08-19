provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}
resource "aws_instance" "test" {

  ami           = "ami-04a81a99f5ec58529"
  subnet_id    = aws_subnet.public.id 
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  tags = {
    Name = "Test EC2 Instance" 
  }
}

resource "aws_security_group" "main" {
  name        = "main"
  description = "main"
  vpc_id      = aws_vpc.main.id
}