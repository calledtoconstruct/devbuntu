CLOUD_SDK_REPO="cloud-sdk-$(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2)"

sudo apt remove --purge -y gnome-todo thunderbird* simple-scan libreoffice*

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo add-apt-repository -y ppa:openjdk-r/ppa

sudo apt -y install curl

echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo apt update
sudo apt -y upgrade

sudo apt -y install openjdk-11-jdk
sudo apt -y install code nodejs npm cabal-install
sudo apt -y install libvirt-clients libvirt-daemon-system qemu-kvm docker.io
sudo apt -y install google-cloud-sdk
sudo apt -y install google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-go google-cloud-sdk-cbt google-cloud-sdk-cloud-build-local

sudo apt -y install google-cloud-sdk-app-engine-java google-cloud-sdk-pubsub-emulator 

sudo snap install --classic android-studio

sudo apt autoremove -y
sudo apt autoclean

curl -L https://github.com/kubernetes/kompose/releases/download/v1.18.0/kompose-linux-amd64 -o kompose
chmod +x ./kompose
sudo mv ./kompose /usr/local/bin/kompose

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x ./minikube
sudo mv ./minikube /usr/local/bin

sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2
sudo install docker-machine-driver-kvm2 /usr/local/bin/

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo npm i -g npm firebase-tools

sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

sudo cp ./setup/daemon.json /etc/docker/daemon.json
