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
 /* ebs_block_device  {
    device_name = "/dev/xvdf"
    tags = {
       FileSystem = "/web/data"
       Name = "/web/data"
    }
    volume_size = 4
    volume_type = "gp2"
    delete_on_termination = true
  }*/
}

resource "aws_ebs_volume" "ebs_volume" {
  count             = var.instances_count * var.volumes_count
  availability_zone = aws_instance.instance[floor(count.index / var.volumes_count)].availability_zone
  size              = 4
  type              = "gp2"
  tags = {
    Name = "${var.instance_name}-${floor(count.index / var.volumes_count)}-ebs-volume-${count.index % var.volumes_count}"   
  }
}

resource "aws_volume_attachment" "ebs_att" {
  count       = var.instances_count * var.volumes_count
  device_name = "${var.instance_device_names[count.index % var.volumes_count]}"
  volume_id   = aws_ebs_volume.ebs_volume[count.index].id
  instance_id = aws_instance.instance[floor(count.index / var.volumes_count)].id
}
