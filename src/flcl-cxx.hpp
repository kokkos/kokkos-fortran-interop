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

#ifndef FLCL_CXX_HPP
#define FLCL_CXX_HPP

#include <stddef.h>
#include <string>
#include <iostream>
#include <type_traits>
#include <Kokkos_Core.hpp>
#include <Kokkos_DualView.hpp>
#include "flcl-types-cxx.hpp"

#define FLCL_NDARRAY_MAX_RANK 8

typedef struct _flcl_nd_array_t {
    flcl::flcl_ndarray_index_c_t rank;
    flcl::flcl_ndarray_index_c_t dims[FLCL_NDARRAY_MAX_RANK];
    flcl::flcl_ndarray_index_c_t strides[FLCL_NDARRAY_MAX_RANK];
    void *data;
} flcl_ndarray_t;

namespace flcl {
#ifdef KOKKOS_ENABLE_CUDA
using HostMemorySpace = Kokkos::CudaUVMSpace;
#elif defined(KOKKOS_ENABLE_HIP)
using HostMemorySpace = Kokkos::HIPManagedSpace;
#else
using HostMemorySpace = Kokkos::HostSpace;
#endif
} // namespace flcl


// Design thoughts: view types are intended to be used on host-host codes, or
//   host-gpu codes with UVM as the default memory space. This allows for an
//   incremental porting beginning with a Fortran driver, on the host, calling
//   C++ kernels on the host, and then a Fortran driver calling C++ kernels on a
//   GPU, but eschewing the complications of explicit memory transfer. Then, as
//   an optimization, one could switch to using dualview types and manage the
//   necessary memory transfer explicitly over larger compute regions.
namespace flcl {

  #ifdef KOKKOS_ENABLE_CUDA
    using HostMemorySpace = Kokkos::CudaUVMSpace;
  #elif defined(KOKKOS_ENABLE_HIP)
    using HostMemorySpace = Kokkos::HIPManagedSpace;
  #else
    using HostMemorySpace = Kokkos::HostSpace;
  #endif

  // 1D fortran-compatible view types
  typedef Kokkos::View<flcl_view_l_c_t*,Kokkos::LayoutLeft,flcl::HostMemorySpace>                 view_l_1d_t;
  typedef Kokkos::View<flcl_view_i32_c_t*,Kokkos::LayoutLeft,flcl::HostMemorySpace>               view_i32_1d_t;
  typedef Kokkos::View<flcl_view_i64_c_t*,Kokkos::LayoutLeft,flcl::HostMemorySpace>               view_i64_1d_t;
  typedef Kokkos::View<flcl_view_r32_c_t*,Kokkos::LayoutLeft,flcl::HostMemorySpace>               view_r32_1d_t;
  typedef Kokkos::View<flcl_view_r64_c_t*,Kokkos::LayoutLeft,flcl::HostMemorySpace>               view_r64_1d_t;

  // 2D fortran-compatible view types
  typedef Kokkos::View<flcl_view_l_c_t**,Kokkos::LayoutLeft,flcl::HostMemorySpace>                view_l_2d_t;
  typedef Kokkos::View<flcl_view_i32_c_t**,Kokkos::LayoutLeft,flcl::HostMemorySpace>              view_i32_2d_t;
  typedef Kokkos::View<flcl_view_i64_c_t**,Kokkos::LayoutLeft,flcl::HostMemorySpace>              view_i64_2d_t;
  typedef Kokkos::View<flcl_view_r32_c_t**,Kokkos::LayoutLeft,flcl::HostMemorySpace>              view_r32_2d_t;
  typedef Kokkos::View<flcl_view_r64_c_t**,Kokkos::LayoutLeft,flcl::HostMemorySpace>              view_r64_2d_t;

  // 3D fortran-compatible view types
  typedef Kokkos::View<flcl_view_l_c_t***,Kokkos::LayoutLeft,flcl::HostMemorySpace>               view_l_3d_t;
  typedef Kokkos::View<flcl_view_i32_c_t***,Kokkos::LayoutLeft,flcl::HostMemorySpace>             view_i32_3d_t;
  typedef Kokkos::View<flcl_view_i64_c_t***,Kokkos::LayoutLeft,flcl::HostMemorySpace>             view_i64_3d_t;
  typedef Kokkos::View<flcl_view_r32_c_t***,Kokkos::LayoutLeft,flcl::HostMemorySpace>             view_r32_3d_t;
  typedef Kokkos::View<flcl_view_r64_c_t***,Kokkos::LayoutLeft,flcl::HostMemorySpace>             view_r64_3d_t;

  // 4D fortran-compatible view types
  typedef Kokkos::View<flcl_view_l_c_t****,Kokkos::LayoutLeft,flcl::HostMemorySpace>              view_l_4d_t;
  typedef Kokkos::View<flcl_view_i32_c_t****,Kokkos::LayoutLeft,flcl::HostMemorySpace>            view_i32_4d_t;
  typedef Kokkos::View<flcl_view_i64_c_t****,Kokkos::LayoutLeft,flcl::HostMemorySpace>            view_i64_4d_t;
  typedef Kokkos::View<flcl_view_r32_c_t****,Kokkos::LayoutLeft,flcl::HostMemorySpace>            view_r32_4d_t;
  typedef Kokkos::View<flcl_view_r64_c_t****,Kokkos::LayoutLeft,flcl::HostMemorySpace>            view_r64_4d_t;

  // 5D fortran-compatible view types
  typedef Kokkos::View<flcl_view_l_c_t*****,Kokkos::LayoutLeft,flcl::HostMemorySpace>             view_l_5d_t;
  typedef Kokkos::View<flcl_view_i32_c_t*****,Kokkos::LayoutLeft,flcl::HostMemorySpace>           view_i32_5d_t;
  typedef Kokkos::View<flcl_view_i64_c_t*****,Kokkos::LayoutLeft,flcl::HostMemorySpace>           view_i64_5d_t;
  typedef Kokkos::View<flcl_view_r32_c_t*****,Kokkos::LayoutLeft,flcl::HostMemorySpace>           view_r32_5d_t;
  typedef Kokkos::View<flcl_view_r64_c_t*****,Kokkos::LayoutLeft,flcl::HostMemorySpace>           view_r64_5d_t;

  // 6D fortran-compatible view types
  typedef Kokkos::View<flcl_view_l_c_t******,Kokkos::LayoutLeft,flcl::HostMemorySpace>            view_l_6d_t;
  typedef Kokkos::View<flcl_view_i32_c_t******,Kokkos::LayoutLeft,flcl::HostMemorySpace>          view_i32_6d_t;
  typedef Kokkos::View<flcl_view_i64_c_t******,Kokkos::LayoutLeft,flcl::HostMemorySpace>          view_i64_6d_t;
  typedef Kokkos::View<flcl_view_r32_c_t******,Kokkos::LayoutLeft,flcl::HostMemorySpace>          view_r32_6d_t;
  typedef Kokkos::View<flcl_view_r64_c_t******,Kokkos::LayoutLeft,flcl::HostMemorySpace>          view_r64_6d_t;

  // 7D fortran-compatible view types
  typedef Kokkos::View<flcl_view_l_c_t*******,Kokkos::LayoutLeft,flcl::HostMemorySpace>           view_l_7d_t;
  typedef Kokkos::View<flcl_view_i32_c_t*******,Kokkos::LayoutLeft,flcl::HostMemorySpace>         view_i32_7d_t;
  typedef Kokkos::View<flcl_view_i64_c_t*******,Kokkos::LayoutLeft,flcl::HostMemorySpace>         view_i64_7d_t;
  typedef Kokkos::View<flcl_view_r32_c_t*******,Kokkos::LayoutLeft,flcl::HostMemorySpace>         view_r32_7d_t;
  typedef Kokkos::View<flcl_view_r64_c_t*******,Kokkos::LayoutLeft,flcl::HostMemorySpace>         view_r64_7d_t;

  // 1D fortran-compatible dualview types
  typedef Kokkos::DualView<flcl_dualview_l_c_t*,Kokkos::LayoutLeft>                               dualview_l_1d_t;
  typedef Kokkos::DualView<flcl_dualview_i32_c_t*,Kokkos::LayoutLeft>                             dualview_i32_1d_t;
  typedef Kokkos::DualView<flcl_dualview_i64_c_t*,Kokkos::LayoutLeft>                             dualview_i64_1d_t;
  typedef Kokkos::DualView<flcl_dualview_r32_c_t*,Kokkos::LayoutLeft>                             dualview_r32_1d_t;
  typedef Kokkos::DualView<flcl_dualview_r64_c_t*,Kokkos::LayoutLeft>                             dualview_r64_1d_t;

  // 2D fortran-compatible dualview types
  typedef Kokkos::DualView<flcl_dualview_l_c_t**,Kokkos::LayoutLeft>                              dualview_l_2d_t;
  typedef Kokkos::DualView<flcl_dualview_i32_c_t**,Kokkos::LayoutLeft>                            dualview_i32_2d_t;
  typedef Kokkos::DualView<flcl_dualview_i64_c_t**,Kokkos::LayoutLeft>                            dualview_i64_2d_t;
  typedef Kokkos::DualView<flcl_dualview_r32_c_t**,Kokkos::LayoutLeft>                            dualview_r32_2d_t;
  typedef Kokkos::DualView<flcl_dualview_r64_c_t**,Kokkos::LayoutLeft>                            dualview_r64_2d_t;

  // 3D fortran-compatible dualview types
  typedef Kokkos::DualView<flcl_dualview_l_c_t***,Kokkos::LayoutLeft>                             dualview_l_3d_t;
  typedef Kokkos::DualView<flcl_dualview_i32_c_t***,Kokkos::LayoutLeft>                           dualview_i32_3d_t;
  typedef Kokkos::DualView<flcl_dualview_i64_c_t***,Kokkos::LayoutLeft>                           dualview_i64_3d_t;
  typedef Kokkos::DualView<flcl_dualview_r32_c_t***,Kokkos::LayoutLeft>                           dualview_r32_3d_t;
  typedef Kokkos::DualView<flcl_dualview_r64_c_t***,Kokkos::LayoutLeft>                           dualview_r64_3d_t;

  // 4D fortran-compatible dualview types
  typedef Kokkos::DualView<flcl_dualview_l_c_t****,Kokkos::LayoutLeft>                            dualview_l_4d_t;
  typedef Kokkos::DualView<flcl_dualview_i32_c_t****,Kokkos::LayoutLeft>                          dualview_i32_4d_t;
  typedef Kokkos::DualView<flcl_dualview_i64_c_t****,Kokkos::LayoutLeft>                          dualview_i64_4d_t;
  typedef Kokkos::DualView<flcl_dualview_r32_c_t****,Kokkos::LayoutLeft>                          dualview_r32_4d_t;
  typedef Kokkos::DualView<flcl_dualview_r64_c_t****,Kokkos::LayoutLeft>                          dualview_r64_4d_t;

  // 5D fortran-compatible dualview types
  typedef Kokkos::DualView<flcl_dualview_l_c_t*****,Kokkos::LayoutLeft>                           dualview_l_5d_t;
  typedef Kokkos::DualView<flcl_dualview_i32_c_t*****,Kokkos::LayoutLeft>                         dualview_i32_5d_t;
  typedef Kokkos::DualView<flcl_dualview_i64_c_t*****,Kokkos::LayoutLeft>                         dualview_i64_5d_t;
  typedef Kokkos::DualView<flcl_dualview_r32_c_t*****,Kokkos::LayoutLeft>                         dualview_r32_5d_t;
  typedef Kokkos::DualView<flcl_dualview_r64_c_t*****,Kokkos::LayoutLeft>                         dualview_r64_5d_t;

  // 6D fortran-compatible dualview types
  typedef Kokkos::DualView<flcl_dualview_l_c_t******,Kokkos::LayoutLeft>                          dualview_l_6d_t;
  typedef Kokkos::DualView<flcl_dualview_i32_c_t******,Kokkos::LayoutLeft>                        dualview_i32_6d_t;
  typedef Kokkos::DualView<flcl_dualview_i64_c_t******,Kokkos::LayoutLeft>                        dualview_i64_6d_t;
  typedef Kokkos::DualView<flcl_dualview_r32_c_t******,Kokkos::LayoutLeft>                        dualview_r32_6d_t;
  typedef Kokkos::DualView<flcl_dualview_r64_c_t******,Kokkos::LayoutLeft>                        dualview_r64_6d_t;

  // 7D fortran-compatible dualview types
  typedef Kokkos::DualView<flcl_dualview_l_c_t*******,Kokkos::LayoutLeft>                         dualview_l_7d_t;
  typedef Kokkos::DualView<flcl_dualview_i32_c_t*******,Kokkos::LayoutLeft>                       dualview_i32_7d_t;
  typedef Kokkos::DualView<flcl_dualview_i64_c_t*******,Kokkos::LayoutLeft>                       dualview_i64_7d_t;
  typedef Kokkos::DualView<flcl_dualview_r32_c_t*******,Kokkos::LayoutLeft>                       dualview_r32_7d_t;
  typedef Kokkos::DualView<flcl_dualview_r64_c_t*******,Kokkos::LayoutLeft>                       dualview_r64_7d_t;

  template <typename DataType>
  Kokkos::View<DataType, Kokkos::LayoutStride, flcl::HostMemorySpace>
  view_from_ndarray(flcl_ndarray_t const &ndarray) {
    size_t dimensions[Kokkos::ARRAY_LAYOUT_MAX_RANK] = {};
    size_t strides[Kokkos::ARRAY_LAYOUT_MAX_RANK] = {};

    using traits = Kokkos::ViewTraits<DataType>;
    using value_type = typename traits::value_type;
    constexpr auto rank = Kokkos::ViewTraits<DataType>::rank;

    if (rank != ndarray.rank) {
        std::cerr << "Requested Kokkos view of rank " << rank << " for ndarray with rank "
                  << ndarray.rank << "." << std::endl;
        std::exit(EXIT_FAILURE);
    }

    std::copy(ndarray.dims, ndarray.dims + ndarray.rank, dimensions);
    std::copy(ndarray.strides, ndarray.strides + ndarray.rank, strides);

    // clang-format off
    Kokkos::LayoutStride layout{
        dimensions[0], strides[0],
        dimensions[1], strides[1],
        dimensions[2], strides[2],
        dimensions[3], strides[3],
        dimensions[4], strides[4],
        dimensions[5], strides[5],
        dimensions[6], strides[6],
        dimensions[7], strides[7]
    };
    // clang-format on

    return Kokkos::View<DataType, Kokkos::LayoutStride, flcl::HostMemorySpace, Kokkos::MemoryUnmanaged>(
        reinterpret_cast<value_type *>(ndarray.data), layout);
  }

  template <typename View>
  flcl_ndarray_t view_to_ndarray(View const &view) {
    flcl_ndarray_t ndarray{};

    using const_data_type = typename View::const_data_type;
    using memory_space = typename View::memory_space;

    Kokkos::View<const_data_type, Kokkos::LayoutStride, memory_space> view_stride = view;

    Kokkos::LayoutStride layout = view_stride.layout();

    ndarray.rank = view_stride.rank;
    std::copy(layout.dimension, layout.dimension + view_stride.rank, ndarray.dims);
    std::copy(layout.stride, layout.stride + view_stride.rank, ndarray.strides);
    ndarray.data = const_cast<void *>(static_cast<void const *>(view_stride.data()));

    return ndarray;
  }

} // namespace flcl

#endif // FLCL_CXX_HPP
