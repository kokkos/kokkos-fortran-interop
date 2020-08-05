#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
echo 'Setting up x86 intel 19 kokkos 3.0 serial'
./flcl-setup-ci-darwin-x86-intel-19-serial-3.0.sh
echo 'Setting up x86 intel 20 kokkos 3.0 serial'
./flcl-setup-ci-darwin-x86-intel-20-serial-3.0.sh
echo 'Setting up x86 intel 19 kokkos 3.1.1 serial'
./flcl-setup-ci-darwin-x86-intel-19-serial-3.1.1.sh
echo 'Setting up x86 intel 20 kokkos 3.1.1 serial'
./flcl-setup-ci-darwin-x86-intel-20-serial-3.1.1.sh
echo 'Setting up x86 intel 19 kokkos 3.0 serial debug'
./flcl-setup-ci-darwin-x86-intel-19-serial-debug-3.0.sh
echo 'Setting up x86 intel 20 kokkos 3.0 serial debug'
./flcl-setup-ci-darwin-x86-intel-20-serial-debug-3.0.sh
echo 'Setting up x86 intel 19 kokkos 3.1.1 serial debug'
./flcl-setup-ci-darwin-x86-intel-19-serial-debug-3.1.1.sh
echo 'Setting up x86 intel 20 kokkos 3.1.1 serial debug'
./flcl-setup-ci-darwin-x86-intel-20-serial-debug-3.1.1.sh
echo 'Setting up x86 intel 19 kokkos 3.0 openmp'
./flcl-setup-ci-darwin-x86-intel-19-openmp-3.0.sh
echo 'Setting up x86 intel 20 kokkos 3.0 openmp'
./flcl-setup-ci-darwin-x86-intel-20-openmp-3.0.sh
echo 'Setting up x86 intel 19 kokkos 3.1.1 openmp'
./flcl-setup-ci-darwin-x86-intel-19-openmp-3.1.1.sh
echo 'Setting up x86 intel 20 kokkos 3.1.1 openmp'
./flcl-setup-ci-darwin-x86-intel-20-openmp-3.1.1.sh
echo 'Setting up x86 intel 19 kokkos 3.0 openmp debug'
./flcl-setup-ci-darwin-x86-intel-19-openmp-debug-3.0.sh
echo 'Setting up x86 intel 20 kokkos 3.0 openmp debug'
./flcl-setup-ci-darwin-x86-intel-20-openmp-debug-3.0.sh
echo 'Setting up x86 intel 19 kokkos 3.1.1 openmp debug'
./flcl-setup-ci-darwin-x86-intel-19-openmp-debug-3.1.1.sh
echo 'Setting up x86 intel 20 kokkos 3.1.1 openmp debug'
./flcl-setup-ci-darwin-x86-intel-20-openmp-debug-3.1.1.sh