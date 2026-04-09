provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "my-instance" {
    ami = "ami-01b14b7ad41e17ba4"
    instance_type = "t3.micro"
    key_name = "tf-1"
    vpc_security_group_ids = [ "sg-0e4535a3abb5aba8a" ]
    tags = {
        name = "Ria"
        Environment = "Dev"
    }
}