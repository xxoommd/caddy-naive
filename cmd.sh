#!/bin/bash

mkdir -p /run/dbus

dbus-daemon --system --fork \

/usr/bin/warp-svc &

sleep 3

warp-cli --accept-tos registration new

warp-cli --accept-tos mode proxy

warp-cli --accept-tos connect

/caddy run --config /etc/caddy/Caddyfile --adapter caddyfile

