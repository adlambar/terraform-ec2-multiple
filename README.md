# terraform-ec2-multiple

To create a partition and a ext4 in a ebs in Ubuntu

#!/bin/bash
$(date > /tmp/date.txt)
#To create partition

echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdf
mkfs -t ext4 /dev/xvdf1
mkdir -p /hana/shared
mount /dev/xvdf1 /hana/shared

echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdg
mkfs -t ext4 /dev/xvdg1
mkdir -p /hana/data
mount /dev/xvdg1 /hana/data

echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdh
mkfs -t ext4 /dev/xvdh1
mkdir -p /hana/log
mount /dev/xvdh1 /hana/log

echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdi
mkfs -t ext4 /dev/xvdi1
mkdir -p /usr/sap
mount /dev/xvdi1 /usr/sap

#To grow partition
growpart /dev/xvdf 1

#To Grow FS
[XFS file system]
xfs_growfs -d /filesystem

[Ext4 file system]
resize2fs /dev/xvdf1
