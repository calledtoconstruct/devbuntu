sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json
sudo apt remove --purge gnome-todo thunderbird* simple-scan libreoffice*
sudo apt autoremove
sudo apt autoclean
