#!/bin/bash

mkdir -p /run/dbus \
    && dbus-daemon --system --fork \
    && /usr/bin/warp-svc \
    & warp-cli registration new  --accept-tos\
    && warp-cli mode proxy \
    && warp-cli connect \
    && /caddy run --config /etc/caddy/Caddyfile --adapter caddyfile

