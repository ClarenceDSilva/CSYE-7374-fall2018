# Build Docker container first and reference it in the csye-app.yaml image

# Running order
- kubectl apply -f csye-configmap.yaml
- kubectl apply -f redis-master.yaml
- sh redisconnect.sh
- kubectl apply -f csye-app.yaml
- kubectl apply -f csye-service.yaml

