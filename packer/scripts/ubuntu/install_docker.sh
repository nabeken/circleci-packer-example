#!/bin/bash -eux

apt-get update

apt-get install -y \
  curl \
  git \
  wget \
  && :

curl https://get.docker.com | sh -eux
