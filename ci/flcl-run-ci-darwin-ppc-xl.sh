#!/bin/tcsh
module purge
module load cmake/3.15.3
module load gcc/7.3.0
setenv CI_PATH_PREFIX /home/$USER/kokkos-fortran-interop
setenv CI_KOKKOS_PATH_PREFIX /home/$USER/kt
setenv CI_BUILD_DIR $CI_PATH_PREFIX/ci/build-xl
setenv CI_INSTALL_DIR $CI_PATH_PREFIX/ci/install-xl
echo 'CI_PATH_PREFIX '$CI_PATH_PREFIX
echo 'CI_KOKKOS_PATH_PREFIX '$CI_KOKKOS_PATH_PREFIX
echo 'CI_BUILD_DIR '$CI_BUILD_DIR
echo 'CI_INSTALL_DIR '$CI_INSTALL_DIR
mkdir -p $CI_BUILD_DIR
mkdir -p $CI_INSTALL_DIR
cd $CI_BUILD_DIR
# start xl section
module load cmake/3.15.3
module load ibm/xlc-16.1.1.2-xlf-16.1.1.2-gcc-7.3.0
# build flcl xl 16.1.1.2 + serial
rm -rf $CI_BUILD_DIR/* $CI_INSTALL_DIR/.* $CI_INSTALL_DIR/*
cmake -DKokkos_DIR=$CI_KOKKOS_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial/lib64/cmake/Kokkos \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR $CI_PATH_PREFIX
cmake --build $CI_BUILD_DIR
cmake --install $CI_BUILD_DIR
# make test-flcl.x
# time $HOME/kokkos-fortran-interop/build/test-flcl.x
## build flcl xl 16.1.1.2 + openmp
setenv OMP_NUM_THREADS 4
rm -rf $CI_BUILD_DIR/* $CI_INSTALL_DIR/.* $CI_INSTALL_DIR/*
cmake -DKokkos_DIR=$CI_KOKKOS_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp/lib64/cmake/Kokkos \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR $CI_PATH_PREFIX
cmake --build $CI_BUILD_DIR
cmake --install $CI_BUILD_DIR
# make test-flcl.x
# time $HOME/kokkos-fortran-interop/build/test-flcl.x
unsetenv OMP_NUM_THREADS
## end xl section