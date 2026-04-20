provider "aws" {
    region = "ap-south-1"
  
}
terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "terraform200410"
    }
}
resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc
    tags = {
      Name = "${var.project}-myvpc"
    }
}
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.public_subnet
    availability_zone = var.az_1
    map_public_ip_on_launch = true
    tags = {
      Name = "${var.project}-public_subnet"
    }
}
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.private_subnet
    availability_zone = var.az_2
    tags = {
      Name = "${var.project}-private_subnet"
    }
}
resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = "${var.project}-public_route"
    }
}
resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = "${var.project}-private_route"
    }
}
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = "${var.project}-my_igw"
    }
}
resource "aws_route_table_association" "public_assoc" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route.id
}
resource "aws_route" "public_internet" {
    route_table_id = aws_route_table.public_route.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
}
resource "aws_route_table_association" "private_assoc" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route.id
}
resource "aws_eip" "nat_eip" {
    domain = "vpc"
}
resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      Name = "${var.project}-my_nat_gateway"
    }
    depends_on = [ aws_internet_gateway.my_igw ]
  
}
resource "aws_route" "private_internet" {
    route_table_id = aws_route_table.private_route.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
}
resource "aws_security_group" "my_sg" {
    name = "${var.project}-sg"
    vpc_id = aws_vpc.myvpc.id   #SAME VPC as subnet

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
resource "aws_instance" "public_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.az_1
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    subnet_id = aws_subnet.public_subnet.id

    user_data = <<-EOF
               #!/bin/bash
               apt-get update -y
               apt-get install -y apache2
               systemctl start apache2
               systemctl enable apache2
               echo "Hello" > /var/www/html/index.html
               EOF
    tags = {
      Name = "${var.project}-public_instance"
      env = var.env
    }
}

resource "aws_instance" "private_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.az_2
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    subnet_id = aws_subnet.private_subnet.id

user_data = <<-EOF
               #!/bin/bash
               apt-get update -y
               apt-get install -y nginx
               systemctl start nginx
               systemctl enable nginx
               echo "Hello" > /usr/share/nginx/html/index.html
               EOF
    tags = {
      Name = "${var.project}-private_instance"
      env = var.env
    }
}
