#!/bin/bash
echo "Criando as imagens....."
docker build -t evandrofernandes/projeto-backend:1.2 app/.
docker build -t evandrofernandes/projeto-database:1.2 database/.

echo "Realizando o push das imagens....."
docker push evandrofernandes/projeto-backend:1.2
docker push evandrofernandes/projeto-database:1.2

echo "Criando serviços no cluster kubernetes....."
kubectl apply -f ./services.yaml

echo "Realizando os deployments....."
kubectl apply -f ./deployment.yaml
