#!/bin/tcsh
./flcl-run-ci-darwin-ppc-gcc-serial.sh
./flcl-run-ci-darwin-ppc-gcc-serial-debug.sh
./flcl-run-ci-darwin-ppc-gcc-openmp.sh
./flcl-run-ci-darwin-ppc-gcc-openmp-debug.sh
./flcl-run-ci-darwin-ppc-gcc-cuda.sh
./flcl-run-ci-darwin-ppc-gcc-cuda-debug.sh