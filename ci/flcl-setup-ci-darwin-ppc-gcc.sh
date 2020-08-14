#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
echo 'Setting up ppc gcc kokkos 3.0 serial'
./flcl-setup-ci-darwin-ppc-gcc-serial-3.0.sh
echo 'Setting up ppc gcc kokkos 3.0 serial debug'
./flcl-setup-ci-darwin-ppc-gcc-serial-debug-3.0.sh
echo 'Setting up ppc gcc kokkos 3.0 openmp'
./flcl-setup-ci-darwin-ppc-gcc-openmp-3.0.sh
echo 'Setting up ppc gcc kokkos 3.0 openmp debug'
./flcl-setup-ci-darwin-ppc-gcc-openmp-debug-3.0.sh
echo 'Setting up ppc gcc kokkos 3.0 cuda'
./flcl-setup-ci-darwin-ppc-gcc-cuda-3.0.sh
echo 'Setting up ppc gcc kokkos 3.0 cuda debug'
./flcl-setup-ci-darwin-ppc-gcc-cuda-debug-3.0.sh
echo 'Setting up ppc gcc kokkos 3.1.1 serial'
./flcl-setup-ci-darwin-ppc-gcc-serial-3.1.1.sh
echo 'Setting up ppc gcc kokkos 3.1.1 serial debug'
./flcl-setup-ci-darwin-ppc-gcc-serial-debug-3.1.1.sh
echo 'Setting up ppc gcc kokkos 3.1.1 openmp'
./flcl-setup-ci-darwin-ppc-gcc-openmp-3.1.1.sh
echo 'Setting up ppc gcc kokkos 3.1.1 openmp debug'
./flcl-setup-ci-darwin-ppc-gcc-openmp-debug-3.1.1.sh
echo 'Setting up ppc gcc kokkos 3.1.1 cuda'
./flcl-setup-ci-darwin-ppc-gcc-cuda-3.1.1.sh
echo 'Setting up ppc gcc kokkos 3.1.1 cuda debug'
./flcl-setup-ci-darwin-ppc-gcc-cuda-debug-3.1.1.sh