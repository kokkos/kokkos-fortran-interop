#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
# cd ~/kt
# mkdir -p ~/kt/2.9-ppc-gnu-serial
# mkdir -p ~/kt/2.9-ppc-gnu-openmp
# mkdir -p ~/kt/2.9-ppc-gnu-cuda-3.5
# module load gcc
# cd ~/kt/2.9-ppc-gnu-serial
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --compiler=`which g++` --with-serial
# make -j test
# make install
# cd ~/kt/2.9-ppc-gnu-openmp
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --compiler=`which g++` --with-openmp
# make -j test
# make install
# module load cuda/10.1
# cd ~/kt/2.9-ppc-gnu-cuda-7.0
# ../../kokkos/kokkos-2.9.00/generate_makefile.bash --prefix=`pwd` --with-cuda=$CUDADIR --arch=Volta70 --with-cuda-options=enable_lambda,force_uvm
# make -j test
# make install
# module purge
