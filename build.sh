#!/bin/bash

IMAGE=
FILE=
TAG=

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --image|-i)
            IMAGE=$2 && shift 2
            ;;
        --cloudflare|-cf)
            FILE=Dockerfile-cloudflare && shift 1
            ;;
        --tag|-t)
            TAG=$2 && shift 2
            ;;
        *)
            echo "未知参数: $1"
            exit 1
            ;;
    esac
done

IMAGE=${IMAGE:-"caddy-naive"}
FILE=${FILE:-"Dockerfile"}
TAG=${TAG:-"latest"}

echo " - IMAGE: $IMAGE"
echo " - FILE: $FILE"
echo " - TAG: $TAG"

CMD="docker build -f $FILE -t $IMAGE:$TAG . "
echo " * Run : $CMD"
eval $CMD