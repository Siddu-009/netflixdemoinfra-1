provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-019715e0d74f695be "
  instance_type          = "t3.micro"
  key_name               = "SMUMB"
  vpc_security_group_ids = ["sg-06bc3b3735fcdd7c0"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["tomcat-1", "tomcat-2", "Monitoring server"]
}
