variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}
variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}
variable "subnet3_cidr" {
  default = "10.0.3.0/24"
}
variable "subnet4_cidr" {
  default = "10.0.4.0/24"
}
variable "subnet5_cidr" {
  default = "10.0.5.0/24"
}
variable "subnet6_cidr" {
  default = "10.0.6.0/24"
}
variable "keypair" {
  default = "terraform_key"
  description = "Name of the AWS key pair to use for EC2 instances"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}
variable "public_subnet" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet" {
  description = "List of private subnet IDs"
  type        = list(string)
}