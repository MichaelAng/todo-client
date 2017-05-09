# Using Minikube
I assume you already have minikube started

# My startup script process
1. `minikube start --vm-driver=xhyve`
2. `eval $(minikube docker-env)`
3. `docker run -d -p 5000:5000 --restart=always --name registry registry:2`
4. `scripts/startup-minikube.sh`
5. `minikube service webserver`
6. `minikube dashboard`

# My update script process
1. `./scripts/update-minikube.sh v2`
2. `minikube service webserver`

# My clean up script
1. `./scripts/delete.sh`
2. `docker rm -f registry`
3. `minikube stop`
