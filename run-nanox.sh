#!/bin/bash
set -e

DEVICE="nanox"  # Change to nanox, stax, etc. if needed
API_PORT=5000
APDU_PORT=40000
APP="./build/nanox/bin/app.elf"

docker run --rm -it \
  -v "$(pwd)/build/nanox/bin:/speculos/apps" \
  -p ${API_PORT}:${API_PORT} \
  -p ${APDU_PORT}:${APDU_PORT} \
  ghcr.io/ledgerhq/speculos:latest \
  --model ${DEVICE} \
  --api-port ${API_PORT} \
  --apdu-port ${APDU_PORT} \
  --display headless \
  /speculos/apps/$(basename "$APP")
