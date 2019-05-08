wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-6.0
echo "POST_BUILD=../../../../../../root/sign-kernel.sh" | sudo tee /etc/dkms/sign-kernel-objects.conf
cp ./setup/sign-kernel.sh /root/sign-kernel.sh
sudo chmod +x /root/sign-kernel.sh
sudo ln -s /etc/dkms/sign-kernel-objects.conf /etc/dkms/virtualbox.conf
