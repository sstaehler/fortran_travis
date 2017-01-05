#!/bin/bash

TRAVIS_ROOT="$1"
COMPILER="$2"
GCCVERSION="$3"

case "$COMPILER" in
    icc)
      export FC=ifort
      export CC=icc
      ;;
    gcc)
      export FC=gfortran-$GCCVERSION
      export CC=gcc-$GCCVERSION
      ;;
esac

echo "$TRAVIS_ROOT/bin/fftw-wisdom"
if [ ! -f "$TRAVIS_ROOT/bin/fftw-wisdom" ]; then
    wget ftp://ftp.fftw.org/pub/fftw/fftw-3.3.4.tar.gz
    tar -xvf fftw-3.3.4.tar.gz
    cd fftw-3.3.4
    ./configure --prefix=$TRAVIS_ROOT 
    make -j4
    make install
    cd -
else
    echo "FFTW3 installed..."
    find $TRAVIS_ROOT -name fftw-wisdom
fi
