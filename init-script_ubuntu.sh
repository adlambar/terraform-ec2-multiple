!#/bin/bash	 
echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/sdf	#Create Partition
mkfs -t ext4 /dev/xvf1
mkdir /storage1
mount /dev/sdf1 /storage1/
