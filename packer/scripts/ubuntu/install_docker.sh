#!/bin/bash -eux
export DEBIAN_FRONTEND="noninteractive"
apt-get update && apt-get upgrade -y

apt-get install -y \
  curl \
  git \
  wget \
  && :

curl https://get.docker.com | sh -eux

docker version

curl https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz \
  | tar -C /usr/local -xzf -

/usr/local/go/bin/go version
