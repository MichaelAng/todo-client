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
