variable "vpc" {
    default = "10.0.0.0/16"
}

variable "public_subnet" {
    default = "10.0.10.0/24"
}

variable "private_subnet" {
    default = "10.0.20.0/24"
}

variable "az_1" {
    default = "ap-south-1a"
}

variable "az_2" {
    default = "ap-south-1b"
}

variable "ami_id" {
    default = "ami-048f4445314bcaa09"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "key_name" {
    default = "id_rsa"
}

variable "project" {
    default = "cloud"
}

variable "env" {
    default = "dev"
}