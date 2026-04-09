variable "ami-id" {
    default = "ami-040e10ddbaf780d2f"
    description = "us-east-1"
}
variable "instance_type" {
    default = "t3.micro"
}
variable "key_name" {
    default = "tf-1"
}
variable "mysg" {
    default = "sg-0e4535a3abb5aba8a"
}
variable "rg" {
    default = "us-east-1"
}
variable "availability_zone" {
    default = "us-east-1"
}