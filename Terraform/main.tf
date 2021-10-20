provider "aws" {
    access_key = "AKIAQI3TQPZGB27KDREW"
    secret_key = "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"
    region = "eu-central-1"
  
}




data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
    }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
} 

