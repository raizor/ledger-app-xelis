#!/bin/bash
set -e

DEVICE="nanosp"  # Change to nanox, stax, etc. if needed
API_PORT=5000
APDU_PORT=40000
APP="./build/nonos2/bin/app.elf"

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
