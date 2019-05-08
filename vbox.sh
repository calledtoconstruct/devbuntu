sudo add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian disco contrib"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-6.0
sudo rm /etc/dkms/sign-kernel-objects.conf
echo "POST_BUILD=../../../../../../root/sign-kernel.sh" | sudo tee /etc/dkms/sign-kernel-objects.conf
sudo cp ./setup/sign-kernel.sh /root/sign-kernel.sh
sudo chmod +x /root/sign-kernel.sh
sudo rm /etc/dkms/virtualbox.conf
sudo ln -s /etc/dkms/sign-kernel-objects.conf /etc/dkms/virtualbox.conf
