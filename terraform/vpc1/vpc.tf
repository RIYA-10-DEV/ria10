provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "myvpc"
      Name = "Riya"
      env = "dev"
    }
}

resource "aws_subnet" "pub-sub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "pub_sub"
      name = "riya"
      env = "dev"
    }
  map_public_ip_on_launch = true
}
resource "aws_subnet" "pvt-sub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "pvt-sub"
      name = "riya"
      env = "dev"
    }
  
}
resource "aws_internet_getway" "myigw" {
    vpc_id = aws_vpc.myvpc.id

}
resource "aws_route_table" "myroute" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "10.0.1.0/24"
        gateway_id = aws_internet_gateway.myroute.id
    }
}

resource "aws_route_table_association" "attach_igw" {
    route_table_id = aws_route_table.myroute.id
    gateway_id = aws_internet_gateway.myigw.id
    subnet_id = aws_subnet.pub-sub.id
  
}
