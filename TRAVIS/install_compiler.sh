#!/bin/sh
# This configuration file was taken originally from the mpi4py project
# <http://mpi4py.scipy.org/>, and then modified for Fortran

set -e
set -x

os=`uname`
TRAVIS_ROOT="$1"
COMPILER="$2"
GCCVERSION="$3"

case "$os" in
    Darwin)
        echo "Mac not supported yet"
        stop
        ;;
    Linux)
        echo "Linux"
        case "$COMPILER" in
          gcc)
            sudo -E apt-add-repository -y "ppa:ubuntu-toolchain-r/test"
            sudo -E apt-get -yq update 
            sudo -E apt-get -yq --no-install-suggests --no-install-recommends --force-yes install gfortran-$GFORTRAN_VERSION g++-$GFORTRAN_VERSION
            ;;
          icc)
            ./TRAVIS/install-icc.sh --components ifort,mpi,icc,mkl
            ;;
        esac
        ;;
esac
