#!/bin/tcsh
module purge
module load gcc/7.3.0
setenv KOKKOS_ROOT $HOME/kt/3.0rc-ppc-gnu-7.3.0-serial
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load gcc/7.3.0
setenv KOKKOS_ROOT $HOME/kt/3.0rc-ppc-gnu-7.3.0-openmp
setenv OMP_NUM_THREADS 4
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
unsetenv OMP_NUM_THREADS
module purge
module load gcc/7.3.0
module load cuda/10.1
setenv KOKKOS_ROOT $HOME/kt/3.0rc-ppc-gnu-7.3.0-cuda-10.1
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load ibm/xlc-16.1.1.2-xlf-16.1.1.2-gcc-7.3.0
setenv KOKKOS_ROOT $HOME/kt/3.0rc-ppc-xl-16.1.1.2-serial
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
module purge
module load ibm/xlc-16.1.1.2-xlf-16.1.1.2-gcc-7.3.0
setenv KOKKOS_ROOT $HOME/kt/3.0rc-ppc-xl-16.1.1.2-openmp
setenv OMP_NUM_THREADS 4
cd $HOME/kokkos-fortran-interop/build
make clean
make libflcl.a
make test-flcl.x
time $HOME/kokkos-fortran-interop/build/test-flcl.x
unsetenv OMP_NUM_THREADS