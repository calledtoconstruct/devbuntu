# Development Machine Setup

This repository contains a set of shell scripts that can be used on a Linux (Debian/Ubuntu) machine to install and configure various development tools and toolchains.

# Usage

These scripts are intended to be used from a [Live CD](https://help.ubuntu.com/community/LiveCD), [Live USB Thumbdrive or Flash Card](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu#0).  When booting a machine from a Live CD, USB, or Flash drive, the operating system runs from a RAM Drive.  Therefore, all changes are forgotten / lost after shutdown or restart.

# Create a Custom Live Boot Drive

## Prerequisites

- Ubuntu Install CD, USB, or Flash Drive (in order to run Cubic)
- [Cubic](https://launchpad.net/cubic)
- Blank Writable CD (optional)
- USB Thumbdrive or Flash Card (32G or larger)
- Ubuntu Desktop or Server Installation Image (ISO format)
- CD Burning Software (if using CD for Boot)
- RUFUS (building via Windows) or Startup Disk Creator (building via Ubuntu)
- Disk Partition Software (if NOT using CD for Boot)

## Steps

- Boot a machine into Ubuntu (Installed to Hard Drive or Via Live CD, USB, or Flash Drive)
- Copy or Download Ubuntu Installation ISO Image
- Install and Run Cubic
```
sudo apt -y install cubic
cubic
```
- Select the Installation ISO from the previous step
- Once Cubic presents the chroot console:
    1. Install git
```
sudo apt -y install git
```
    2. Clone this repository
```
git clone https://github.com/calledtoconstruct/setup
chmod +x ./setup/*.sh
```
    3. Execute
```
./setup/dev-iso.sh
```
- Complete the Cubic Process which will produce a new ISO Image 
- Burn the Custom Installation ISO Image to CD, USB Drive or Flash Drive
- Repartition the Install Partition to 6G (USB Drive or Flash Drive only)
- Create "data" Partition in Remaining Space (USB Drive or Flash Drive only)
- Reboot into Custom Live Session using BIOS Boot Device Selection

# Development Environment

## Prerequisites

- Custom Live CD, USB Thumbdrive or Flash Card that Boots to a Live Session (See above)
- USB Thumbdrive or Flash Card with 26G or more Free Space
- Machine with 8G of RAM or more, CD Drive, USB Port and/or Flash Drive
- Internet Connection

## Steps

- Boot Machine into Live Session using Live CD, USB Thumbdrive or Flash Card
- Connect to WIFI or Wired Connection with Internet Access
- Install GIT
```
sudo apt -y install git
```
- Clone this Repository, Enable Execute of Scripts
```
git clone https://github.com/calledtoconstruct/setup
chmod +x ./setup/*.sh
```
- Execute the Setup Script
```
./setup/setup.sh
```
- Change the current working folder to the new $HOME (visually, you won't see a change)
```
cd /home/ubuntu
```
- Launch VS Code and Build Something Awesome
```
code
```

# Kubernetes Cluster

## Prerequisites

- Working Development Environment (see above)
- "data" Partition on USB Thumbdrive or Flash Card with at least 26G of Free Space

## Steps

- Start Kubernetes Cluster via MiniKube
```
minikube start
```
- Setup Aliases for Docker (so Docker connects to the repository within the minikube cluster)
```
alias dockerenv="eval \$(sudo minikube docker-env)"
alias dockerdo="sudo docker --host=\"\$DOCKER_HOST\" --tlsverify=1 --tlscacert=\"\$DOCKER_CERT_PATH/ca.pem\" --tlscert=\"\$DOCKER_CERT_PATH/cert.pem\" --tlskey=\"\$DOCKER_CERT_PATH/key.pem\""
dockerenv
```
- (From within a project with a Dockerfile) Run Docker Build
```
dockerdo build .
```
- Verify your Docker images built correctly
```
dockerdo images
```
- Deploy Your Awesome Application Containers

# Collaboration

If you like what you see here and would like to collaborate on this project, feel free to tweak the scripts and submit pull requests.  If you have ideas or questions, post them on GitHub.