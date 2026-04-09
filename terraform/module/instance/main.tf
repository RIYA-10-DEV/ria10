provider "aws" {
    region = var.rg
  
}
terraform {
  backend "s3" {
    region = "us-east-1"
    key = "tfstatefile"
    
  }
}
resource "aws_instance" "module-instance" {
    ami = var.ami-id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = [var.mysg]
    availability_zone = var.availability_zone
    tags = {
      name = "riya"
      Name = "my-insatnce"
      Environment = "dev" 
    }
}