variable "ami_id" {
    default = "ami-07a6f770277670015"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "subnet_id" {}
variable "vpc_id" {}
variable "instance_name" {}
variable "is_public" {
    default = true
}
