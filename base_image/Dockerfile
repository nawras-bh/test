FROM golang:1.17


RUN apt-get update &&  apt-get install -y gnupg software-properties-common curl ca-certificates apt-transport-https lsb-release 

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg |  apt-key add -

RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN apt-get update &&  apt-get install terraform

RUN terraform -help

RUN apt-get update &&  apt-get install azure-cli -y
ARG ARM_CLIENT_ID
ARG ARM_SUBSCRIPTION_ID
ARG ARM_CLIENT_SECRET
ARG ARM_TENANT_ID

ENV ARM_CLIENT_ID $ARM_CLIENT_ID
ENV ARM_CLIENT_SECRET $ARM_CLIENT_SECRET
ENV ARM_TENANT_ID $ARM_TENANT_ID
ENV ARM_SUBSCRIPTION_ID $ARM_SUBSCRIPTION_ID