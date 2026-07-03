#! /usr/bin/bash

export LHAPDF=$PREFIX

# config.mk hardcodes -m64 (x86-only flag); aarch64 gcc rejects it
if [ "$(uname -m)" != "x86_64" ]; then
    sed -i 's/ -m64//g' config.mk
fi

make -f Makefile-sample
mv djangoh $PREFIX/bin
