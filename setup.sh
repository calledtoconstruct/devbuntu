sudo apt update
sudo apt upgrade
sudo add-apt-repository ppa:hvr/ghc
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code git nodejs npm
