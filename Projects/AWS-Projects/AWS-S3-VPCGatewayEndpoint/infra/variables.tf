variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}

variable "instance_type" {
  default = "t2.micro"
}
