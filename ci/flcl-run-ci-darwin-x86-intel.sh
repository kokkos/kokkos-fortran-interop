#!/bin/tcsh
echo 'Now running x86 intel 19.0.5 kokkos 3.0.00 serial release'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.0.00-serial-release.sh > output/darwin-x86-intel-19.0.5-kokkos-3.0.00-serial-release.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.0.00-serial-release.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.0.00 serial release'
echo 'Now running x86 intel 19.0.5 kokkos 3.0.00 serial debug'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.0.00-serial-debug.sh > output/darwin-x86-intel-19.0.5-kokkos-3.0.00-serial-debug.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.0.00-serial-debug.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.0.00 serial debug'
echo 'Now running x86 intel 19.0.5 kokkos 3.0.00 openmp release'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.0.00-openmp-release.sh > output/darwin-x86-intel-19.0.5-kokkos-3.0.00-openmp-release.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.0.00-openmp-release.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.0.00 openmp release'
echo 'Now running x86 intel 19.0.5 kokkos 3.0.00 openmp debug'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.0.00-openmp-debug.sh > output/darwin-x86-intel-19.0.5-kokkos-3.0.00-openmp-debug.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.0.00-openmp-debug.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.0.00 openmp debug'
echo 'Now running x86 intel 19.0.5 kokkos 3.1.01 serial release'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.1.01-serial-release.sh > output/darwin-x86-intel-19.0.5-kokkos-3.1.01-serial-release.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.1.01-serial-release.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.1.01 serial release'
echo 'Now running x86 intel 19.0.5 kokkos 3.1.01 serial debug'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.1.01-serial-debug.sh > output/darwin-x86-intel-19.0.5-kokkos-3.1.01-serial-debug.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.1.01-serial-debug.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.1.01 serial debug'
echo 'Now running x86 intel 19.0.5 kokkos 3.1.01 openmp release'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.1.01-openmp-release.sh > output/darwin-x86-intel-19.0.5-kokkos-3.1.01-openmp-release.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.1.01-openmp-release.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.1.01 openmp release'
echo 'Now running x86 intel 19.0.5 kokkos 3.1.01 openmp debug'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.1.01-openmp-debug.sh > output/darwin-x86-intel-19.0.5-kokkos-3.1.01-openmp-debug.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.1.01-openmp-debug.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.1.01 openmp debug'
echo 'Now running x86 intel 19.0.5 kokkos 3.3.01 serial release'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.3.01-serial-release.sh > output/darwin-x86-intel-19.0.5-kokkos-3.3.01-serial-release.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.3.01-serial-release.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.3.01 serial release'
echo 'Now running x86 intel 19.0.5 kokkos 3.3.01 serial debug'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.3.01-serial-debug.sh > output/darwin-x86-intel-19.0.5-kokkos-3.3.01-serial-debug.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.3.01-serial-debug.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.3.01 serial debug'
echo 'Now running x86 intel 19.0.5 kokkos 3.3.01 openmp release'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.3.01-openmp-release.sh > output/darwin-x86-intel-19.0.5-kokkos-3.3.01-openmp-release.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.3.01-openmp-release.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.3.01 openmp release'
echo 'Now running x86 intel 19.0.5 kokkos 3.3.01 openmp debug'
./flcl-run-ci-darwin-x86-intel-19.0.5-kokkos-3.3.01-openmp-debug.sh > output/darwin-x86-intel-19.0.5-kokkos-3.3.01-openmp-debug.txt
grep "tests failed" output/darwin-x86-intel-19.0.5-kokkos-3.3.01-openmp-debug.txt
echo 'Finished running x86 intel 19.0.5 kokkos 3.3.01 openmp debug'
echo 'Now running x86 intel 20.0.2 kokkos 3.0.00 serial release'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.0.00-serial-release.sh > output/darwin-x86-intel-20.0.2-kokkos-3.0.00-serial-release.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.0.00-serial-release.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.0.00 serial release'
echo 'Now running x86 intel 20.0.2 kokkos 3.0.00 serial debug'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.0.00-serial-debug.sh > output/darwin-x86-intel-20.0.2-kokkos-3.0.00-serial-debug.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.0.00-serial-debug.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.0.00 serial debug'
echo 'Now running x86 intel 20.0.2 kokkos 3.0.00 openmp release'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.0.00-openmp-release.sh > output/darwin-x86-intel-20.0.2-kokkos-3.0.00-openmp-release.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.0.00-openmp-release.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.0.00 openmp release'
echo 'Now running x86 intel 20.0.2 kokkos 3.0.00 openmp debug'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.0.00-openmp-debug.sh > output/darwin-x86-intel-20.0.2-kokkos-3.0.00-openmp-debug.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.0.00-openmp-debug.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.0.00 openmp debug'
echo 'Now running x86 intel 20.0.2 kokkos 3.1.01 serial release'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.1.01-serial-release.sh > output/darwin-x86-intel-20.0.2-kokkos-3.1.01-serial-release.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.1.01-serial-release.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.1.01 serial release'
echo 'Now running x86 intel 20.0.2 kokkos 3.1.01 serial debug'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.1.01-serial-debug.sh > output/darwin-x86-intel-20.0.2-kokkos-3.1.01-serial-debug.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.1.01-serial-debug.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.1.01 serial debug'
echo 'Now running x86 intel 20.0.2 kokkos 3.1.01 openmp release'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.1.01-openmp-release.sh > output/darwin-x86-intel-20.0.2-kokkos-3.1.01-openmp-release.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.1.01-openmp-release.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.1.01 openmp release'
echo 'Now running x86 intel 20.0.2 kokkos 3.1.01 openmp debug'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.1.01-openmp-debug.sh > output/darwin-x86-intel-20.0.2-kokkos-3.1.01-openmp-debug.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.1.01-openmp-debug.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.1.01 openmp debug'
echo 'Now running x86 intel 20.0.2 kokkos 3.3.01 serial release'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.3.01-serial-release.sh > output/darwin-x86-intel-20.0.2-kokkos-3.3.01-serial-release.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.3.01-serial-release.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.3.01 serial release'
echo 'Now running x86 intel 20.0.2 kokkos 3.3.01 serial debug'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.3.01-serial-debug.sh > output/darwin-x86-intel-20.0.2-kokkos-3.3.01-serial-debug.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.3.01-serial-debug.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.3.01 serial debug'
echo 'Now running x86 intel 20.0.2 kokkos 3.3.01 openmp release'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.3.01-openmp-release.sh > output/darwin-x86-intel-20.0.2-kokkos-3.3.01-openmp-release.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.3.01-openmp-release.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.3.01 openmp release'
echo 'Now running x86 intel 20.0.2 kokkos 3.3.01 openmp debug'
./flcl-run-ci-darwin-x86-intel-20.0.2-kokkos-3.3.01-openmp-debug.sh > output/darwin-x86-intel-20.0.2-kokkos-3.3.01-openmp-debug.txt
grep "tests failed" output/darwin-x86-intel-20.0.2-kokkos-3.3.01-openmp-debug.txt
echo 'Finished running x86 intel 20.0.2 kokkos 3.3.01 openmp debug'