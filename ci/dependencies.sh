#!/bin/bash
set -e
CIRCLECI_CACHE_DIR="${HOME}/bin"
PACKER_VERSION="0.12.1"
PACKER_SHA1SUM="8b6c79c88d69be9205ebf43ba1111f6cec2cff04"
PACKER_URL="https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/packer" ] || [[ ! "$(packer version)" =~ "Packer v${PACKER_VERSION}" ]]; then
  wget -O /tmp/packer.zip "${PACKER_URL}"
  echo "${PACKER_SHA1SUM} /tmp/packer.zip" | sha1sum --check -
  unzip -ofd "${CIRCLECI_CACHE_DIR}" /tmp/packer.zip
fi

packer version
