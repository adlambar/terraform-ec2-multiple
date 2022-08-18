# terraform-ec2-multiple

To create a partition and a ext4 in a ebs in Ubuntu

!#/bin/bash	 
echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdf	#Create Partition
mkfs -t ext4 /dev/xvdf1
mkdir /storage
mount /dev/xvdf1 /storage/

