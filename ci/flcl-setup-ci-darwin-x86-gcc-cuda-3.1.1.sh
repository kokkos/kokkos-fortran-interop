#!/bin/tcsh
# salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
setenv CI_PATH_PREFIX /home/$USER/kt
setenv CI_INSTALL_DIR $CI_PATH_PREFIX/3.1.1-x86-gcc-7.4.0-cuda-10.1
setenv CI_BUILD_DIR $CI_PATH_PREFIX/3.1.1-x86-gcc-7.4.0-cuda-10.1-build
rm -rf $CI_INSTALL_DIR
rm -rf $CI_BUILD_DIR
mkdir -p $CI_INSTALL_DIR
mkdir -p $CI_BUILD_DIR
module load cmake/3.15.3
module load gcc/7.4.0
module load cuda/10.1
cd $CI_BUILD_DIR
cmake /home/$USER/kokkos/kokkos-3.1.01 \
    -DCMAKE_CXX_COMPILER=/home/$USER/kokkos/kokkos-3.0.00/bin/nvcc_wrapper \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR \
    -DKokkos_ENABLE_SERIAL=ON -DKokkos_ARCH_VOLTA70=ON \
    -DKokkos_ENABLE_CUDA=ON -DKokkos_ENABLE_CUDA_LAMBDA=ON \
    -DKokkos_ENABLE_TESTS=ON
setenv CUDA_LAUNCH_BLOCKING 1
setenv CUDA_MANAGED_FORCE_DEVICE_ALLOC 1
make -j check
make install
module purge
rm -rf $CI_BUILD_DIR