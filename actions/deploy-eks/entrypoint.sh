#!/bin/sh

echo "EKS Deloyment of ${DRIVER_NAME}"

set -e

echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

IS_DEPLOYED=$(kubectl get deployments |grep ${DRIVER_NAME})

cd ${DRIVER_PATH}

if [ -z "${IS_DEPLOYED}" ]
then
   echo "Create cluster..."
   sh -c "kubectl create -f deployment-${DRIVER_NAME}.yml"
else
   echo "Update cluster ..."
   sh -c "kubectl rollout restart -f deployment-${DRIVER_NAME}.yml"
fi
