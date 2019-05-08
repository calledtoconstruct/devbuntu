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

for k in $(ls /var/lib/initramfs-tools) ; do
 for d in $(cd /usr/src; ls -d *-*) ; do
  [[ -f /usr/src/${d}/dkms.conf ]] || continue
  m=$(echo $d | sed -r -e 's/-([0-9]).+//')
  v=$(echo $d | sed -r -e 's/[^0-9]+-([0-9])/\1/')
  sudo /usr/sbin/dkms install -c /usr/src/$d/dkms.conf -m $m -v $v -k $k
 done
done 
