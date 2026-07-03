#! /usr/bin/bash

export LHAPDF=$PREFIX

# config.mk hardcodes x86-only bits: -m64 (rejected by aarch64 gcc)
# and -lquadmath (libquadmath does not exist on aarch64)
if [ "$(uname -m)" != "x86_64" ]; then
    sed -i 's/ -m64//g; s/ -lquadmath//g' config.mk
fi

make -f Makefile-sample
mv djangoh $PREFIX/bin
