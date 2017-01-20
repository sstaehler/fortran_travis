#!/bin/sh
./gdrive download 0BwU9d5SH6pPQUFY0TU50RU5jRkk
brew update

#if [ -f "brew_cache.tar.gz" ]; then
#  echo "Found Brew Cache, linking"
#  tar zxf brew_cache.tar.gz --directory /usr/local/Cellar
#  brew link gmp libmpc gcc szip hdf5 openmpi fftw #isc
#
# else
  echo "Did not find Brew Cache, download and reinstall"
brew install openmpi 
brew install fftw --with-fortran;
brew tap homebrew/science;
brew install netcdf --with-fortran
echo "*****************************************************************"
brew info --installed
echo "*****************************************************************"
ls -l /usr/local/Cellar
echo "*****************************************************************"
tar czf brew_cache.tar.gz --directory /usr/local/Cellar gmp libmpc isc gcc szip hdf5 openmpi fftw netcdf
./gdrive upload brew_cache.tar.gz 
#fi
