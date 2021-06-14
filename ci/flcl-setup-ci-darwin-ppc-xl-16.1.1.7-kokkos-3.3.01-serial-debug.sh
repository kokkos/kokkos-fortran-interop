#!/bin/tcsh
setenv CI_SEP -
setenv CI_BUILD_TYPE debug
setenv CI_BUILD_SUFFIX build
setenv CI_MACHINE_ARCH ppc
setenv CI_COMPILER_FAMILY xl
setenv CI_COMPILER_VER 16.1.1.7
setenv CI_COMPILER_NAME $CI_COMPILER_FAMILY$CI_SEP$CI_COMPILER_VER$CI_SEP
setenv CI_CUDA_PREFIX cuda
setenv CI_CUDA_VER 
setenv CI_CUDA_NAME 
setenv CI_KOKKOS_PREFIX kokkos
setenv CI_KOKKOS_VER 3.3.01
setenv CI_KOKKOS_BACKEND serial
setenv CI_KOKKOS_NAME $CI_KOKKOS_PREFIX$CI_SEP$CI_KOKKOS_VER$CI_SEP$CI_KOKKOS_BACKEND$CI_SEP$CI_BUILD_TYPE
setenv CI_PATH_PREFIX /home/$USER/kt
setenv CI_INSTALL_DIR $CI_PATH_PREFIX/$CI_MACHINE_ARCH$CI_SEP$CI_COMPILER_NAME$CI_CUDA_NAME$CI_KOKKOS_NAME
setenv CI_BUILD_DIR $CI_INSTALL_DIR$CI_SEP$CI_BUILD_SUFFIX
rm -rf $CI_INSTALL_DIR
rm -rf $CI_BUILD_DIR
mkdir -p $CI_INSTALL_DIR
mkdir -p $CI_BUILD_DIR
module load cmake/3.19.2
module load ibm/xlc-16.1.1.7-xlf-16.1.1.7-gcc-9.3.0-cuda-11.0
setenv CC xlc_r
setenv CXX xlc++_r
setenv F77 xlf_r
setenv FC xlf_r
setenv CXXFLAGS "-qxflag=disable__cplusplusOverride -F/projects/opt/ppc64le/ibm/xlc-16.1.1.7/xlC/16.1.1/etc/xlc.cfg.rhel.7.8.gcc.9.3.0.cuda.11.0"
cd $CI_BUILD_DIR
cmake /home/$USER/$CI_KOKKOS_PREFIX/$CI_KOKKOS_PREFIX$CI_SEP$CI_KOKKOS_VER \
    -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=ON \
    -DKokkos_CXX_STANDARD=14 \
    -DKokkos_ARCH_POWER9=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=ON
cmake --build $CI_BUILD_DIR --parallel
cmake --install $CI_BUILD_DIR
ctest
module purge
rm -rf $CI_BUILD_DIR
