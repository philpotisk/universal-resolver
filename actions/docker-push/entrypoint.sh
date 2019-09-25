#!/bin/sh -l

echo "DOCKER BUILD AND PUSH"

echo "path ${pwd}"

ls -al

echo "no env"
echo ${CONTAINER_TAG};
echo "env"
echo ${env.CONTAINER_TAG};

if [ -n "${BUILD_PATH}" ]
then
   cd ${BUILD_PATH}
fi

ls -al

docker build . -t ${env.CONTAINER_TAG}

docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}

docker push ${env.CONTAINER_TAG}
