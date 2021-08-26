// Copyright (c) 2019. Triad National Security, LLC. All rights reserved.
//
// This program was produced under U.S. Government contract 89233218CNA000001 for
// Los Alamos National Laboratory (LANL), which is operated by Triad National
// Security, LLC for the U.S. Department of Energy/National Nuclear Security
// Administration. All rights in the program are reserved by Triad National
// Security, LLC, and the U.S. Department of Energy/National Nuclear Security
// Administration. The Government is granted for itself and others acting on
// its behalf a nonexclusive, paid-up, irrevocable worldwide license in this
// material to reproduce, prepare derivative works, distribute copies to the
// public, perform publicly and display publicly, and to permit others to do so.
//
// This program is open source under the BSD-3 License.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the
//   names of its contributors may be used to endorse or promote products
//   derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#ifndef TEST_FLCL_CXX_H
#define TEST_FLCL_CXX_H

#include <stdbool.h>
#include <stdlib.h>
#include "flcl-types-cxx.hpp"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum _flcl_test_error_t {
  FLCL_TEST_PASS = 0,
  FLCL_TEST_FAIL = 1,
    
} flcl_test_error_t;


flcl::flcl_ndarray_index_c_t e0_length = 8;
flcl::flcl_ndarray_index_c_t e1_length = 7;
flcl::flcl_ndarray_index_c_t e2_length = 6;
flcl::flcl_ndarray_index_c_t e3_length = 5;
flcl::flcl_ndarray_index_c_t e4_length = 4;
flcl::flcl_ndarray_index_c_t e5_length = 3;
flcl::flcl_ndarray_index_c_t e6_length = 2;

float weak_precision_single = 1.0e-6;
double weak_precision_double = 1.0e-13;
float strong_precision_single = 1.0e-7;
double strong_precision_double = 1.0e-14;

#ifdef __INTEL_COMPILER
#ifdef NDEBUG
float precision_single = weak_precision_single;
double precision_double = weak_precision_double;
#else
float precision_single = strong_precision_single;
double precision_double = strong_precision_double;
#endif
#else
float precision_single = strong_precision_single;
double precision_double = strong_precision_double;
#endif

#ifdef __cplusplus
  constexpr bool logical_pre = true;
  constexpr bool logical_post = false;
#else
  _Bool logical_pre = true;
  _Bool logical_post = false;
#endif

#ifdef __cplusplus
}  // extern "C"
#endif

#endif // TEST_FLCL_CXX_H
