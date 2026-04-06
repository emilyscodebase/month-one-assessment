# AWS Region
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

# EC2 instance types
variable "bastion_instance_type" {
  description = "EC2 instance type for bastion host"
  type        = string
  default     = "t3.micro"
}

variable "web_instance_type" {
  description = "EC2 instance type for web servers"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_type" {
  description = "EC2 instance type for database server"
  type        = string
  default     = "t3.small"
}

# Your IP address (for Bastion SSH access)
variable "my_ip" {
  description = "Your current IP address"
  type        = string
}

# Key pair name
variable "key_name" {
  description = "The name of the AWS key pair to use for EC2"
  type        = string
}