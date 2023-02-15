#!/usr/bin/env bash


echo Installing components...

apt-get update && apt-get install --no-install-recommends -y \
  libncurses5-dev \
  libbz2-dev \
  liblzma-dev \
  libcurl4-gnutls-dev \
  zlib1g-dev \
  libssl-dev \
  gcc \
  wget \
  make \
  perl \
  bzip2 \
  gnuplot \
  ca-certificates \
  gawk &&
  apt-get autoclean && rm -rf /var/lib/apt/lists/*

exit 0