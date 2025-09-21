resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [ aws_security_group.allow_all1.id ]
  #vpc_security_group_ids = local.sg_id
  tags = var.ec2-tags
}

resource "aws_security_group" "allow_all1" {
    name        = var.sg_name
    description = var.sg_desc

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    lifecycle {
      create_before_destroy = true
    }

    tags = var.sg_tags
}