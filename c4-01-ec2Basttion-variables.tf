# AWS EC2 instance terraform Variables

# AWS EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.mirco"
}

# AWS EC2 instance Key pair
variable "instance_keypair" {
  description = "Ec2 instance key pair"
  type = string
  default = "eks-terraform-key"
}
