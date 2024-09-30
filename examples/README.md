A few (starting with one) simple usage examples.

Be sure to at least build the libflcl.a target in the root build directory first.
- cd (FLCL_ROOT)/build
- export KOKKOS_ROOT=path/to/kokkos/installation
- make libflcl.a
- cd ../examples/01-axpy
- make axpy.x
- ./axpy.x
