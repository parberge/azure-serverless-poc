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

### Cleanup

Delete the resource group that was created in the [setup-containerapp.sh](setup-containerapp.sh) script.