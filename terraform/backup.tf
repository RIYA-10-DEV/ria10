provider "aws" {
    region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "my-terraform-create"
    region = "us-east-1"
    key = "tfstatefile"
    
  }
}
resource "aws_instance" "myinstance2" {
    ami = "ami-01b14b7ad41e17ba4"
    instance_type = "t3.micro"
    key_name = "tf-1"
    vpc_security_group_ids = [ "sg-0e4535a3abb5aba8a" ]
    tags = {
        name = "Riya"
        Name = "Riya"
        Environment = "Dev"
    }
}