#!/bin/bash
module purge
module load intel
export KOKKOS_ROOT=$HOME/kt/2.9-intel-serial
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
$HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load intel
export KOKKOS_ROOT=$HOME/kt/2.9-intel-openmp
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
$HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load gcc
module load cuda
export KOKKOS_ROOT=$HOME/kt/2.9-gnu-cuda
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
$HOME/kokkos-fortran-interop/build/test-flcl.x
make clean
