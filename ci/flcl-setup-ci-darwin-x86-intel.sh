#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
./flcl-setup-ci-darwin-x86-intel-serial.sh
./flcl-setup-ci-darwin-x86-intel-serial-debug.sh
./flcl-setup-ci-darwin-x86-intel-openmp.sh
./flcl-setup-ci-darwin-x86-intel-openmp-debug.sh