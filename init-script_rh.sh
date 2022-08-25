#!/bin/bash 
$(date > /tmp/date.txt)

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

#To create partition
#echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdf
#mkfs -t xfs /dev/xvdf1
#mkdir -p /hana/shared/
#mount /dev/xvdf1 /hana/shared/

#echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdg
#mkfs -t xfs /dev/xvdg1
#mkdir -p /hana/data
#mount /dev/xvdg1 /hana/data

#echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdh
#mkfs -t xfs /dev/xvdh1
#mkdir -p /hana/log
#mount /dev/xvdh1 /hana/log
