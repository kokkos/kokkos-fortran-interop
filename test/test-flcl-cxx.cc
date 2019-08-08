#include "test-flcl-cxx.h"

extern "C" {

  void c_kokkos_initialize() {
    Kokkos::initialize();
  }

  void c_kokkos_finalize( void ) {
    Kokkos::finalize();
  }

  size_t c_test_ndarray_l_1d( flcl_ndarray_t *nd_array_l_1d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_l_1d = view_from_ndarray<bool*>(*nd_array_l_1d);
    for (size_t ii = 0; ii < array_l_1d.extent(0); ii++) {
      if ( array_l_1d(ii) ) c_sum++;
    }
    if (c_sum != *f_sum) {
      std::cout << "FAILED ndarray_l_1d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    for (size_t ii = 0; ii < array_l_1d.extent(0); ii++) {
      array_l_1d(ii) = logical_post;
    }
    return c_sum;
  }

  size_t c_test_ndarray_i32_1d( flcl_ndarray_t *nd_array_i32_1d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_i32_1d = view_from_ndarray<int32_t*>(*nd_array_i32_1d);
    for (size_t ii = 0; ii < array_i32_1d.extent(0); ii++) {
      c_sum += array_i32_1d(ii);
    }
    if ( c_sum != *f_sum ) {
      std::cout << "FAILED ndarray_i32_1d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_i32_1d.extent(0); ii++) {
      array_i32_1d(ii) = ii;
      c_sum += array_i32_1d(ii);
    }
    return c_sum;
  }

  size_t c_test_ndarray_i64_1d( flcl_ndarray_t *nd_array_i64_1d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_i64_1d = view_from_ndarray<int64_t*>(*nd_array_i64_1d);
    for (size_t ii = 0; ii < array_i64_1d.extent(0); ii++) {
      c_sum += array_i64_1d(ii);
    }
    if ( c_sum != *f_sum ) {
      std::cout << "FAILED ndarray_i64_1d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_i64_1d.extent(0); ii++) {
      array_i64_1d(ii) = ii;
      c_sum += array_i64_1d(ii);
    }
    return c_sum;
  }

  float c_test_ndarray_r32_1d( flcl_ndarray_t *nd_array_r32_1d, float *f_sum ) {
    using flcl::view_from_ndarray;

    float c_sum = 0;
    auto array_r32_1d = view_from_ndarray<float*>(*nd_array_r32_1d);
    for (size_t ii = 0; ii < array_r32_1d.extent(0); ii++) {
      c_sum += array_r32_1d(ii);
    }
    if ( std::fabs(c_sum - *f_sum) > 1.0e-7 ) {
      std::cout << "FAILED ndarray_r32_1d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_r32_1d.extent(0); ii++) {
      array_r32_1d(ii) = ii;
      c_sum += array_r32_1d(ii);
    }
    return c_sum;
  }

  double c_test_ndarray_r64_1d( flcl_ndarray_t *nd_array_r64_1d, double *f_sum ) {
    using flcl::view_from_ndarray;

    double c_sum = 0;
    auto array_r64_1d = view_from_ndarray<double*>(*nd_array_r64_1d);
    for (size_t ii = 0; ii < array_r64_1d.extent(0); ii++) {
      c_sum += array_r64_1d(ii);
    }
    if ( std::fabs(c_sum - *f_sum) > 1.0e-14 ) {
      std::cout << "FAILED ndarray_r64_1d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_r64_1d.extent(0); ii++) {
      array_r64_1d(ii) = ii;
      c_sum += array_r64_1d(ii);
    }
    return c_sum;
  }

}