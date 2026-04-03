provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "myinstance"{
    ami = "ami-01b14b7ad41e17ba4"
    instance_type = "t3.micro"
    key_name = "tf-1"
    vpc_security_group_id = [sg-0e4535a3abb5aba8a]
    tags = {
        Name = "Riya"
        Environment = "Dev"
    }
}