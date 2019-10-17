#!/bin/tcsh
module purge
module load gcc
setenv KOKKOS_ROOT $HOME/kt/2.9-ppc-gnu-serial
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load gcc
setenv KOKKOS_ROOT $HOME/kt/2.9-ppc-gnu-openmp
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load gcc
module load cuda/10.1
setenv KOKKOS_ROOT $HOME/kt/2.9-ppc-gnu-cuda-7.0
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
make clean
