1.  Created deployments and service

# What did I learn today

- I learned that the mongo connection in the API is trying to connect to the mongo service Not the deployment


- I learned the following commands

    kubectl rollout history deployment/api-deployment
    kubectl rollout undo deployment/api-deployment

- I learned that there are three ways to update a deployment
    * kubectl apply -f deployments/api-deployment.yml --record
    * kubectl edit deployment/nginx-deployment
    * kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1

- Starting up minikube
    minikube start --vm-driver=xhyve
    eval $(minikube docker-env)
    minikube stop


# My startup script process
1. `minikube start --vm-driver=xhyve`
2. `eval $(minikube docker-env)`
3. Get the deployment and service up

    kubectl create -f deployments/mongo-deployment.yml -f services/mongo-service.yml
    kubectl create -f deployments/api-deployment.yml -f services/api-service.yml
    kubectl create -f deployments/webserver-deployment.yml -f services/webserver-service.yml

4. Run `minikube service webserver-service`
5. Navigate to `${mini-kube}:***/todos`

