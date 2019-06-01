#
# Android Studio
sudo snap install --classic android-studio
#
# Google Chrome Browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
#
# Open JDK 8 - Required by Google Cloud - Additional Packages
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt -y install openjdk-8-jdk
#
# Google Cloud - SDK
CLOUD_SDK_REPO="cloud-sdk-$(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2)"
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt update
sudo apt -y install google-cloud-sdk
#
# Google Cloud - Additional Packages
sudo apt -y install google-cloud-sdk-app-engine-java google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-go google-cloud-sdk-pubsub-emulator google-cloud-sdk-cbt google-cloud-sdk-cloud-build-local kubectl
gcloud init
#
# Firebase - SDK
sudo npm install -g firebase-tools
#
