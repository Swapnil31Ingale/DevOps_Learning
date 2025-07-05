variable aws_region {
  description = "The AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}
variable "availability_zone" {
  description = "Availability zone for the public and private subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition = can(cidrnetmask(var.vpc_cidr))
    error_message = "Invalid CIDR block for VPC. Please provide a valid CIDR block."
  }
}
variable "public_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.1.0/24"  
}
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"  
}

variable "instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"
  
}

variable "key_name" {
  description = "Key pair name for SSH access to the bastion host"
  type        = string
}

variable "my_ip" {
    description = "Your public IP address in CIDR format (e.g., 203.0.113.0/32) for SSH access"
    type = string
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "rds_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}