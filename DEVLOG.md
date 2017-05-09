# What did I learn today

- I learned that the mongo connection in the API is trying to connect to the mongo service Not the deployment

- I learned the following commands

    kubectl rollout history kubeyaml/api-deployment
    kubectl rollout undo kubeyaml/api-deployment

- I learned that there are three ways to update a deployment
    * kubectl apply -f kubeyaml/api-deployment.yml --record
    * kubectl edit deployment/nginx-deployment
    * kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1

- Starting up minikube
    minikube start --vm-driver=xhyve
    eval $(minikube docker-env)
    minikube stop