#!/bin/tcsh
## salloc -n 1 --constraint=gpu_vendor:nvidia,cpu_vendor:Intel,gpu1_model:Tesla_K40c
echo 'Running x86-gcc-serial-3.0'
./flcl-run-ci-darwin-x86-gcc-serial-3.0.sh > output/x86-gcc-serial-3.0.txt
grep "tests failed" output/x86-gcc-serial-3.0.txt
echo 'Running x86-gcc-serial-debug-3.0'
./flcl-run-ci-darwin-x86-gcc-serial-debug-3.0.sh > output/x86-gcc-serial-debug-3.0.txt
grep "tests failed" output/x86-gcc-serial-debug-3.0.txt
echo 'Running x86-gcc-openmp-3.0'
./flcl-run-ci-darwin-x86-gcc-openmp-3.0.sh > output/x86-gcc-openmp-3.0.txt
grep "tests failed" output/x86-gcc-openmp-3.0.txt
echo 'Running x86-gcc-openmp-debug-3.0'
./flcl-run-ci-darwin-x86-gcc-openmp-debug-3.0.sh > output/x86-gcc-openmp-debug-3.0.txt
grep "tests failed" output/x86-gcc-openmp-debug-3.0.txt
echo 'Running x86-gcc-cuda-3.0'
./flcl-run-ci-darwin-x86-gcc-cuda-3.0.sh > output/x86-gcc-cuda-3.0.txt
grep "tests failed" output/x86-gcc-cuda-3.0.txt
echo 'Running x86-gcc-cuda-debug-3.0'
./flcl-run-ci-darwin-x86-gcc-cuda-debug-3.0.sh > output/x86-gcc-cuda-debug-3.0.txt
grep "tests failed" output/x86-gcc-cuda-debug-3.0.txt
echo 'Running x86-gcc-serial-3.1.1'
./flcl-run-ci-darwin-x86-gcc-serial-3.1.1.sh > output/x86-gcc-serial-3.1.1.txt
grep "tests failed" output/x86-gcc-serial-3.1.1.txt
echo 'Running x86-gcc-serial-debug-3.1.1'
./flcl-run-ci-darwin-x86-gcc-serial-debug-3.1.1.sh > output/x86-gcc-serial-debug-3.1.1.txt
grep "tests failed" output/x86-gcc-serial-debug-3.1.1.txt
echo 'Running x86-gcc-openmp-3.1.1'
./flcl-run-ci-darwin-x86-gcc-openmp-3.1.1.sh > output/x86-gcc-openmp-3.1.1.txt
grep "tests failed" output/x86-gcc-openmp-3.1.1.txt
echo 'Running x86-gcc-openmp-debug-3.1.1'
./flcl-run-ci-darwin-x86-gcc-openmp-debug-3.1.1.sh > output/x86-gcc-openmp-debug-3.1.1.txt
grep "tests failed" output/x86-gcc-openmp-debug-3.1.1.txt
echo 'Running x86-gcc-cuda-3.1.1'
./flcl-run-ci-darwin-x86-gcc-cuda-3.1.1.sh > output/x86-gcc-cuda-3.1.1.txt
grep "tests failed" output/x86-gcc-cuda-3.1.1.txt
echo 'Running x86-gcc-cuda-debug-3.1.1'
./flcl-run-ci-darwin-x86-gcc-cuda-debug-3.1.1.sh > output/x86-gcc-cuda-debug-3.1.1.txt
grep "tests failed" output/x86-gcc-cuda-debug-3.1.1.txt