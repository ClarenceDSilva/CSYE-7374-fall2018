# Advanced Cloud Computing
Private repository for Fall 18 Advanced Cloud Computing course @ Northeastern University COE. 

## Contents
Following are the major contents of this repo:
- [**KOPS.pptx**](https://github.com/adityarkelkar/csye7374-fall2018/blob/master/KOPS.pptx): Contains steps to setup a Kubernetes cluster with the help of the KOPS provisioning tool
- [**redis**](https://github.com/adityarkelkar/csye7374-fall2018/tree/master/redis): Contains native k8s templates and setup script to create a redis cluster in 1 Master and 2 Slave configuration in the k8s cluster. Also running redis sentinel in a sidecar with the redis servers
- [**webapp**](https://github.com/adityarkelkar/csye7374-fall2018/tree/master/webapp): Contains a Dockerfile, templates and setup script to deploy a sample nodejs app to the k8s cluster connected to the redis database
- [**prometheus**](https://github.com/adityarkelkar/csye7374-fall2018/tree/master/prometheus): Contains templates and setup script to ship the redis database and webapp data to prometheus and grafana dashboard