#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
./flcl-run-ci-darwin-x86-gcc-serial.sh
./flcl-run-ci-darwin-x86-gcc-serial-debug.sh
./flcl-run-ci-darwin-x86-gcc-openmp.sh
./flcl-run-ci-darwin-x86-gcc-openmp-debug.sh
./flcl-run-ci-darwin-x86-gcc-cuda.sh
./flcl-run-ci-darwin-x86-gcc-cuda-debug.sh