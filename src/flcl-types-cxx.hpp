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

#ifndef FLCL_TYPES_CXX_HPP
#define FLCL_TYPES_CXX_HPP

#include <complex>

  namespace flcl {

    // FLCL primary scalar types
    // - modify at this level to change ndarray, view, and dualview simultaneously
    // - ensure compatibility with F side
    typedef bool                                flcl_l_c_t;

    typedef int32_t                             flcl_i32_c_t;
    typedef int64_t                             flcl_i64_c_t;

    typedef float                               flcl_r32_c_t;
    typedef double                              flcl_r64_c_t;

    typedef float                               flcl_c32_scalar_c_t;
    typedef double                              flcl_c64_scalar_c_t;
    typedef std::complex<flcl_c32_scalar_c_t>   flcl_c32_c_t;
    typedef std::complex<flcl_c64_scalar_c_t>   flcl_c64_c_t;

    typedef size_t                              flcl_index_c_t;

// FLCL ndarray scalar types
// - modify at this level to change ndarray only
// - ensure compatibility with F side at this level
    using flcl_ndarray_l_c_t = flcl_l_c_t;
    using flcl_ndarray_i32_c_t = flcl_i32_c_t;
    using flcl_ndarray_i64_c_t = flcl_i64_c_t;
    using flcl_ndarray_r32_c_t = flcl_r32_c_t;
    using flcl_ndarray_r64_c_t = flcl_r64_c_t;
    using flcl_ndarray_c32_scalar_c_t = flcl_c32_scalar_c_t;
    using flcl_ndarray_c64_scalar_c_t = flcl_c64_scalar_c_t;
    using flcl_ndarray_c32_c_t = flcl_c32_c_t;
    using flcl_ndarray_c64_c_t = flcl_c64_c_t;
    using flcl_ndarray_index_c_t = flcl_index_c_t;

// FLCL view scalar types
// - modify at this level to change view only
// - ensure compatibility with F side at this level
    using flcl_view_l_c_t = flcl_l_c_t;
    using flcl_view_i32_c_t = flcl_i32_c_t;
    using flcl_view_i64_c_t = flcl_i64_c_t;
    using flcl_view_r32_c_t = flcl_r32_c_t;
    using flcl_view_r64_c_t = flcl_r64_c_t;
    using flcl_view_c32_c_t = flcl_c32_c_t;
    using flcl_view_c64_c_t = flcl_c64_c_t;
    using flcl_view_index_c_t = flcl_index_c_t;

// FLCL dualview scalar types
// - modify at this level to change dualview only
// - ensure compatibility with F side at this level
    using flcl_dualview_l_c_t = flcl_l_c_t;
    using flcl_dualview_i32_c_t = flcl_i32_c_t;
    using flcl_dualview_i64_c_t = flcl_i64_c_t;
    using flcl_dualview_r32_c_t = flcl_r32_c_t;
    using flcl_dualview_r64_c_t = flcl_r64_c_t;
    using flcl_dualview_c32_c_t = flcl_c32_c_t;
    using flcl_dualview_c64_c_t = flcl_c64_c_t;
    using flcl_dualview_index_c_t = flcl_index_c_t;

  } // namespace flcl
  
#endif // FLCL_TYPES_CXX_HPP