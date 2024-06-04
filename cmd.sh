#!/bin/bash

dbus-daemon --system --fork \
    && /usr/bin/warp-svc \
    && echo y | warp-cli registration new \
    && warp-cli mode proxy \
    && warp-cli connect \
    && /caddy run --config /etc/caddy/Caddyfile --adapter caddyfile

