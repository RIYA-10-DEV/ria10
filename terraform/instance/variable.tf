variable "ami-id" {
    default = "ami-048f4445314bcaa09"
    description = "ap-south-1_ami"
  
}
variable "instance_type" {
    default = "t3.micro"

}
variable "key-id" {
    default = "id-rsa"

}
variable "mysg" {
    default = "0f4ec5a0c51b1f746"
  
}
variable "rg" {
  default = "ap-south-1"

}
variable "az" {
    default = "ap-south-1a"
  
}