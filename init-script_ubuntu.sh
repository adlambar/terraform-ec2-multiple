#!/bin/bash 
$(date > /tmp/date.txt)
#To create partition

echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdf
mkfs -t ext4 /dev/xvdf1
mkdir -p /hana/shared/
mount /dev/xvdf1 /hana/shared/

echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdg
mkfs -t ext4 /dev/xvdg1
mkdir -p /hana/data
mount /dev/xvdg1 /hana/data

echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdh
mkfs -t ext4 /dev/xvdh1
mkdir -p /hana/log
mount /dev/xvdh1 /hana/log


#To grow partition
growpart /dev/xvdf 1
