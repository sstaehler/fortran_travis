
TRAVIS_ROOT="$1"
GCCVERSION="$2"
wget ftp://ftp.fftw.org/pub/fftw/fftw-3.3.4.tar.gz
tar -xvf fftw-3.3.4.tar.gz
cd fftw-3.3.4
./configure FC=gfortran-$GCCVERSION CC=gcc-$GCCVERSION --prefix=$TRAVIS_ROOT 
make -j4
make install
cd -
