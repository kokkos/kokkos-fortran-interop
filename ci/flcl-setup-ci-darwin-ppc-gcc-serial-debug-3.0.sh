#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
setenv CI_PATH_PREFIX /home/$USER/kt
setenv CI_INSTALL_DIR $CI_PATH_PREFIX/3.0-ppc-gcc-7.4.0-serial-debug
setenv CI_BUILD_DIR $CI_PATH_PREFIX/3.0-ppc-gcc-7.4.0-serial-debug-build
rm -rf $CI_INSTALL_DIR
rm -rf $CI_BUILD_DIR
mkdir -p $CI_INSTALL_DIR
mkdir -p $CI_BUILD_DIR
module load cmake/3.15.3
module load gcc/7.4.0
cd $CI_BUILD_DIR
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=ON
make -j check
make install
module purge
rm -rf $CI_BUILD_DIR