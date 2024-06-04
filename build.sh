#!/bin/sh

TAG=$1

if [[ -z $TAG ]]; then
    TAG=latest
fi

docker build -t caddy-naive:$TAG . 