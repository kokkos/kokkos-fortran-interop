#!/bin/tcsh
echo 'Now running ppc xl 16.1.1.6 kokkos 3.0.00 serial release'
./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-serial-release.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-serial-release.txt
grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-serial-release.txt
echo 'Finished running ppc xl 16.1.1.6 kokkos 3.0.00 serial release'
echo 'Now running ppc xl 16.1.1.6 kokkos 3.0.00 serial debug'
./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-serial-debug.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-serial-debug.txt
grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-serial-debug.txt
echo 'Finished running ppc xl 16.1.1.6 kokkos 3.0.00 serial release'
echo XL + Kokkos OpenMP + FLCL currently does not function: https://github.com/kokkos/kokkos-fortran-interop/issues/45
# echo 'Now running ppc xl 16.1.1.6 kokkos 3.0.00 openmp release'
# ./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-openmp-release.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-openmp-release.txt
# grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-openmp-release.txt
# echo 'Finished running ppc xl 16.1.1.6 kokkos 3.0.00 serial release'
# echo 'Now running ppc xl 16.1.1.6 kokkos 3.0.00 openmp debug'
# ./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-openmp-debug.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-openmp-debug.txt
# grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.0.00-openmp-debug.txt
# echo 'Finished running ppc xl 16.1.1.6 kokkos 3.0.00 openmp debug'
echo 'Now running ppc xl 16.1.1.6 kokkos 3.1.01 serial release'
./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-serial-release.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-serial-release.txt
grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-serial-release.txt
echo 'Finished running ppc xl 16.1.1.6 kokkos 3.1.01 serial release'
echo 'Now running ppc xl 16.1.1.6 kokkos 3.1.01 serial debug'
./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-serial-debug.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-serial-debug.txt
grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-serial-debug.txt
echo 'Finished running ppc xl 16.1.1.6 kokkos 3.1.01 serial release'
echo XL + Kokkos OpenMP + FLCL currently does not function: https://github.com/kokkos/kokkos-fortran-interop/issues/45
# echo 'Now running ppc xl 16.1.1.6 kokkos 3.1.01 openmp release'
# ./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-openmp-release.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-openmp-release.txt
# grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-openmp-release.txt
# echo 'Finished running ppc xl 16.1.1.6 kokkos 3.1.01 serial release'
# echo 'Now running ppc xl 16.1.1.6 kokkos 3.1.01 openmp debug'
# ./flcl-run-ci-darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-openmp-debug.sh > output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-openmp-debug.txt
# grep "tests failed" output/darwin-ppc-xl-16.1.1.6-kokkos-3.1.01-openmp-debug.txt
# echo 'Finished running ppc xl 16.1.1.6 kokkos 3.1.01 openmp debug'
echo 'Now running ppc xl 16.1.1.7 kokkos 3.3.01 serial release'
./flcl-run-ci-darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-serial-release.sh > output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-serial-release.txt
grep "tests failed" output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-serial-release.txt
echo 'Finished running ppc xl 16.1.1.7 kokkos 3.3.01 serial release'
echo 'Now running ppc xl 16.1.1.7 kokkos 3.3.01 serial debug'
./flcl-run-ci-darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-serial-debug.sh > output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-serial-debug.txt
grep "tests failed" output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-serial-debug.txt
echo 'Finished running ppc xl 16.1.1.7 kokkos 3.3.01 serial release'
echo XL + Kokkos OpenMP + FLCL currently does not function: https://github.com/kokkos/kokkos-fortran-interop/issues/45
# echo 'Now running ppc xl 16.1.1.7 kokkos 3.3.01 openmp release'
# ./flcl-run-ci-darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-openmp-release.sh > output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-openmp-release.txt
# grep "tests failed" output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-openmp-release.txt
# echo 'Finished running ppc xl 16.1.1.7 kokkos 3.3.01 serial release'
# echo 'Now running ppc xl 16.1.1.7 kokkos 3.3.01 openmp debug'
# ./flcl-run-ci-darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-openmp-debug.sh > output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-openmp-debug.txt
# grep "tests failed" output/darwin-ppc-xl-16.1.1.7-kokkos-3.3.01-openmp-debug.txt
# echo 'Finished running ppc xl 16.1.1.7 kokkos 3.3.01 openmp debug'
