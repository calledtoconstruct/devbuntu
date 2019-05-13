sudo apt install -y libvirt-clients libvirt-daemon-system qemu-kvm
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo systemctl status libvirtd.service
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 && sudo install docker-machine-driver-kvm2 /usr/local/bin/
minikube config set vm-driver kvm2
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
