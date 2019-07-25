sudo apt -y install xrdp
sudo systemctl enable xrdp
sudo apt -y install obs-studio
wget https://github.com/Palakis/obs-ndi/releases/download/4.5.3/obs-ndi_4.5.3-1_amd64.deb
wget https://github.com/Palakis/obs-ndi/releases/download/4.6.0/libndi3_3.8.0-1_amd64.deb
sudo dpkg -i obs-ndi_4.5.3-1_amd64.deb
sudo dpkg -i libndi3_3.8.0-1_amd64.deb
sudo cp /usr/lib/obs-plugins/* /usr/lib/x86_64-linux-gnu/obs-plugins/
sudo cp ./setup/Xwrapper.config /etc/X11/
passwd
gnome-session-quit