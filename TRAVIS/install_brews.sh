#!/bin/sh
if [ -f "$TRAVIS_ROOT/brew_cache.tar.gz" ]; then
  echo "Found Brew Cache"
  tar zxf $TRAVIS_ROOT/brew_cache.tar.gz --directory /usr/local/Cellar
  brew link gmp libmpc isc gcc szip hdf5 openmpi fftw

else
  echo "Found Brew Cache"
  brew install openmpi 
  brew install fftw --with-fortran;
  brew tap homebrew/science;
  brew install netcdf --with-fortran;
  tar czf $TRAVIS_ROOT/brew_cache.tar.gz --directory /usr/local/Cellar gmp libmpc isc gcc szip hdf5 openmpi fftw
  ./gdrive upload $TRAVIS_ROOT/brew_cache.tar.gz 
fi
