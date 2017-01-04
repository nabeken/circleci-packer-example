#!/bin/bash
set -e
CIRCLECI_CACHE_DIR="${HOME}/bin"
PACKER_VERSION="0.12.1"
PACKER_CHECKSUM="456e6245ea95705191a64e0556d7a7ecb7db570745b3b4b2e1ebf92924e9ef95"
PACKER_URL="https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/packer" ] || [[ ! "$(packer version)" =~ "Packer v${PACKER_VERSION}" ]]; then
  wget -O /tmp/packer.zip "${PACKER_URL}"
  echo "${PACKER_CHECKSUM} /tmp/packer.zip" | sha256sum --check -
  unzip -oud "${CIRCLECI_CACHE_DIR}" /tmp/packer.zip
fi

packer version
