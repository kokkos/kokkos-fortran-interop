#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
echo 'Running x86-intel-19-openmp-debug-3.0'
./flcl-run-ci-darwin-x86-intel-19-openmp-debug-3.0.sh > output/x86-intel-19-openmp-debug-3.0.txt
grep "tests failed" output/x86-intel-19-openmp-debug-3.0.txt
echo 'Running x86-intel-20-openmp-debug-3.0'
./flcl-run-ci-darwin-x86-intel-20-openmp-debug-3.0.sh > output/x86-intel-20-openmp-debug-3.0.txt
grep "tests failed" output/x86-intel-20-openmp-debug-3.0.txt
echo 'Running x86-intel-19-openmp-debug-3.1.1'
./flcl-run-ci-darwin-x86-intel-19-openmp-debug-3.1.1.sh > output/x86-intel-19-openmp-debug-3.1.1.txt
grep "tests failed" output/x86-intel-19-openmp-debug-3.1.1.txt
echo 'Running x86-intel-20-openmp-debug-3.1.1'
./flcl-run-ci-darwin-x86-intel-20-openmp-debug-3.1.1.sh > output/x86-intel-20-openmp-debug-3.1.1.txt
grep "tests failed" output/x86-intel-20-openmp-debug-3.1.1.txt
