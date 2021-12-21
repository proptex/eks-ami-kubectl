FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl git

ARG KUBECTL_VERSION="1.20.4"
ARG KUBECTL_BUILD_DATE="2021-04-12"

RUN curl -L "https://amazon-eks.s3-us-west-2.amazonaws.com/${KUBECTL_VERSION}/${KUBECTL_BUILD_DATE}/bin/linux/amd64/kubectl" > /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# install aws-iam-authenticator
RUN curl -L "https://amazon-eks.s3-us-west-2.amazonaws.com/${KUBECTL_VERSION}/${KUBECTL_BUILD_DATE}/bin/linux/amd64/aws-iam-authenticator" > /usr/local/bin/aws-iam-authenticator \
    && chmod +x /usr/local/bin/aws-iam-authenticator

RUN mkdir /.kube
RUN touch /.kube/config
ENV KUBECONFIG="/.kube/config"

ENTRYPOINT ["/usr/local/bin/kubectl"]
