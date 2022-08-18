provider "aws" {
  region = var.region
}

data "aws_security_groups" "sgs" {
  filter {
    name   = "group-name"
    values = [var.instance_sgs]
  }
}

resource "aws_instance" "instance" {  
  count                     = var.instances_count
  ami                       = var.instance_ami
  instance_type             = var.instance_type
  key_name                  = "ec2_keypair"
  vpc_security_group_ids    = data.aws_security_groups.sgs.ids
  user_data                 = file(var.instance_user_data)
  tags = {    
    Name = "${var.instance_name}-${count.index}"
  }
  ebs_block_device  {
    device_name = "/dev/xvdba"
    tags = {
       FileSystem = "/web/data"
    }
    volume_size = 2
    volume_type = "gp3"
    delete_on_termination = true
  }
}
