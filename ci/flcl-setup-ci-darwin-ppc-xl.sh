#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
./flcl-setup-ci-darwin-ppc-xl-serial.sh
./flcl-setup-ci-darwin-ppc-xl-serial-debug.sh
./flcl-setup-ci-darwin-ppc-xl-openmp.sh
./flcl-setup-ci-darwin-ppc-xl-openmp-debug.sh
