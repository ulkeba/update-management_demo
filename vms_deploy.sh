#!/usr/bin/bash
## template vms.json taken from
## https://github.com/Azure/azure-quickstart-templates/blob/master/demos/azmgmt-demo/nestedtemplates/managedVms.json
## (with adoptions)

source ./environment.sh

az deployment group create \
    --resource-group $UPDATED_VMS_RG_NAME \
    --template-file ./vms.json \
    --parameters vmNamePrefix="$UPDATED_VMS_RG_NAME-vm-" \
    --parameters omsResourceGroup="$UPDATE_INFRASTRUCTURE_RG_NAME" \
    --parameters omsWorkspaceName="$UPDATE_INFRASTRUCTURE_RG_NAME-law" \
    --parameters @vms.demo.parameters.json \
    --name d_vm_$(date +%Y-%m-%d_%H-%M-%S)
