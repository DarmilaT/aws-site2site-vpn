variable "region_a" {
  description = "AWS Cloud site region (e.g. N. Virginia)"
  default     = "us-east-1"
}

variable "region_b" {
  description = "On Premise site region (e.g. N. California)"
  default     = "us-west-1"
}

# VPC CIDRs
variable "vpc_a_cidr" {
  description = "CIDR block for VPC A"
  default     = "10.10.0.0/16"
}

variable "vpc_b_cidr" {
  description = "CIDR block for VPC B"
  default     = "10.11.0.0/16"
}

# Subnet CIDRs for Region A
variable "vpc_a_public_subnet_az1" {
  default = "10.10.1.0/24"
}
variable "vpc_a_public_subnet_az2" {
  default = "10.10.2.0/24"
}
variable "vpc_a_private_subnet_az2" {
  default = "10.10.3.0/24"
}

# Subnet CIDRs for Region B
variable "vpc_b_public_subnet_az1" {
  default = "10.11.1.0/24"
}

# Availability Zones
variable "region_a_az1" {
  default = "us-east-1a"
}
variable "region_a_az2" {
  default = "us-east-1b"
}
variable "region_b_az1" {
  default = "us-west-1b"
}