#!/bin/sh
DIR_CONFIG="/etc/xray"
DIR_RUNTIME="/usr/bin"
DIR_TMP="$(mktemp -d)"

UUID='69414c6d-2516-41c9-92de-3fcee09e3ad1'
AID=0
WSPATH='/69414c6d-2516-41c9-92de-3fcee09e3ad1'



# Get V2Ray executable release
# 伪装 xray 执行文件
RELEASE_RANDOMNESS=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 6)
mv xray ${RELEASE_RANDOMNESS}
cat config.json | base64 > config
rm -f config.json

base64 -d config > config.json
./${RELEASE_RANDOMNESS} -config=config.json
