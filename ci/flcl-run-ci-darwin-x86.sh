#!/bin/tcsh
module purge
module load gcc
setenv KOKKOS_ROOT $HOME/kt/2.9-x86-gnu-serial
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load gcc
setenv KOKKOS_ROOT $HOME/kt/2.9-x86-gnu-openmp
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load gcc
module load cuda/10.1
setenv KOKKOS_ROOT $HOME/kt/2.9-x86-gnu-cuda-3.5
setenv CUDA_LAUNCH_BLOCKING 1
setenv CUDA_MANAGED_FORCE_DEVICE_ALLOC 1
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load intel
setenv KOKKOS_ROOT $HOME/kt/2.9-x86-intel-serial
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load intel
setenv KOKKOS_ROOT $HOME/kt/2.9-x86-intel-openmp
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
make clean