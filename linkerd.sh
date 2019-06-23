curl -sL https://run.linkerd.io/install | sh
sudo cp $HOME/.linkerd2/bin/linkerd /usr/local/bin/linkerd
sudo linkerd install | sudo minikube kubectl -- apply -f -
sudo linkerd check
