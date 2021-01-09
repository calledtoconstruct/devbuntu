sudo apt remove --purge -y gnome-todo thunderbird* simple-scan libreoffice*

sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release --short --codename) universe"
sudo add-apt-repository -y ppa:openjdk-r/ppa

wget --quiet https://packages.microsoft.com/config/ubuntu/$(lsb_release --short --release)/packages-microsoft-prod.deb --output-document packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt update
sudo apt -y upgrade

sudo apt -y install apt-transport-https

sudo apt -y install python3 python3-pip dotnet-sdk-5.0 openjdk-11-jdk maven build-essential nodejs npm cabal-install
sudo apt -y install libvirt-clients libvirt-daemon-system qemu-kvm

sudo snap install docker
sudo snap install kubectl --classic
sudo snap install minikube
sudo snap install kompose
sudo snap install android-studio --classic
sudo snap install code --classic
sudo snap install google-cloud-sdk --classic

sudo apt -y install google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-go google-cloud-sdk-cbt google-cloud-sdk-cloud-build-local
sudo apt -y install google-cloud-sdk-app-engine-java google-cloud-sdk-pubsub-emulator

# dev in remote machine or container
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/vscode-remote-extensionpack/latest/vspackage --output-document ms-vscode-remote.vscode-remote-extensionpack.vsix
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/remote-containers/latest/vspackage --output-document ms-vscode-remote.remote-containers.vsix
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/remote-ssh/latest/vspackage --output-document ms-vscode-remote.remote-ssh.vsix
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/remote-wsl/latest/vspackage --output-document ms-vscode-remote.remote-wsl.vsix
# git
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/eamodio/vsextensions/gitlens/latest/vspackage --output-document eamodio.gitlens.vsix
# java
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/redhat/vsextensions/java/latest/vspackage --output-document redhat.java.vsix
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/vscjava/vsextensions/vscode-java-pack/latest/vspackage --output-document vscjava.vscode-java-pack.vsix
# docker
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-azuretools/vsextensions/vscode-docker/latest/vspackage --output-document ms-azuretools.vscode-docker.vsix
# kubernetes
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-kubernetes-tools/vsextensions/vscode-kubernetes-tools/latest/vspackage --output-document ms-kubernetes-tools.vscode-kubernetes-tools.vsix
# python
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/python/latest/vspackage --output-document ms-python.python.vsix
# typescript
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/vscode-typescript-tslint-plugin/latest/vspackage --output-document ms-vscode.vscode-typescript-tslint-plugin.vsix
# haskell
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/haskell/vsextensions/haskell/latest/vspackage --output-document haskell.haskell.vsix
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/justusadam/vsextensions/language-haskell/latest/vspackage --output-document justusadam.language-haskell.vsix
# c#
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-dotnettools/vsextensions/csharp/latest/vspackage --output-document ms-dotnettools.csharp.vsix
# c++
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/cpptools-extension-pack/latest/vspackage --output-document ms-vscode.cpptools-extension-pack.vsix
# uml
wget --quiet https://marketplace.visualstudio.com/_apis/public/gallery/publishers/jaimeolivares/vsextensions/yuml/latest/vspackage --output-document jaimeolivares.yuml.vsix

sudo apt autoremove -y
sudo apt autoclean

wget --quiet https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2
sudo install docker-machine-driver-kvm2 /usr/local/bin/

wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo npm i -g npm firebase-tools

sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

sudo cp ./setup/daemon.json /etc/docker/daemon.json
