#! /usr/bin/bash

export LHAPDF=$PREFIX

# config.mk hardcodes x86-only bits: -m64 (rejected by aarch64 gcc)
# and -lquadmath (libquadmath does not exist on aarch64)
if [ "$(uname -m)" != "x86_64" ]; then
    sed -i 's/ -m64//g; s/ -lquadmath//g' config.mk
fi

# config.mk also hardcodes `CXX = gfortran` (their Makefile's odd name
# for the Fortran compiler variable) bare and unprefixed -- resolves to
# nothing on macOS (conda's gfortran is target-triple-prefixed) and to
# whatever gfortran happens to be on PATH on Linux otherwise. Override
# on the command line so conda's own $FC wins everywhere.
make -f Makefile-sample CXX="${FC}"
mv djangoh $PREFIX/bin
