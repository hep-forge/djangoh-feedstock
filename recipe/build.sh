#! /usr/bin/bash

export LHAPDF=$PREFIX
make -f Makefile-sample
mv djangoh $PREFIX/bin
