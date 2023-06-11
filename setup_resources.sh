#! /usr/bin/sh

# Create workspace
echo "Create a resource group:"
az group create --name "rg" --location "eastus"

echo "Create an Azure Machine Learning workspace:"
az ml workspace create --name "mlw" -g "rg"

# Create compute instance
guid=$(cat /proc/sys/kernel/random/uuid)
suffix=${guid//[-]/}
suffix=${suffix:0:18}

ComputeName="ci${suffix}"

echo "Creating a compute instance with name: " $ComputeName
az ml compute create --name ${ComputeName} --size STANDARD_DS11_V2 --type ComputeInstance -w mlw -g rg
