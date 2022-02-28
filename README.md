# Overview

The ARM templates in this repository deploy following components:
- One resource group containing...
  - ...a Log Analytics Workspace
  - ...an Automation Account including an Update Deployment Schedule (The schedule will deploy updates daily; the first time 30 minutes after deployment.) for Linux-based OS applied to...
- ...another resource group for Virtual Machines. 

# Deployment
- Adjust variables defined in `environment.sh` as you like.
- Deploy Update Infrastructure by running `update-infrastructure_deploy.sh`.
- Deploy a Demo VM by running `vms_deploy.sh`.
- Be patient and wait some minutes until Update Management has deployed the Update Agent to the VM and VM has been assessed.

# Resources
Following resources were used for this demo:
- [Enable Update Management using Azure Resource Manager template](https://docs.microsoft.com/en-us/azure/automation/update-management/enable-from-template)
- [`azure-quickstart-templates/demos/azmgmt-demo/nestedtemplates/managedVms.json` in Azure/azure-quickstart-templates](https://github.com/Azure/azure-quickstart-templates/blob/master/demos/azmgmt-demo/nestedtemplates/managedVms.json)