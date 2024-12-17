provider "aws" {
  region = var.region
}

resource "aws_security_group" "instance_sg" {
  name = var.security_group_name
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "instance_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_instance" "ec2_instance" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_groups      = [aws_security_group.instance_sg.id]
  iam_instance_profile = aws_iam_role.instance_role.name
  tags = {
    Name = var.instance_name
  }
}
