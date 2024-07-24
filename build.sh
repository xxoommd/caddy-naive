#!/bin/bash

DATE_TAG=`date +"%Y%m%d"`

docker build -f Dockerfile-naive -t xxoommd/caddy-naive:${DATE_TAG} . && docker tag xxoommd/caddy-naive:${DATE_TAG} xxoommd/caddy-naive:latest && \

docker build -f Dockerfile-cloudflare -t xxoommd/cloudflare-warp-cli:${DATE_TAG} . && docker tag xxoommd/cloudflare-warp-cli:${DATE_TAG} xxoommd/cloudflare-warp-cli:latest && \

docker push xxoommd/caddy-naive:${DATE_TAG} && \
docker push xxoommd/caddy-naive:latest && \
docker push xxoommd/cloudflare-warp-cli:${DATE_TAG} && \
docker push xxoommd/cloudflare-warp-cli:latest