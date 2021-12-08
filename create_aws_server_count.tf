provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_security_group" "allow_web" {
  name = "allow_web"
  description = "Allow 80 inbound traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_web"
  }
}

resource "aws_instance" "server" {
  count = var.server_count 
  ami = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  security_groups = ["allow_web"]
  tags = {
    Name = "WebServer - ${count.index}"
  }
}

variable "server_count" {
  type = number
  default = "1"
  description = "server count"
}
