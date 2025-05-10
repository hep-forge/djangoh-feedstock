#! /usr/bin/bash

export LHAPDF5=$PREFIX
export CERN_ROOT=$PREFIX
export EICDIRECTORY=$PREFIX

make -j$(nproc)
make install
