#!/bin/bash -eux
export DEBIAN_FRONTEND="noninteractive"
apt-get update && apt-get upgrade -y

apt-get update && apt-get install -y \
  curl \
  git \
  python-pip \
  ruby2.0 \
  wget \
  #

curl https://get.docker.com | sh -eux

docker version

curl https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz \
  | tar -C /usr/local -xzf -

/usr/local/go/bin/go version

pip install awscli
aws --version

cat <<'EOP' > /tmp/install.patch
--- install.orig        2015-08-23 10:24:44.223496983 +0000
+++ install     2015-08-23 10:26:12.535468884 +0000
@@ -237,10 +237,10 @@
     elsif(has_apt_get)
       @type = 'deb'

-      @log.warn('apt-get found but no gdebi. Installing gdebi with `apt-get install gdebi -y`...')
+      @log.warn('apt-get found but no gdebi. Installing gdebi with `apt-get install gdebi-core -y`...')
       #use -y to answer yes to confirmation prompts
-      if(!run_command('/usr/bin/apt-get', 'install', 'gdebi', '-y'))
-        @log.error('Could not install gdebi.')
+      if(!run_command('/usr/bin/apt-get', 'install', 'gdebi-core', '-y'))
+        @log.error('Could not install gdebi-core.')
         exit(1)
       end
     else
EOP

curl -L http://aws-codedeploy-ap-northeast-1.s3.amazonaws.com/latest/install \
  | sed -e 's/gdebi/gdebi-core/g' > /tmp/install

pushd /tmp
  patch -p0 < install.patch
popd

chmod +x /tmp/install
/tmp/install auto
