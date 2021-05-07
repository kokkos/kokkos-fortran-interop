#!/bin/tcsh
echo 'Now running ppc gcc 7.4.0 kokkos 3.0.00 serial release'
./flcl-run-ci-darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-release.sh > output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-release.txt
grep "tests failed" output/darwin-ppc-gcc-7.4.0-kokkos-3.0.00-serial-release.txt
echo 'Finished running ppc gcc 7.4.0 kokkos 3.0.00 serial release''