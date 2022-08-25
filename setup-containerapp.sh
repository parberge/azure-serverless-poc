#!/bin/bash
set -e

RESOURCE_GROUP="parberge-hackathon"
ACR_NAME="hackathonimages"
LOCATION="northeurope"
ENVIRONMENT="hackathon-container-env"
APP_NAME="flask-demo"
IMAGE_NAME="${APP_NAME}:0.0.1"

echo "Enable required extension and providers"
az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

echo "Create resource group"
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "setup container image registry"
az acr create \
  --resource-group $RESOURCE_GROUP \
  --name $ACR_NAME \
  --sku Basic \
  --admin-enabled true

echo "Login to registry"
az acr login --name $ACR_NAME

echo "Creating container app environment"
az containerapp env create \
  --name $ENVIRONMENT \
  --resource-group $RESOURCE_GROUP \
  --location "$LOCATION"

echo "Build container image $IMAGE_NAME"
docker build --tag $ACR_NAME.azurecr.io/$IMAGE_NAME .

echo "Pushing image to registry"
docker push $ACR_NAME.azurecr.io/$IMAGE_NAME

echo "Create the container app"
az containerapp create \
  --name $APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --environment $ENVIRONMENT \
  --image $ACR_NAME.azurecr.io/$IMAGE_NAME \
  --target-port 5000 \
  --ingress 'external' \
  --registry-server $ACR_NAME.azurecr.io \
  --query configuration.ingress.fqdn