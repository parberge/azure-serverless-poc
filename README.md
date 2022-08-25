# INTRO

A simple demo of using one or more of the azure serverless services.

## Requirements
* An azure subscription
* The azure CLI
* Docker

## Services to test

This demo will test the following services:
* [azure container apps](https://azure.microsoft.com/en-us/services/container-apps/#overview)
* [azure functions](https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview)

Both seem to support container images (which I see as a requirement). Container apps is new and seem to have a bit more flexibility.


### Testing container apps

To get started, run the [setup-containerapp.sh](setup-containerapp.sh) script.  
When done it should give you an URL that should work :smile:


#### Creating new release

**Note:** This step assumes you have already run the [setup-containerapp.sh](setup-containerapp.sh) script.

If you want to test changing something in [app.py](app.py) and deploy it, do the following:
1. Do your changes and build the new image
    
    `docker build -t <my-registry>.azurecr.io/flask-demo:<version>`

    _Note: `my-registry` is defined in [setup-containerapp.sh](setup-containerapp.sh) and `version` should be a unique version number, usually an increment of the latest version._ 

2. Push this image to the registry
    
    `docker push <my-registry>.azurecr.io/flask-demo:<version>`

3. Update the container app

    `az containerapp update --resource-group <my-resource-group> --name flask-demo --image <my-registry>.azurecr.io/flask-demo:<version>`

#### Cleanup

Delete the resource group that was created in the [setup-containerapp.sh](setup-containerapp.sh) script.