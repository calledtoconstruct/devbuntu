curl -sL https://run.linkerd.io/install | sh
sudo cp $HOME/.linkerd2/bin/linkerd /usr/local/bin/linkerd
linkerd install | minikube kubectl -- apply -f -
linkerd check
