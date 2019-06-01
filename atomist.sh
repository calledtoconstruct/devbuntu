sudo apt -y install atfs
sudo npm install --global @atomist/cli --unsafe-perm=true --allow-root
gnome-terminal -- atomist feed & disown
ATOMIST_MODE=local
atomist start
