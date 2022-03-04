# The Docker base image

In order to run the tests inside a Docker container,  we have created a base Docker image 
 
The benefit with running the test  through docker is that we  don't need to worry about setting up our  local environment all the required tools to run terratest are installed inside  a conatainer.

## Prerequisites


>
> - Docker

> - An Azure subscription

> - A service principal

> - An azure storage account for tracking terraform remote backend state.

> - git

The base docker image will  pre-package dependencies  : Terraform, Go, Azure CLI, Terratest 
 
## Build the base image locally
```
sudo docker build --build-arg ARM_CLIENT_ID=$ARM_CLIENT_ID --build-arg ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET --build-arg ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID --build-arg ARM_TENANT_ID=$ARM_TENANT_ID -t imagename .
```

## Local Run the image
```
sudo docker run imagename
```
 ## Push the image to the docker hub 
 
To push the  image to Docker Hub, we must first name the local image using  our Docker Hub username and the repository name 

First we build it using
```
docker build -t <hub-user>/<repo-name>[:<tag>]
```
Then we tage the existing local image
```
docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]
```
 Now you can push tit to the registry designated 
```
 docker push <hub-user>/<repo-name>:<tag>
```

 
