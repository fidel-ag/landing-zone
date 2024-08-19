provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {

  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  vpc_id = "vpc-0d20c97da752ee7fb"

}