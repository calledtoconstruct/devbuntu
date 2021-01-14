sudo apt -y install xrdp
sudo systemctl enable xrdp
sudo apt -y install obs-studio
wget https://github.com/Palakis/obs-ndi/releases/download/4.9.1/obs-ndi_4.9.1-1_amd64.deb
wget https://github.com/Palakis/obs-ndi/releases/download/4.9.1/libndi4_4.5.1-1_amd64.deb
sudo dpkg -i obs-ndi_4.9.1-1_amd64.deb
sudo dpkg -i libndi4_4.5.1-1_amd64.deb
sudo cp /usr/lib/obs-plugins/* /usr/lib/x86_64-linux-gnu/obs-plugins/
sudo cp ./devbuntu/Xwrapper.config /etc/X11/
sudo passwd
gnome-session-quit