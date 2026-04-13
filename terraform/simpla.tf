provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_instance" "my_instance" {
    ami = "ami-048f4445314bcaa09"
    instance_type = "t3.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = ["sg-0f4ec5a0c51b1f746"]
    tags = {
      name = "riya"
      Name = "Riya"
      Enviroment = "dev"
    }
  
}