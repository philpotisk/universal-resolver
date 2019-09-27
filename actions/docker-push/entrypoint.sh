#!/bin/sh -l

echo "DOCKER BUILD AND PUSH"

ls -al

echo "no env"
echo ${CONTAINER_TAG};


if [ -n "${BUILD_PATH}" ]
then
   cd ${BUILD_PATH}
fi

ls -al

docker build . -f ${DOCKER_FILE} . -t ${CONTAINER_TAG}

docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}

docker push ${CONTAINER_TAG}
