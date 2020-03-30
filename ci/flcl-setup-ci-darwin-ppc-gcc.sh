#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
./flcl-setup-ci-darwin-ppc-gcc-serial.sh
./flcl-setup-ci-darwin-ppc-gcc-serial-debug.sh
./flcl-setup-ci-darwin-ppc-gcc-openmp.sh
./flcl-setup-ci-darwin-ppc-gcc-openmp-debug.sh
./flcl-setup-ci-darwin-ppc-gcc-cuda.sh
./flcl-setup-ci-darwin-ppc-gcc-cuda-debug.sh