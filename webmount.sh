#!/bin/bash
sudo yum-config-manager --enable epel
sudo yum update -y
sudo yum -y install nfs-utils
sudo mkdir /mnt/efs
sudo mount -t nfs4 -o nfsvers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).${aws_efs_file_system.appdata_efs.id}.efs.${var.AWS_REGION}.amazonaws.com:/ /mnt/efs
sudo echo "$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).${aws_efs_file_system.appdata_efs.id}.efs.${var.AWS_REGION}.amazonaws.com:/ /mnt/efs nfs defaults 0 0" >> /etc/fstab
