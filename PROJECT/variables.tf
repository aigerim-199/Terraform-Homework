variable "aws_region" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "availability_zones" { type = list(string) }
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "private_key_path" {}

output "instance_ip" {
  value = aws_instance.group_1.public_ip
}