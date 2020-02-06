#!/bin/tcsh
# salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel
mkdir -p ~/kt/3.0rc-x86-gnu-7.3.0-serial
mkdir -p ~/kt/3.0rc-x86-gnu-7.3.0-openmp
mkdir -p ~/kt/3.0rc-x86-gnu-7.3.0-cuda-10.1
mkdir -p ~/kt/3.0rc-x86-intel-19.0.5-serial
mkdir -p ~/kt/3.0rc-x86-intel-19.0.5-openmp
module load cmake
module load gcc/7.3.0
cd ~/kt/3.0rc-x86-gnu-7.3.0-serial
cmake ~/kokkos/kokkos-3.0.00-rc -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON -DCMAKE_INSTALL_PREFIX=`pwd` -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_TESTS=ON
make -j check
make install
cd ~/kt/3.0rc-x86-gnu-7.3.0-openmp
cmake ~/kokkos/kokkos-3.0.00-rc -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON -DCMAKE_INSTALL_PREFIX=`pwd` -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=ON -DKokkos_ENABLE_TESTS=ON
setenv OMP_PROC_BIND spread
setenv OMP_PLACES threads
make -j check
make install
module load cuda/10.1
cd ~/kt/3.0rc-x86-gnu-7.3.0-cuda-10.1
cmake ~/kokkos/kokkos-3.0.00-rc -DCMAKE_CXX_COMPILER=/home/womeld/kokkos/kokkos-3.0.00-rc/bin/nvcc_wrapper -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON -DCMAKE_INSTALL_PREFIX=`pwd` -DKokkos_ENABLE_SERIAL=ON -DKokkos_ARCH_VOLTA70=ON -DKokkos_ENABLE_CUDA=ON -DKokkos_ENABLE_CUDA_LAMBDA=ON -DKokkos_ENABLE_TESTS=ON
setenv CUDA_LAUNCH_BLOCKING 1
setenv CUDA_MANAGED_FORCE_DEVICE_ALLOC 1
make -j check
make install
module purge
module load intel/19.0.5
cd ~/kt/3.0rc-x86-intel-19.0.5-serial
cmake ~/kokkos/kokkos-3.0.00-rc -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON -DCMAKE_INSTALL_PREFIX=`pwd` -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_TESTS=ON
make -j check
make install
cd ~/kt/3.0rc-x86-intel-19.0.5-openmp
cmake ~/kokkos/kokkos-3.0.00-rc -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON -DCMAKE_INSTALL_PREFIX=`pwd` -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=ON -DKokkos_ENABLE_TESTS=ON
make -j check
make install
module purge