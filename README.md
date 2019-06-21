# Development Machine Setup

This repository contains a set of shell scripts that can be used on a Linux (Debian/Ubuntu) machine to install and configure various development tools and toolchains.

# Usage

These scripts are intended to be used from a [Live CD](https://help.ubuntu.com/community/LiveCD), [Live USB Thumbdrive or Flash Card](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu#0).  When booting a machine from a Live CD, USB, or Flash drive, the operating system runs from a RAM Drive.  Therefore, all changes are forgotten / lost after shutdown or restart.

# NOTICE

The strategy for using these scripts has changed!  The below information is out of date and will be revised when things settle down a bit.  The quick summary is this: Instead of booting to the standard Ubuntu Live, I am now using Cubic to build a custom Ubuntu Live boot device.  Once the machine has booted, the setup script configures settings that are not retained by the Cubic build.





# Create a Live Boot Drive

## Prerequisites

- Blank Writable CD (optional)
- USB Thumbdrive or Flash Card (32G or larger)
- Ubuntu Desktop or Server Installation Image (ISO format)
- CD Burning Software (if using CD for Boot)
- RUFUS (building via Windows) or Startup Disk Creator (building via Ubuntu)
- Disk Partition Software (if NOT using CD for Boot)

## Steps

- Burn Ubuntu Installation Image to CD, USB Drive or Flash Drive
- Repartition the Install Partition to 6G (USB Drive or Flash Drive only)
- Create "data" Partition in Remaining Space (USB Drive or Flash Drive only)
- Reboot into Live Session using BIOS Boot Device Selection

# Development Environment

## Prerequisites

- Live CD, USB Thumbdrive or Flash Card that Boots to a Live Session (See above)
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
- Execute Clean-up and Setup Scripts
```
./setup/clean-up.sh
./setup/setup.sh
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

- Move /home to USB Thumbdrive or Flash Card (as RAM Drive is likely insufficient)
```
./setup/move-home.sh
```
- Install MiniKube and KVM Virtualization Software
```
./setup/minikube.sh
./setup/kvm.sh
```
- Start Kubernetes Cluster via MiniKube
```
minikube start
```
- Deploy Your Awesome Application Containers

# Collaboration

If you like what you see here and would like to collaborate on this project, feel free to tweak the scripts and submit pull requests.  If you have ideas or questions, post them on GitHub.