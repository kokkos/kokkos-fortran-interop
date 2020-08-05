#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
echo 'Running ppc-xl-serial-3.0'
./flcl-run-ci-darwin-ppc-xl-serial-3.0.sh > output/ppc-xl-serial-3.0.txt
grep "tests failed" output/ppc-xl-serial-3.0.txt
echo 'Running ppc-xl-serial-debug-3.0'
./flcl-run-ci-darwin-ppc-xl-serial-debug-3.0.sh > output/ppc-xl-serial-debug-3.0.txt
grep "tests failed" output/ppc-xl-serial-debug-3.0.txt
# echo 'Running ppc-xl-openmp-3.0'
# ./flcl-run-ci-darwin-ppc-xl-openmp-3.0.sh > output/ppc-xl-openmp-3.0.txt #XL + Kokkos OpenMP is broken in FLCL at the moment
# grep "tests failed" output/ppc-xl-openmp-3.0.txt
# echo 'Running ppc-xl-openmp-debug-3.0'
# ./flcl-run-ci-darwin-ppc-xl-openmp-debug-3.0.sh > output/ppc-xl-openmp-debug-3.0.txt #XL + Kokkos OpenMP is broken in FLCL at the moment
# grep "tests failed" output/ppc-xl-openmp-debug-3.0.txt
echo 'Running ppc-xl-serial-3.1.1'
./flcl-run-ci-darwin-ppc-xl-serial-3.1.1.sh > output/ppc-xl-serial-3.1.1.txt
grep "tests failed" output/ppc-xl-serial-3.1.1.txt
echo 'Running ppc-xl-serial-debug-3.1.1'
./flcl-run-ci-darwin-ppc-xl-serial-debug-3.1.1.sh > output/ppc-xl-serial-debug-3.1.1.txt
grep "tests failed" output/ppc-xl-serial-debug-3.1.1.txt
# echo 'Running ppc-xl-openmp-3.1.1'
# ./flcl-run-ci-darwin-ppc-xl-openmp-3.1.1.sh > output/ppc-xl-openmp-3.1.1.txt #XL + Kokkos OpenMP is broken in FLCL at the moment
# grep "tests failed" output/ppc-xl-openmp-3.1.1.txt
# echo 'Running ppc-xl-openmp-debug-3.1.1'
# ./flcl-run-ci-darwin-ppc-xl-openmp-debug-3.1.1.sh > output/ppc-xl-openmp-debug-3.1.1.txt #XL + Kokkos OpenMP is broken in FLCL at the moment
# grep "tests failed" output/ppc-xl-openmp-debug-3.1.1.txt
