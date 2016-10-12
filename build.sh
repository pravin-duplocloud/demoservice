#!/bin/bash -e
sleep 1h
docker info
docker build -t djangoservice .
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker tag -f djangoservice duplodemo/anyservice:$CIRCLE_SHA1
docker push duplodemo/anyservice:$CIRCLE_SHA1

echo "Docker Build Finished.."

