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

  size_t c_test_ndarray_l_2d( flcl_ndarray_t *nd_array_l_2d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_l_2d = view_from_ndarray<bool**>(*nd_array_l_2d);
    for (size_t ii = 0; ii < array_l_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_l_2d.extent(1); jj++) { 
        if ( array_l_2d(ii,jj) ) c_sum++;
      }
    }
    if (c_sum != *f_sum) {
      std::cout << "FAILED ndarray_l_2d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    for (size_t ii = 0; ii < array_l_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_l_2d.extent(1); jj++) {
        array_l_2d(ii,jj) = logical_post;
      }
    }
    return c_sum;
  }

  size_t c_test_ndarray_i32_2d( flcl_ndarray_t *nd_array_i32_2d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_i32_2d = view_from_ndarray<int32_t**>(*nd_array_i32_2d);
    for (size_t ii = 0; ii < array_i32_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i32_2d.extent(1); jj++) {
        c_sum += array_i32_2d(ii,jj);
      }
    }
    if ( c_sum != *f_sum ) {
      std::cout << "FAILED ndarray_i32_2d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_i32_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i32_2d.extent(1); jj++) {
        array_i32_2d(ii,jj) = ii*jj;
        c_sum += array_i32_2d(ii,jj);
      }
    }
    return c_sum;
  }

  size_t c_test_ndarray_i64_2d( flcl_ndarray_t *nd_array_i64_2d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_i64_2d = view_from_ndarray<int64_t**>(*nd_array_i64_2d);
    for (size_t ii = 0; ii < array_i64_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i64_2d.extent(1); jj++) {
        c_sum += array_i64_2d(ii,jj);
      }
    }
    if ( c_sum != *f_sum ) {
      std::cout << "FAILED ndarray_i64_2d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_i64_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i64_2d.extent(1); jj++) {
        array_i64_2d(ii,jj) = ii*jj;
        c_sum += array_i64_2d(ii,jj);
      }
    }
    return c_sum;
  }

  float c_test_ndarray_r32_2d( flcl_ndarray_t *nd_array_r32_2d, float *f_sum ) {
    using flcl::view_from_ndarray;

    float c_sum = 0;
    auto array_r32_2d = view_from_ndarray<float**>(*nd_array_r32_2d);
    for (size_t ii = 0; ii < array_r32_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r32_2d.extent(1); jj++) {
        c_sum += array_r32_2d(ii,jj);
      }
    }
    if ( std::fabs(c_sum - *f_sum) > 1.0e-7 ) {
      std::cout << "FAILED ndarray_r32_2d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_r32_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r32_2d.extent(1); jj++) {
        array_r32_2d(ii,jj) = ii*jj;
        c_sum += array_r32_2d(ii,jj);
      }
    }
    return c_sum;
  }

  double c_test_ndarray_r64_2d( flcl_ndarray_t *nd_array_r64_2d, double *f_sum ) {
    using flcl::view_from_ndarray;

    double c_sum = 0;
    auto array_r64_2d = view_from_ndarray<double**>(*nd_array_r64_2d);
    for (size_t ii = 0; ii < array_r64_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r64_2d.extent(1); jj++) {
        c_sum += array_r64_2d(ii,jj);
      }
    }
    if ( std::fabs(c_sum - *f_sum) > 1.0e-14 ) {
      std::cout << "FAILED ndarray_r64_2d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_r64_2d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r64_2d.extent(1); jj++) {
        array_r64_2d(ii,jj) = ii*jj;
        c_sum += array_r64_2d(ii,jj);
      }
    }
    return c_sum;
  }

  size_t c_test_ndarray_l_3d( flcl_ndarray_t *nd_array_l_3d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_l_3d = view_from_ndarray<bool***>(*nd_array_l_3d);
    for (size_t ii = 0; ii < array_l_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_l_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_l_3d.extent(2); kk++) {
          if ( array_l_3d(ii,jj,kk) ) c_sum++;
        }
      }
    }
    if (c_sum != *f_sum) {
      std::cout << "FAILED ndarray_l_3d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    for (size_t ii = 0; ii < array_l_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_l_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_l_3d.extent(2); kk++) {
          array_l_3d(ii,jj,kk) = logical_post;
        }
      }
    }
    return c_sum;
  }

  size_t c_test_ndarray_i32_3d( flcl_ndarray_t *nd_array_i32_3d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_i32_3d = view_from_ndarray<int32_t***>(*nd_array_i32_3d);
    for (size_t ii = 0; ii < array_i32_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i32_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_i32_3d.extent(2); kk++) {
          c_sum += array_i32_3d(ii,jj,kk);
        }
      }
    }
    if ( c_sum != *f_sum ) {
      std::cout << "FAILED ndarray_i32_3d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_i32_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i32_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_i32_3d.extent(2); kk++) {
          array_i32_3d(ii,jj,kk) = ii*jj*kk;
          c_sum += array_i32_3d(ii,jj,kk);
        }
      }
    }
    return c_sum;
  }

  size_t c_test_ndarray_i64_3d( flcl_ndarray_t *nd_array_i64_3d, size_t *f_sum ) {
    using flcl::view_from_ndarray;

    size_t c_sum = 0;
    auto array_i64_3d = view_from_ndarray<int64_t***>(*nd_array_i64_3d);
    for (size_t ii = 0; ii < array_i64_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i64_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_i64_3d.extent(2); kk++) {
          c_sum += array_i64_3d(ii,jj,kk);
        }
      }
    }
    if ( c_sum != *f_sum ) {
      std::cout << "FAILED ndarray_i64_3d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_i64_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_i64_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_i64_3d.extent(2); kk++) {
          array_i64_3d(ii,jj,kk) = ii*jj*kk;
          c_sum += array_i64_3d(ii,jj,kk);
        }
      }
    }
    return c_sum;
  }

  float c_test_ndarray_r32_3d( flcl_ndarray_t *nd_array_r32_3d, float *f_sum ) {
    using flcl::view_from_ndarray;

    float c_sum = 0;
    auto array_r32_3d = view_from_ndarray<float***>(*nd_array_r32_3d);
    for (size_t ii = 0; ii < array_r32_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r32_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_r32_3d.extent(2); kk++) {
          c_sum += array_r32_3d(ii,jj,kk);
        }
      }
    }
    if ( std::fabs(c_sum - *f_sum) > 1.0e-7 ) {
      std::cout << "FAILED ndarray_r32_3d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_r32_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r32_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_r32_3d.extent(2); kk++) {
          array_r32_3d(ii,jj,kk) = ii*jj*kk;
          c_sum += array_r32_3d(ii,jj,kk);
        }
      }
    }
    return c_sum;
  }

  double c_test_ndarray_r64_3d( flcl_ndarray_t *nd_array_r64_3d, double *f_sum ) {
    using flcl::view_from_ndarray;

    double c_sum = 0;
    auto array_r64_3d = view_from_ndarray<double***>(*nd_array_r64_3d);
    for (size_t ii = 0; ii < array_r64_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r64_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_r64_3d.extent(2); kk++) {
          c_sum += array_r64_3d(ii,jj,kk);
        }
      }
    }
    if ( std::fabs(c_sum - *f_sum) > 1.0e-14 ) {
      std::cout << "FAILED ndarray_r64_3d" << std::endl;
      exit(EXIT_FAILURE);    
    }
    c_sum = 0;
    for (size_t ii = 0; ii < array_r64_3d.extent(0); ii++) {
      for (size_t jj = 0; jj < array_r64_3d.extent(1); jj++) {
        for (size_t kk = 0; kk < array_r64_3d.extent(2); kk++) {
          array_r64_3d(ii,jj,kk) = ii*jj*kk;
          c_sum += array_r64_3d(ii,jj,kk);
        }
      }
    }
    return c_sum;

  }


}