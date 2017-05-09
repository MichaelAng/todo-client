# My startup script process
0. Make sure you are logged into the correct docker account.
1. `minikube start --vm-driver=xhyve`
2. `eval $(minikube docker-env)`
3. `scripts/startup.sh`
4. `minikube service webserver`

# My update script process
1. `./scripts/update.sh v2`
2. `minikube service webserver`
