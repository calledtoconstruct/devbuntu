#!/bin/bash

# Install Ubuntu repository
sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"

# Clean-up unnecessary applications
sudo apt remove --purge -y gnome-todo thunderbird* simple-scan libreoffice*
sudo apt -y install dialog

INSTALL_TYPESCRIPT="N"
INSTALL_DOTNET="N"
INSTALL_CPLUSPLUS="N"
INSTALL_JAVA="N"
INSTALL_PYTHON="N"
INSTALL_HASKELL="N"
INSTALL_DOCKER_MINIKUBE="N"
INSTALL_GOOGLE_CLOUD="N"
INSTALL_FIREBASE="N"
INSTALL_VSCODE="N"
INSTALL_OBS_STUDIO="N"
INSTALL_REMOTE_ACCESS="N"

MENU_OPTIONS=
MENU_OPTIONS="${MENU_OPTIONS} T typescript/nodejs on "
MENU_OPTIONS="${MENU_OPTIONS} N c#/dotnet on "
MENU_OPTIONS="${MENU_OPTIONS} C c/c++ on "
MENU_OPTIONS="${MENU_OPTIONS} J java on "
MENU_OPTIONS="${MENU_OPTIONS} P python on "
MENU_OPTIONS="${MENU_OPTIONS} H haskell on "
MENU_OPTIONS="${MENU_OPTIONS} D docker/minikube on "
MENU_OPTIONS="${MENU_OPTIONS} G google-cloud on "
MENU_OPTIONS="${MENU_OPTIONS} F firebase on "
MENU_OPTIONS="${MENU_OPTIONS} V vscode on "
MENU_OPTIONS="${MENU_OPTIONS} O obs-studio/ndi-plugin on "
MENU_OPTIONS="${MENU_OPTIONS} R remote-access on "

choices=$(dialog --separate-output --checklist "Select options:" 22 76 16 ${MENU_OPTIONS} 2>&1 >/dev/tty)
clear
for choice in ${choices}
do
  if   [ "${choice}" = "T" ]; then INSTALL_TYPESCRIPT="Y"
  elif [ "${choice}" = "N" ]; then INSTALL_DOTNET="Y"
  elif [ "${choice}" = "C" ]; then INSTALL_CPLUSPLUS="Y"
  elif [ "${choice}" = "J" ]; then INSTALL_JAVA="Y"
  elif [ "${choice}" = "P" ]; then INSTALL_PYTHON="Y"
  elif [ "${choice}" = "H" ]; then INSTALL_HASKELL="Y"
  elif [ "${choice}" = "D" ]; then INSTALL_DOCKER_MINIKUBE="Y"
  elif [ "${choice}" = "G" ]; then INSTALL_GOOGLE_CLOUD="Y"
  elif [ "${choice}" = "F" ]; then INSTALL_FIREBASE="Y"
  elif [ "${choice}" = "V" ]; then INSTALL_VSCODE="Y"
  elif [ "${choice}" = "O" ]; then INSTALL_OBS_STUDIO="Y"
  elif [ "${choice}" = "R" ]; then INSTALL_REMOTE_ACCESS="Y"
  fi
done

# Install key for Microsoft repository
if [ "${INSTALL_DOTNET}" = "Y" ] || [ "${INSTALL_VSCODE}" = "Y" ]
then wget --quiet https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
fi

# Install Microsoft repository
if [ "${INSTALL_DOTNET}" = "Y" ] || [ "${INSTALL_VSCODE}" = "Y" ]; then
  sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  wget --quiet https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
fi

# Install Google Cloud repository
if [ "${INSTALL_GOOGLE_CLOUD}" = "Y" ]; then
  wget --quiet https://packages.cloud.google.com/apt/doc/apt-key.gpg -O- | sudo apt-key add -
  CLOUD_SDK_REPO="cloud-sdk-$(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2)"
  sudo add-apt-repository -y "deb https://packages.cloud.google.com/apt cloud-sdk main"
  # sudo add-apt-repository -y "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main"
fi

# Install Docker repository
if [ "${INSTALL_DOCKER_MINIKUBE}" = "Y" ]; then
  wget --quiet https://download.docker.com/linux/ubuntu/gpg -O- | sudo apt-key add -
  sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -sc) stable"
fi

# Ubuntu upgrade
sudo apt update
sudo apt -y upgrade

# OBS Studio
if [ "${INSTALL_OBS_STUDIO}" = "Y" ]; then
  sudo apt -y install obs-studio
  wget https://github.com/Palakis/obs-ndi/releases/download/4.9.1/obs-ndi_4.9.1-1_amd64.deb
  wget https://github.com/Palakis/obs-ndi/releases/download/4.9.1/libndi4_4.5.1-1_amd64.deb
  sudo dpkg -i obs-ndi_4.9.1-1_amd64.deb
  sudo dpkg -i libndi4_4.5.1-1_amd64.deb
  sudo cp /usr/lib/obs-plugins/* /usr/lib/x86_64-linux-gnu/obs-plugins/
fi
# Remote Access
if [ "${INSTALL_REMOTE_ACCESS}" = "Y" ]; then
  sudo apt -y install xrdp
  sudo systemctl enable xrdp
  sudo cp ./devbuntu/Xwrapper.config /etc/X11/
fi
# VSCode
if [ "${INSTALL_VSCODE}" = "Y" ]
then sudo apt -y install code
fi
# Python
if [ "${INSTALL_PYTHON}" = "Y" ]
then sudo apt -y install python3 python3-pip
fi
# Java
if [ "${INSTALL_JAVA}" = "Y" ]
then sudo apt -y install default-jdk
fi
# Node, TypeScript
if [ "${INSTALL_TYPESCRIPT}" = "Y" ]
then sudo apt -y install nodejs npm
fi
# Haskell
if [ "${INSTALL_HASKELL}" = "Y" ]
then sudo apt -y install cabal-install
fi
# Docker
if [ "${INSTALL_DOCKER_MINIKUBE}" = "Y" ]
then sudo apt -y install docker-ce docker-ce-cli containerd.io
fi
# Google Cloud SDK
if [ "${INSTALL_GOOGLE_CLOUD}" = "Y" ]; then
  sudo apt -y install google-cloud-sdk
  sudo apt -y install google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-go google-cloud-sdk-cbt google-cloud-sdk-cloud-build-local
  sudo apt -y install google-cloud-sdk-app-engine-java google-cloud-sdk-pubsub-emulator 
fi
# C# and dotnet
if [ "${INSTALL_DOTNET}" = "Y" ]
then sudo apt -y install dotnet-sdk-5.0
fi
# C++
if [ "${INSTALL_CPLUSPLUS}" = "Y" ]
then sudo apt -y install build-essential
fi

sudo apt autoremove -y
sudo apt autoclean

if [ "${INSTALL_DOCKER_MINIKUBE}" = "Y" ]; then
  # Kompose
  wget --quiet https://github.com/kubernetes/kompose/releases/download/v1.18.0/kompose-linux-amd64 --output-document kompose
  chmod +x ./kompose
  sudo mv ./kompose /usr/local/bin/kompose

  # kubectl
  wget --quiet https://storage.googleapis.com/kubernetes-release/release/$(wget --quiet https://storage.googleapis.com/kubernetes-release/release/stable.txt -O-)/bin/linux/amd64/kubectl --output-document kubectl
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl

  # minikube
  wget --quiet minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 --output-document minikube
  chmod +x ./minikube
  sudo mv ./minikube /usr/local/bin

  # docker machine driver using kvm2
  wget --quiet https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 --output-document docker-machine-driver-kvm2
  sudo install docker-machine-driver-kvm2 /usr/local/bin/

  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service

  mkdir --parents /etc/docker
  sudo cp ./devbuntu/daemon.json /etc/docker/daemon.json
fi

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# firebase
if [ "${INSTALL_FIREBASE}" = "Y" ]
then sudo npm i -g npm firebase-tools
fi