variable "region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "security_group_name" {
  type    = string
  default = "default-sg"
}

variable "iam_role_name" {
  type    = string
  default = "ec2-instance-role"
}

variable "instance_name" {
  type = string
}
