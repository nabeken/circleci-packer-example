#!/bin/bash
set -e
CIRCLECI_CACHE_DIR="${HOME}/bin"
PACKER_URL="https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/packer" ]; then
  wget -O /tmp/packer.zip "${PACKER_URL}"
  unzip -d "${CIRCLECI_CACHE_DIR}" /tmp/packer.zip
fi

packer version
