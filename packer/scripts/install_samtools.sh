#!/usr/bin/env bash

# Install samtools
echo Installing samtools $SAMTOOLSVER...

wget https://github.com/samtools/samtools/releases/download/${SAMTOOLSVER}/samtools-${SAMTOOLSVER}.tar.bz2 &&
  tar -xjf samtools-${SAMTOOLSVER}.tar.bz2 &&
  rm samtools-${SAMTOOLSVER}.tar.bz2 &&
  cd samtools-${SAMTOOLSVER} &&
  ./configure &&
  make &&
  make install &&
  mkdir /data

exit 0
