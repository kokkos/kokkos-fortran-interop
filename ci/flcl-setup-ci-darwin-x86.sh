#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
## set-up
setenv CI_PATH_PREFIX /home/$USER/kt
mkdir -p $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-serial
mkdir -p $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-serial-build
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-serial/*
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-serial-build/*
mkdir -p $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-openmp
mkdir -p $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-openmp-build
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-openmp/*
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-openmp-build/*
mkdir -p $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-cuda-10.1
mkdir -p $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-cuda-10.1-build
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-cuda-10.1/*
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-cuda-10.1-build/*
mkdir -p $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-serial
mkdir -p $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-serial-build
rm -rf $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-serial/*
rm -rf $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-serial-build/*
mkdir -p $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-openmp
mkdir -p $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-openmp-build
rm -rf $CI_PATH_PREFIX/3.0-x86-xl-intel-19.0.5-openmp/*
rm -rf $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-openmp-build/*
## common to gnu tests
module load cmake/3.15.3
module load gcc/7.3.0
## gnu 7.3.0 + serial
cd $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-serial-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-serial \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=ON 
make -j check
make install
## gnu 7.3.0 + openmp
cd $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-openmp-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-openmp \
    -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_TESTS=ON
setenv OMP_PROC_BIND spread
setenv OMP_PLACES threads
make -j check
make install
## gnu 7.3.0 + cuda
module load cuda/10.1
cd $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-cuda-10.1-build
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_CXX_COMPILER=/home/$USER/kokkos/kokkos-3.0.00/bin/nvcc_wrapper \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-cuda-10.1 \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_CUDA=ON -DKokkos_ENABLE_CUDA_LAMBDA=ON \
    -DKokkos_ENABLE_TESTS=ON
setenv CUDA_LAUNCH_BLOCKING 1
setenv CUDA_MANAGED_FORCE_DEVICE_ALLOC 1
make -j check
make install
## end gnu section
module purge
## common to intel tests
module load cmake/3.15.3
module load intel/19.0.5
## intel 19.0.5 + serial
cd $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-serial
cmake /home/$USER/kokkos/kokkos-3.0.00 \
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-x86-intel-19.0.5-serial \
    -DKokkos_ENABLE_SERIAL=ON \
    -DKokkos_ENABLE_TESTS=ON
make -j check
make install
## intel 19.0.5 + openmp
cd $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-openmp-build
cmake /home/$USER/kokkos/kokkos-3.0.00\
    -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=$CI_PATH_PREFIX/3.0-x86-intel-19.0.5-openmp \
    -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=ON \
    -DKokkos_ENABLE_TESTS=ON
make -j check
make install
# end intel section
module purge
## clean-up
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-serial-build
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-openmp-build
rm -rf $CI_PATH_PREFIX/3.0-x86-gnu-7.3.0-cuda-10.1-build
rm -rf $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-serial-build
rm -rf $CI_PATH_PREFIX/3.0-x86-intel-19.0.5-openmp-build