#!/bin/bash -eux
export DEBIAN_FRONTEND="noninteractive"
apt-get update && apt-get upgrade -y

apt-get install -y \
  curl \
  git \
  python-pip \
  ruby2.0 \
  wget \
  && :

curl https://get.docker.com | sh -eux

docker version

curl https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz \
  | tar -C /usr/local -xzf -

/usr/local/go/bin/go version

pip install awscli
aws --version

curl -L http://aws-codedeploy-ap-northeast-1.s3.amazonaws.com/latest/install \
  | sed -e 's/gdebi/gdebi-core/g' > /tmp/install
chmod +x /tmp/install
/tmp/install auto
