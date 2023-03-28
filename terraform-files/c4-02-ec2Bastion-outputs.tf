# AWS EC2 Instance terraform Outputs
# Public EC2 Instance - Bastion Host

# ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "list of IDs of instances"
  value = module.ec2_public.id
}

# ec2_bastion_public_ip
output "ec2_bastion_eip" {
  description = "elastic ip associated to the Bastion Host"
  value = aws_eip.bastion_eip.public_ip
}