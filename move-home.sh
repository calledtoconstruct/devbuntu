sudo rsync -avx /home/ /media/ubuntu/data
sudo umount /media/ubuntu/data
sudo mount $(sudo fdisk --list | grep "52G 83 Linux" | cut -c1-9) /home
cd /home/ubuntu
