#!/bin/bash
USER=$(whoami)
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then \
    curl -L -O https://s3.amazonaws.com/mountpoint-s3-release/latest/x86_64/mount-s3.rpm
    PKG_MNGR="dnf"
    sudo $PKG_MNGR update -y
    sudo $PKG_MNGR install dnf-plugins-core -y
elif [ "$ARCH" = "aarch64" ]; then \
    curl -L -O https://s3.amazonaws.com/mountpoint-s3-release/latest/arm64/mount-s3.rpm
    PKG_MNGR="yum"
else \
    echo "Unsupported architecture: $ARCH"; \
    exit 1; \
fi
curl -L -O https://github.com/LynkerIntel/hfsubset/releases/download/hfsubset-release-12/hfsubset-linux_amd64.tar.gz
sudo $PKG_MNGR update -y
sudo $PKG_MNGR install ./mount-s3.rpm git pip pigz awscli python -y
tar -xzvf hfsubset-linux_amd64.tar.gz
rm hfsubset-linux_amd64.tar.gz mount-s3.rpm
sudo mv hfsubset /usr/bin/hfsubset
git clone https://github.com/CIROH-UA/ngen-datastream.git
