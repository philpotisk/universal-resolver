#!/bin/sh

echo "EKS Deloyment of ${DRIVER_NAME}"

set -e

echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

#IS_DEPLOYED=$(kubectl get deployments |grep ${DRIVER_NAME})

echo ${DRIVER_PATH}
cd ./drivers/btcr

ls -al

echo "Creating cluster (deployment-${DRIVER_NAME}.yml) ..."
kubectl create -f deployment-${DRIVER_NAME}.yml
kubectl create -f nodeport-${DRIVER_NAME}.yml


#if [ -z "${IS_DEPLOYED}" ]
#then
#   echo "Creating cluster (deployment-${DRIVER_NAME}.yml) ..."
#sh -c "kubectl create -f deployment-${DRIVER_NAME}.yml"
#sh -c "kubectl create -f nodeport-${DRIVER_NAME}.yml"
#else
#   echo "Updating cluster ..."
#   sh -c "kubectl rollout restart -f deployment-${DRIVER_NAME}.yml"
#fi
