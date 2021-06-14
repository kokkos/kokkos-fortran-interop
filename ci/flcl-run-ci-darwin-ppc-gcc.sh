#!/bin/tcsh
echo 'Now running ppc gcc 7.4.0 kokkos 3.0.00 serial release'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-release.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-release.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-release.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.0.00 serial release'
echo 'Now running ppc gcc 7.4.0 kokkos 3.0.00 serial debug'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-debug.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-debug.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-debug.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.0.00 serial debug'
echo 'Now running ppc gcc 7.4.0 kokkos 3.0.00 openmp release'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.0.00-openmp-release.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-openmp-release.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-openmp-release.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.0.00 openmp release'
echo 'Now running ppc gcc 7.4.0 kokkos 3.0.00 openmp debug'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.0.00-openmp-debug.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-openmp-debug.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-openmp-debug.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.0.00 openmp debug'
echo 'Now running ppc gcc 7.4.0 cuda 10.1 kokkos 3.0.00 cuda release'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.0.00-cuda-release.sh > output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.0.00-cuda-release.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.0.00-cuda-release.txt
echo 'Finished running ppc gcc 7.4.0 cuda 10.1 kokkos 3.0.00 cuda release'
echo 'Now running ppc gcc 7.4.0 cuda 10.1 kokkos 3.0.00 cuda debug'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.0.00-cuda-debug.sh > output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.0.00-cuda-debug.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.0.00-cuda-debug.txt
echo 'Finished running ppc gcc 7.4.0 cuda 10.1 kokkos 3.0.00 cuda debug'
echo 'Now running ppc gcc 7.4.0 kokkos 3.1.01 serial release'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.1.01-serial-release.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-serial-release.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-serial-release.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.1.01 serial release'
echo 'Now running ppc gcc 7.4.0 kokkos 3.1.01 serial debug'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.1.01-serial-debug.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-serial-debug.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-serial-debug.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.1.01 serial debug'
echo 'Now running ppc gcc 7.4.0 kokkos 3.1.01 openmp release'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.1.01-openmp-release.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-openmp-release.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-openmp-release.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.1.01 openmp release'
echo 'Now running ppc gcc 7.4.0 kokkos 3.1.01 openmp debug'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.1.01-openmp-debug.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-openmp-debug.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.1.01-openmp-debug.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.1.01 openmp debug'
echo 'Now running ppc gcc 7.4.0 cuda 10.1 kokkos 3.1.01 cuda release'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.1.01-cuda-release.sh > output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.1.01-cuda-release.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.1.01-cuda-release.txt
echo 'Finished running ppc gcc 7.4.0 cuda 10.1 kokkos 3.1.01 cuda release'
echo 'Now running ppc gcc 7.4.0 cuda 10.1 kokkos 3.1.01 cuda debug'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.1.01-cuda-debug.sh > output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.1.01-cuda-debug.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-cuda-10.1-kokkos-3.1.01-cuda-debug.txt
echo 'Finished running ppc gcc 7.4.0 cuda 10.1 kokkos 3.1.01 cuda debug'
echo 'Now running ppc gcc 9.3.0 kokkos 3.3.01 serial release'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-kokkos-3.3.01-serial-release.sh > output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-serial-release.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-serial-release.txt
echo 'Finished running ppc gcc 9.3.0 kokkos 3.3.01 serial release'
echo 'Now running ppc gcc 9.3.0 kokkos 3.3.01 serial debug'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-kokkos-3.3.01-serial-debug.sh > output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-serial-debug.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-serial-debug.txt
echo 'Finished running ppc gcc 9.3.0 kokkos 3.3.01 serial debug'
echo 'Now running ppc gcc 9.3.0 kokkos 3.3.01 openmp release'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-kokkos-3.3.01-openmp-release.sh > output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-openmp-release.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-openmp-release.txt
echo 'Finished running ppc gcc 9.3.0 kokkos 3.3.01 openmp release'
echo 'Now running ppc gcc 9.3.0 kokkos 3.3.01 openmp debug'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-kokkos-3.3.01-openmp-debug.sh > output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-openmp-debug.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-kokkos-3.3.01-openmp-debug.txt
echo 'Finished running ppc gcc 9.3.0 kokkos 3.3.01 openmp debug'
echo 'Now running ppc gcc 9.3.0 cuda 11.0 kokkos 3.3.01 cuda release'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-cuda-11.0-kokkos-3.3.01-cuda-release.sh > output/darwin-ppc-gcc-9.3.0-cuda-11.0-kokkos-3.3.01-cuda-release.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-cuda-11.0-kokkos-3.3.01-cuda-release.txt
echo 'Finished running ppc gcc 9.3.0 cuda 11.0 kokkos 3.3.01 cuda release'
echo 'Now running ppc gcc 9.3.0 cuda 11.0 kokkos 3.3.01 cuda debug'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-cuda-11.0-kokkos-3.3.01-cuda-debug.sh > output/darwin-ppc-gcc-9.3.0-cuda-11.0-kokkos-3.3.01-cuda-debug.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-cuda-11.0-kokkos-3.3.01-cuda-debug.txt
echo 'Finished running ppc gcc 9.3.0 cuda 11.0 kokkos 3.3.01 cuda debug'
echo 'Now running ppc gcc 9.3.0 cuda 11.2 kokkos 3.3.01 cuda release'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-cuda-11.2-kokkos-3.3.01-cuda-release.sh > output/darwin-ppc-gcc-9.3.0-cuda-11.2-kokkos-3.3.01-cuda-release.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-cuda-11.2-kokkos-3.3.01-cuda-release.txt
echo 'Finished running ppc gcc 9.3.0 cuda 11.2 kokkos 3.3.01 cuda release'
echo 'Now running ppc gcc 9.3.0 cuda 11.2 kokkos 3.3.01 cuda debug'
./flcl-run-ci-darwin-ppc-gcc-9.3.0-cuda-11.2-kokkos-3.3.01-cuda-debug.sh > output/darwin-ppc-gcc-9.3.0-cuda-11.2-kokkos-3.3.01-cuda-debug.txt
grep "tests failed" output/darwin-ppc-gcc-9.3.0-cuda-11.2-kokkos-3.3.01-cuda-debug.txt
echo 'Finished running ppc gcc 9.3.0 cuda 11.2 kokkos 3.3.01 cuda debug'