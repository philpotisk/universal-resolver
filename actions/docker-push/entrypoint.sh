#!/bin/sh -l

echo "DOCKER BUILD AND PUSH"

echo "path ${pwd}"

ls -al

if [ -n "${BUILD_PATH}" ]
then
   cd ${BUILD_PATH}
fi

docker build . -t ${CONTAINER_TAG}

docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}

docker push ${CONTAINER_TAG}
