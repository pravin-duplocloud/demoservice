#!/bin/bash -e
docker info
docker build -t lambda_api_gateway_demo  .

# docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
# docker tag -f djangoservice duplocloud/anyservice:$CIRCLE_SHA1
# docker push duplocloud/anyservice:$CIRCLE_SHA1

echo "Docker lambda_api_gateway_demo Build Finished.."
