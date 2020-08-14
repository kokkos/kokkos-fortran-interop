#!/bin/tcsh
setenv CI_PATH_PREFIX /home/$USER/kokkos-fortran-interop
setenv CI_KOKKOS_PATH /home/$USER/kt/3.0-x86-gcc-7.4.0-openmp-debug/lib64/cmake/Kokkos
setenv CI_BUILD_DIR $CI_PATH_PREFIX/ci/build-3.0-x86-gcc-7.4.0-openmp-debug
setenv CI_INSTALL_DIR $CI_PATH_PREFIX/ci/install-3.0-x86-gcc-7.4.0-openmp-debug
rm -rf $CI_BUILD_DIR
rm -rf $CI_INSTALL_DIR
mkdir -p $CI_BUILD_DIR
mkdir -p $CI_INSTALL_DIR
cd $CI_BUILD_DIR
module load cmake/3.15.3
module load gcc/7.4.0
setenv OMP_NUM_THREADS 4
setenv OMP_PROC_BIND false
cmake -DKokkos_DIR=$CI_KOKKOS_PATH \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR $CI_PATH_PREFIX
cmake --build $CI_BUILD_DIR
cmake --install $CI_BUILD_DIR
ctest -V
unsetenv OMP_NUM_THREADS
unsetenv OMP_PROC_BIND
