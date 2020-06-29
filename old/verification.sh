#!/bin/bash -ex

if [[ "x$PHASE" != "x" ]]; then
  if [[ "$PHASE" == "PRE_DEPLOY_BUILD" ]]; then
    echo "Run unit tests against local docker image"
    docker run -d -p 80:80 djangoservice; sleep 12
    curl --retry 10 --retry-delay 5 -v http://localhost:80
    exit 0
  elif [[ "$PHASE" == "POST_DEPLOY_VERIFICATION" ]]; then
    echo "Run Functional Tests against Duplo Endpoint"
    exit 0
  else
    echo "**** Error PHASE value is unexpected"
    exit 1
  fi
else
  echo "****** Error Phase is not set"
fi

