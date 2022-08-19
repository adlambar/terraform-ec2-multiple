#!/bin/bash 
$(date > /tmp/date.txt)
echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdf
mkfs -t ext4 /dev/xvdf1
mkdir /storage1
mount /dev/xvdf1 /storage1/
