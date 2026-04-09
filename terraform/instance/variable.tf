variable "ami-id" {
    default = "ami-0ea87431b78a82070"
    description = "us-east-1"
}
variable "instance_type" {
    default = "t3.small"
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