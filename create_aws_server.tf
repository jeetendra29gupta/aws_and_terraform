provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"

  tags = {
    Name = "Linux Server"
  }
}
