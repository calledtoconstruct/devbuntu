git config --global user.email joe@calledtoconstruct.net
git config --global user.name Joseph Woolley
sudo rsync -avx /home/ /media/ubuntu/data
sudo umount /media/ubuntu/data
sudo mount $(sudo fdisk --list | grep "52G 83 Linux" | cut -c1-9) /home
cd /home/ubuntu
sudo minikube config set vm-driver kvm2
sudo minikube config set disk-size "8g"
sudo usermod -a -G libvirt $(whoami)
eval $(sudo minikube docker-env)
gcloud init
