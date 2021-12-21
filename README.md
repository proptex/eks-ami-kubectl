`kubectl` with `aws-iam-authenticator`, `curl` and `git`

add an `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` and a kube `config` file to `/.kube` folder.

`docker run -e AWS_ACCESS_KEY_ID=AKIASDFASDFASDFASDF -e AWS_SECRET_ACCESS_KEY=UIAxzsdiasdfASDFASdfasdfsdflA -v /home/user/.kube/config:/.kube/config eelptex1/eks-ami-kubectl get pods`

if you want to run any other command (rather than `kubectl`) override entrypoint

`docker run -e AWS_ACCESS_KEY_ID=AKIASDFASDFASDFASDF -e AWS_SECRET_ACCESS_KEY=UIAxzsdiasdfASDFASdfasdfsdflA -v /home/user/.kube/config:/.kube/config --entrypoint= eelptex1/eks-ami-kubectl kubectl get pods`
