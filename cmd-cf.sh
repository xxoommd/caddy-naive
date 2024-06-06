#!/bin/sh

dbus-daemon --system --fork

sleep 3

nohup warp-svc & 

sleep 5

warp-cli --accept-tos registration new \
    && warp-cli --accept-tos mode proxy \
    && warp-cli --accept-tos connect