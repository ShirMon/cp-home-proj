terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_security_group" "django_sec_group" {
  name        = "django_sec_group"
  description = "Allow port 8000 inbound traffic"

  ingress {
    description      = "djangorest from VPC"
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "django_sec_group"
  }
}

resource "aws_instance" "app_server" {
  ami            = "ami-0aeeebd8d2ab47354"
  instance_type  = "t2.micro"
  security_groups = [aws_security_group.django_sec_group.name]
  user_data = "${file("user-data.sh")}"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
