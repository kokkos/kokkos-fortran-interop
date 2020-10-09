#!/bin/tcsh
setenv CI_PATH_PREFIX /home/$USER/kokkos-fortran-interop
setenv CI_KOKKOS_PATH /home/$USER/kt/3.1.1-ppc-xl-16.1.1.6-serial/lib64/cmake/Kokkos
setenv CI_BUILD_DIR $CI_PATH_PREFIX/ci/build-3.1.1-ppc-xl-16.1.1.6-serial
setenv CI_INSTALL_DIR $CI_PATH_PREFIX/ci/install-3.1.1-ppc-xl-16.1.1.6-serial
rm -rf $CI_BUILD_DIR
rm -rf $CI_INSTALL_DIR
mkdir -p $CI_BUILD_DIR
mkdir -p $CI_INSTALL_DIR
cd $CI_BUILD_DIR
module load cmake/3.17.3
module load gcc/7.4.0
module load ibm/xlc-16.1.1.6-xlf-16.1.1.6
# one of the important library dirs is not added
# to LD_LIBRARY path for XL module above:
setenv LD_LIBRARY_PATH /projects/opt/ppc64le/ibm/xlf-16.1.1.6/lib:$LD_LIBRARY_PATH
cmake --version
cmake -DKokkos_DIR=$CI_KOKKOS_PATH \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$CI_INSTALL_DIR $CI_PATH_PREFIX \
    -DCMAKE_Fortran_COMPILER_ARG1=-F/projects/opt/ppc64le/ibm/xlf-16.1.1.6/xlf/16.1.1/etc/xlf.cfg.rhel.7.7.gcc.7.4.0.cuda.10.1 \
    -DCMAKE_CXX_COMPILER_ARG1=-F/projects/opt/ppc64le/ibm/xlc-16.1.1.6/xlC/16.1.1/etc/xlc.cfg.rhel.7.7.gcc.7.4.0.cuda.10.1 \
    -DCMAKE_Fortran_COMPILER=/projects/opt/ppc64le/ibm/xlf-16.1.1.6/xlf/16.1.1/bin/xlf2008_r
    # -DCMAKE_EXE_LINKER_FLAGS="-L/projects/opt/ppc64le/ibm/xlc-16.1.1.6/xlC/16.1.1/lib -libmc++"
cmake --build $CI_BUILD_DIR
cmake --install $CI_BUILD_DIR
ctest
# printenv | grep LD_LIBRARY_PATH
