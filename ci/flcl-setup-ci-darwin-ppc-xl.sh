#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
echo 'Setting up ppc gcc kokkos 3.0 serial'
./flcl-setup-ci-darwin-ppc-xl-serial-3.0.sh
echo 'Setting up ppc gcc kokkos 3.0 serial debug'
./flcl-setup-ci-darwin-ppc-xl-serial-debug-3.0.sh
echo 'NOT Setting up ppc gcc kokkos 3.0 openmp'
#./flcl-setup-ci-darwin-ppc-xl-openmp-3.0.sh
echo 'NOT Setting up ppc gcc kokkos 3.0 openmp debug'
#./flcl-setup-ci-darwin-ppc-xl-openmp-debug-3.0.sh
echo 'Setting up ppc gcc kokkos 3.1.1 serial'
./flcl-setup-ci-darwin-ppc-xl-serial-3.1.1.sh
echo 'Setting up ppc gcc kokkos 3.1.1 serial debug'
./flcl-setup-ci-darwin-ppc-xl-serial-debug-3.1.1.sh
echo 'NOT Setting up ppc gcc kokkos 3.1.1 openmp'
#./flcl-setup-ci-darwin-ppc-xl-openmp-3.1.1.sh
echo 'NOT Setting up ppc gcc kokkos 3.1.1 openmp debug'
#./flcl-setup-ci-darwin-ppc-xl-openmp-debug-3.1.1.sh
