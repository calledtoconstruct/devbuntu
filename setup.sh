#!/bin/bash
git config --global user.email joe@calledtoconstruct.net
git config --global user.name Joseph Woolley
sudo rsync -avx /home/ /media/ubuntu/data
sudo umount /media/ubuntu/data
if [ $(sudo fdisk --list | grep "52G 83 Linux" | wc -l) = 1 ]
then
    sudo mount $(sudo fdisk --list | grep "52G 83 Linux" | cut -c1-9) /home
else
    sudo mount $(sudo fdisk --list | grep "113.3G 83 Linux" | cut -c1-9) /home
fi
cd /home/ubuntu
sudo minikube config set vm-driver kvm2
sudo minikube config set disk-size "20g"
sudo minikube config set memory "4096"
sudo minikube config set cpus "4"
sudo usermod -a -G libvirt $(whoami)
cat aliases >> /home/ubuntu/.bashrc
#eval $(sudo minikube docker-env)
#gcloud init
#sudo minikube kubectl apply -f kube-registry.yaml
#sudo minikube kubectl port-forward --namespace kube-system $(sudo kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000
#Talk to Docker running on Cluster
#sudo docker --host="tcp://192.168.39.106:2376" --tlsverify="1" --tlscacert="/home/ubuntu/.minikube/certs/ca.pem" --tlscert="/home/ubuntu/.minikube/certs/cert.pem" --tlskey="/home/ubuntu/.minikube/certs/key.pem" images
#sudo docker --host="tcp://192.168.39.106:2376" --tlsverify="1" --tlscacert="/home/ubuntu/.minikube/certs/ca.pem" --tlscert="/home/ubuntu/.minikube/certs/cert.pem" --tlskey="/home/ubuntu/.minikube/certs/key.pem" build .
#sudo docker --host="tcp://192.168.39.106:2376" --tlsverify="1" --tlscacert="/home/ubuntu/.minikube/certs/ca.pem" --tlscert="/home/ubuntu/.minikube/certs/cert.pem" --tlskey="/home/ubuntu/.minikube/certs/key.pem" tag fb9db08c27aa item-api:v1.0.1
#sudo minikube kubectl create deployment item-api -- --image="item-api:v1.0.1"
#sudo minikube kubectl expose deployment item-api -- --type=LoadBalancer --port=8082
#Port Forward from Machine to Load Balancer
#sudo ssh -i ~/.minikube/machines/minikube/id_rsa docker@$(sudo minikube ip) -L \*:31245:0.0.0.0:31245
