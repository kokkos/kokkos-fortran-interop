#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
./flcl-run-ci-darwin-ppc-gcc.sh
./flcl-run-ci-darwin-ppc-xl.sh
