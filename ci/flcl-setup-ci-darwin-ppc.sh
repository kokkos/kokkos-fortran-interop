#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
setenv CI_PATH_PREFIX /home/$USER/kt
mkdir -p $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-serial
mkdir -p $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-openmp
mkdir -p $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-cuda-10.1
mkdir -p $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial
mkdir -p $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp
mkdir -p $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-serial-build
mkdir -p $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-openmp-build
mkdir -p $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-cuda-10.1-build
mkdir -p $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial-build
mkdir -p $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp-build
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-serial/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-openmp/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-cuda-10.1/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-serial-build/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-openmp-build/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-cuda-10.1-build/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial-build/*
rm -rf $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp-build/*
module load cmake/3.15.3
module load gcc/7.3.0
cd $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-serial-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-serial \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=ON
make -j check
make install
cd $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-openmp-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-openmp \
    -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_TESTS=ON
setenv OMP_PROC_BIND spread
setenv OMP_PLACES threads
make -j check
make install
module load cuda/10.1
cd $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-cuda-10.1-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_CXX_COMPILER=/home/womeld/kokkos/kokkos-3.0.00/bin/nvcc_wrapper \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-cuda-10.1 \
    -DKokkos_ENABLE_SERIAL=ON -DKokkos_ARCH_VOLTA70=ON \
    -DKokkos_ENABLE_CUDA=ON -DKokkos_ENABLE_CUDA_LAMBDA=ON \
    -DKokkos_ENABLE_TESTS=ON
setenv CUDA_LAUNCH_BLOCKING 1
setenv CUDA_MANAGED_FORCE_DEVICE_ALLOC 1
make -j check
make install
module purge
module load ibm/xlc-16.1.1.2-xlf-16.1.1.2-gcc-7.3.0
module load cmake
cd $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=ON
make -j check
make install
cd $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp \
    -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_TESTS=ON
make -j check
make install
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-serial-build
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-openmp-build
rm -rf $CI_PATH_PREFIX/3.0-ppc-gnu-7.3.0-cuda-10.1-build
rm -rf $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-serial-build
rm -rf $CI_PATH_PREFIX/3.0-ppc-xl-16.1.1.2-openmp-build