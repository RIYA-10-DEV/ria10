provider "aws" {
    region = var.rg
}
terraform {
  backend "s3" {
    region = "ap-south-1"
    key = "tfstatefile"
    }
}
resource "aws_instance" "my-instance" {
    ami = var.ami-id
    instance_type = var.instance_type
    key_name = var.key-id
    security_groups = [var.mysg]
    availability_zone = var.az
    tags = {
      name = "riya"
      Name = "Riya"
      Enviroment = "dev"
    }

  
}