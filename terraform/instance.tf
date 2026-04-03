provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "myinstance" {
    ami = "ami-0ec10929233384c7f"
    instance_type = "t3.micro"
    key_name = "tf-1"
    vpc_security_group_ids = [ "sg-0e4535a3abb5aba8a" ]
    tags = {
        name = "Riya"
        Environment = "Dev"
    }
}