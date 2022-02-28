#!/usr/bin/bash
## template update-infrastructure.json taken from 
## https://docs.microsoft.com/en-us/azure/automation/update-management/enable-from-template
## (with adoptions)

source ./environment.sh

az group create --name $UPDATE_INFRASTRUCTURE_RG_NAME --location $LOCATION
az group create --name $UPDATED_VMS_RG_NAME --location $LOCATION

az deployment group create \
    --resource-group $UPDATE_INFRASTRUCTURE_RG_NAME \
    --template-file ./update-infrastructure.json \
    --parameters workspaceName="$UPDATE_INFRASTRUCTURE_RG_NAME-law" \
    --parameters automationAccountName="$UPDATE_INFRASTRUCTURE_RG_NAME-aa" \
    --parameters updatedVmsRgName="$UPDATED_VMS_RG_NAME" \
    --name d_ui_$(date +%Y-%m-%d_%H-%M-%S)
