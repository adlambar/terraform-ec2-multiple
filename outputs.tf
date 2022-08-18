/*output "instance_ami" {
  value = aws_instance.instance.ami
}

output "instance_arn" {
  value = aws_instance.instance.arn
}

output "instance_id" {
  value = aws_instance.instance.id
}

output "instance_public_ip" {
  value = aws_instance.instance.public_ip
}

output "instance_name" { 
  value = "${lookup(aws_instance.instance.tags, "Name")}"
}

output "sgs_ids" { 
  value = data.aws_security_groups.sgs.ids  
}
*/
  
output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = aws_instance.instance.*.id
}

output "instance_public_ip" {
  value = aws_instance.instance.*.public_ip
}
