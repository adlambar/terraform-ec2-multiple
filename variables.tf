variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

variable "instance_ami" {
  description = "EC2 instance AMI"
  default     = "ami-052efd3df9dad4825"
}

variable "instance_user_data" {
  description = "Init script user_data"
  default     = "init-script.sh"
}

variable "instance_sgs" {
  description = "Security Groups"
  default     = "general"
}

variable "instances_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "volumes_count" {
  description = "Number of EBS volumes per EC2 instances"
  type        = number
  default     = 1
}
/*
Free Tiers for N. Virginia
Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type     ami-090fa75af13c156b4
Red Hat Enterprise Linux 8 (HVM), SSD Volume Type           ami-06640050dc3f556bb
SUSE Linux Enterprise Server 15 SP4 (HVM), SSD Volume Type  ami-08e167817c87ed7fd
Ubuntu Server 22.04 LTS (HVM), SSD Volume Type              ami-052efd3df9dad4825
Debian 11 (HVM), SSD Volume Type                            ami-09a41e26df464c548
Microsoft Windows Server 2019 Base with Containers          ami-0c4fbf8692f7dd2da
*/
