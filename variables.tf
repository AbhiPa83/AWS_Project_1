# Region
variable "region" {
  default = "ap-south-1"
}

# Instance Type
variable "instance_type" {
  default = "t2.micro"
}

# Key Pair to access 
variable "aws_key_pair" {
  default = "Test_projects"
}

# For List
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t3.micro"]
}

# For Map
variable "instnace_type_map" {
  description = "EC2 instance type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "test" = "t2.small"
    "prod" = "t3.micro"
  }
}
