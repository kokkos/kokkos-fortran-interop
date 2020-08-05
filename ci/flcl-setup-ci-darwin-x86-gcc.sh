#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
echo 'Setting up x86 gcc kokkos 3.0 serial'
./flcl-setup-ci-darwin-x86-gcc-serial-3.0.sh
echo 'Setting up x86 gcc kokkos 3.0 serial debug'
./flcl-setup-ci-darwin-x86-gcc-serial-debug-3.0.sh
echo 'Setting up x86 gcc kokkos 3.0 openmp'
./flcl-setup-ci-darwin-x86-gcc-openmp-3.0.sh
echo 'Setting up x86 gcc kokkos 3.0 openmp debug'
./flcl-setup-ci-darwin-x86-gcc-openmp-debug-3.0.sh
echo 'Setting up x86 gcc kokkos 3.0 cuda'
./flcl-setup-ci-darwin-x86-gcc-cuda-3.0.sh
echo 'Setting up x86 gcc kokkos 3.0 cuda debug'
./flcl-setup-ci-darwin-x86-gcc-cuda-debug-3.0.sh
echo 'Setting up x86 gcc kokkos 3.1.1 serial'
./flcl-setup-ci-darwin-x86-gcc-serial-3.1.1.sh
echo 'Setting up x86 gcc kokkos 3.1.1 serial debug'
./flcl-setup-ci-darwin-x86-gcc-serial-debug-3.1.1.sh
echo 'Setting up x86 gcc kokkos 3.1.1 openmp'
./flcl-setup-ci-darwin-x86-gcc-openmp-3.1.1.sh
echo 'Setting up x86 gcc kokkos 3.1.1 openmp debug'
./flcl-setup-ci-darwin-x86-gcc-openmp-debug-3.1.1.sh
echo 'Setting up x86 gcc kokkos 3.1.1 cuda'
./flcl-setup-ci-darwin-x86-gcc-cuda-3.1.1.sh
echo 'Setting up x86 gcc kokkos 3.1.1 cuda debug'
./flcl-setup-ci-darwin-x86-gcc-cuda-debug-3.1.1.sh