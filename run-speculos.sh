#!/bin/bash
DEVICE="nanosp"
APP="bin/app.elf"
API_PORT=5000
APDU_PORT=40000

docker run --rm -it \
  -v "$(pwd)/bin:/speculos/apps" \
  -p ${API_PORT}:${API_PORT} \
  -p ${APDU_PORT}:${APDU_PORT} \
  ghcr.io/ledgerhq/speculos:latest \
  --model ${DEVICE} \
  --api-port ${API_PORT} \
  --apdu-port ${APDU_PORT} \
  --display headless \
  /speculos/apps/$(basename "$APP")
