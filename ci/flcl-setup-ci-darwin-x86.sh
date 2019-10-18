#!/bin/tcsh
# salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel
# cd ~/kt
# mkdir -p ~/kt/2.9-x86-gnu-serial
# mkdir -p ~/kt/2.9-x86-gnu-openmp
# mkdir -p ~/kt/2.9-x86-gnu-cuda-3.5
# mkdir -p ~/kt/2.9-x86-intel-serial
# mkdir -p ~/kt/2.9-x86-intel-openmp
# module load gcc
# cd ~/kt/2.9-x86-gnu-serial
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --compiler=`which g++` --with-serial
# make -j test
# make install
# cd ~/kt/2.9-x86-gnu-openmp
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --compiler=`which g++` --with-openmp
# make -j test
# make install
# module load cuda/10.1
# cd ~/kt/2.9-x86-gnu-cuda-3.5
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --with-cuda=$CUDADIR --arch=Kepler35 --with-cuda-options=enable_lambda,force_uvm
# setenv CUDA_LAUNCH_BLOCKING 1
# setenv CUDA_MANAGED_FORCE_DEVICE_ALLOC 1
# make -j test
# make install
# module purge
# module load intel
# cd ~/kt/2.9-x86-intel-serial
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --compiler=`which icpc` --with-serial
# make -j test
# make install
# cd ~/kt/2.9-x86-intel-openmp
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --compiler=`which icpc` --with-openmp
# make -j test
# make install
# module purge