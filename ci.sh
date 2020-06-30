#!/bin/bash -ex

if [[ "x$PHASE" != "x" ]]; then
  if [[ "$PHASE" == "PRE_DEPLOY_BUILD" ]]; then
    ./build.sh
    echo "ci.sh DONE: Demo Test Build Docker image and push to docker hub!"
    exit 0
  elif [[ "$PHASE" == "POST_DEPLOY_VERIFICATION" ]]; then
    echo "ci.sh DONE: No  action needed, Run under tests section in cci"
    exit 0
  elif [[ "$PHASE" == "DEPLOY" ]]; then
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
