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
  count                     = length(var.instance_config)
  ami                       = var.instance_config[count.index].ami
  instance_type             = var.instance_type
  key_name                  = "ec2_keypair"
  vpc_security_group_ids    = data.aws_security_groups.sgs.ids
  user_data                 = file(var.instance_config[count.index].userdata)
  tags = {    
    Name = "${var.instance_config[count.index].Name}"
  }  
}

resource "aws_ebs_volume" "ebs_volume" {
  count             = length(var.instance_config) * length(var.volumes)
  availability_zone = aws_instance.instance[floor(count.index / length(var.volumes))].availability_zone
  size              = var.volumes[count.index % length(var.volumes)].size
  type              = var.volumes[count.index % length(var.volumes)].type
  tags = {
    Name = "${var.instance_config[floor(count.index / length(var.volumes))].ami}-ebs-volume-${var.volumes[count.index % length(var.volumes)].Name}"   
  }
}

resource "aws_volume_attachment" "ebs_att" {
  count       = length(var.instance_config) * length(var.volumes)
  stop_instance_before_detaching = true
  device_name = "${var.instance_device_names[count.index % length(var.volumes)]}"
  volume_id   = aws_ebs_volume.ebs_volume[count.index].id
  instance_id = aws_instance.instance[floor(count.index / length(var.volumes))].id  
}
