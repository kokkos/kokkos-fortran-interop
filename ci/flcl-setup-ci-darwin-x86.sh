#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
./flcl-setup-ci-darwin-x86-gcc.sh
./flcl-setup-ci-darwin-x86-intel.sh
