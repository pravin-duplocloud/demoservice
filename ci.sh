#!/bin/bash -ex

if [[ "x$PHASE" != "x" ]]; then
  if [[ "$PHASE" == "PRE_DEPLOY_BUILD" ]]; then
    if [[ "x$S3_BUCKET_LAMBDA" != "x" ]]; then
      echo "ci.sh: Demo Test Build Docker image and push to docker hub!"
      export S3_BUCKET_LAMBDA="${S3_BUCKET_LAMBDA}"
      ./build.sh
      echo "ci.sh DONE: Demo Test Build Docker image and push to docker hub!"
      exit 0
    else
      echo "ci.sh DONE: S3_BUCKET_LAMBDA parameter is not provided"
      exit 1
    fi
  elif [[ "$PHASE" == "POST_DEPLOY_VERIFICATION" ]]; then
    echo "ci.sh DONE: No  action needed, Run under tests section in cci"
    exit 0
  else
    echo "ci.sh DONE: **** Error PHASE value is unexpected"
    exit 1
  fi
else
  echo "ci.sh DONE: ****** Error Phase is not set"
  exit 0
fi
