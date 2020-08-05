#!/bin/tcsh
# salloc -n 1 -p power9-asc -A asc-priority
echo 'Running ppc-gcc-serial-3.0'
./flcl-run-ci-darwin-ppc-gcc-serial-3.0.sh > output/ppc-gcc-serial-3.0.txt
grep "tests failed" output/ppc-gcc-serial-3.0.txt
echo 'Running ppc-gcc-serial-debug-3.0'
./flcl-run-ci-darwin-ppc-gcc-serial-debug-3.0.sh > output/ppc-gcc-serial-debug-3.0.txt
grep "tests failed" output/ppc-gcc-serial-debug-3.0.txt
echo 'Running pppc-gcc-openmp-3.0'
./flcl-run-ci-darwin-ppc-gcc-openmp-3.0.sh > output/ppc-gcc-openmp-3.0.txt
grep "tests failed" output/ppc-gcc-openmp-3.0.txt
echo 'Running ppc-gcc-openmp-debug-3.0'
./flcl-run-ci-darwin-ppc-gcc-openmp-debug-3.0.sh > output/ppc-gcc-openmp-debug-3.0.txt
grep "tests failed" output/ppc-gcc-openmp-debug-3.0.txt
echo 'Running ppc-gcc-cuda-3.0'
./flcl-run-ci-darwin-ppc-gcc-cuda-3.0.sh > output/ppc-gcc-cuda-3.0.txt
grep "tests failed" output/ppc-gcc-cuda-3.0.txt
echo 'Running ppc-gcc-cuda-debug-3.0'
./flcl-run-ci-darwin-ppc-gcc-cuda-debug-3.0.sh > output/ppc-gcc-cuda-debug-3.0.txt
grep "tests failed" output/ppc-gcc-cuda-debug-3.0.txt
echo 'Running ppc-gcc-serial-3.1.1'
./flcl-run-ci-darwin-ppc-gcc-serial-3.1.1.sh > output/ppc-gcc-serial-3.1.1.txt
grep "tests failed" output/ppc-gcc-serial-3.1.1.txt
echo 'Running ppc-gcc-serial-debug-3.1.1'
./flcl-run-ci-darwin-ppc-gcc-serial-debug-3.1.1.sh > output/ppc-gcc-serial-debug-3.1.1.txt
grep "tests failed" output/ppc-gcc-serial-debug-3.1.1.txt
echo 'Running pppc-gcc-openmp-3.1.1'
./flcl-run-ci-darwin-ppc-gcc-openmp-3.1.1.sh > output/ppc-gcc-openmp-3.1.1.txt
grep "tests failed" output/ppc-gcc-openmp-3.1.1.txt
echo 'Running ppc-gcc-openmp-debug-3.1.1'
./flcl-run-ci-darwin-ppc-gcc-openmp-debug-3.1.1.sh > output/ppc-gcc-openmp-debug-3.1.1.txt
grep "tests failed" output/ppc-gcc-openmp-debug-3.1.1.txt
echo 'Running ppc-gcc-cuda-3.1.1'
./flcl-run-ci-darwin-ppc-gcc-cuda-3.1.1.sh > output/ppc-gcc-cuda-3.1.1.txt
grep "tests failed" output/ppc-gcc-cuda-3.1.1.txt
echo 'Running ppc-gcc-cuda-debug-3.1.1'
./flcl-run-ci-darwin-ppc-gcc-cuda-debug-3.1.1.sh > output/ppc-gcc-cuda-debug-3.1.1.txt
grep "tests failed" output/ppc-gcc-cuda-debug-3.1.1.txt