#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
setenv CI_PATH_PREFIX /home/$USER/kt
setenv CI_INSTALL_DIR $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.6-serial
setenv CI_BUILD_DIR $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.6-serial-build
rm -rf $CI_INSTALL_DIR
rm -rf $CI_BUILD_DIR
mkdir -p $CI_INSTALL_DIR
mkdir -p $CI_BUILD_DIR
module load cmake/3.17.3
module load gcc/7.4.0
module load ibm/xlc-16.1.1.6-xlf-16.1.1.6
cd $CI_BUILD_DIR
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_CXX_COMPILER_ARG1=-F/projects/opt/ppc64le/ibm/xlc-16.1.1.6/xlC/16.1.1/etc/xlc.cfg.rhel.7.7.gcc.7.4.0.cuda.10.1 \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=ON
make -j check
make install
module purge
rm -rf $CI_BUILD_DIR
