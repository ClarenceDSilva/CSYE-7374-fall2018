kubectl apply -f templates/helm_spec.yaml
helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
helm init --service-account tiller
sleep 20
helm install --name myJenkins stable/jenkins;
sleep 50
printf $(kubectl get secret --namespace default myJenkins-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo