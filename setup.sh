git config --global user.email joe@calledtoconstruct.net
git config --global user.name Joseph Woolley
sudo rsync -avx /home/ /media/ubuntu/data
sudo umount /media/ubuntu/data
sudo mount $(sudo fdisk --list | grep "52G 83 Linux" | cut -c1-9) /home
cd /home/ubuntu
sudo minikube config set vm-driver kvm2
sudo minikube config set disk-size "20g"
sudo minikube config set memory "4096"
sudo minikube config set cpus "4"
sudo usermod -a -G libvirt $(whoami)
#eval $(sudo minikube docker-env)
#gcloud init
#sudo kubectl apply -f kube-registry.yaml
#sudo kubectl port-forward --namespace kube-system $(sudo kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000
