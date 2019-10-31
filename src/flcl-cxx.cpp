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

#include "flcl-cxx.hpp"

extern "C" {

  // 1D flcl view allocation routines
  void c_kokkos_allocate_v_l_1d(bool** A, flcl::view_l_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_l_1d_t(c_label, e0t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_i32_1d(int32_t** A, flcl::view_i32_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_i32_1d_t(c_label, e0t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_i64_1d(int64_t** A, flcl::view_i64_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_i64_1d_t(c_label, e0t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_r32_1d(float** A, flcl::view_r32_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_r32_1d_t(c_label, e0t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_r64_1d(double** A, flcl::view_r64_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_r64_1d_t(c_label, e0t));
    *A = (*v_A)->data();
    // below is a reminder of how to print the label
    // std::cout << "allocated view with label: " << ((*v_A)->label()) << std::endl;
  }

  // 2D flcl view allocation routines
  void c_kokkos_allocate_v_l_2d(bool** A, flcl::view_l_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_l_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_i32_2d(int32_t** A, flcl::view_i32_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_i32_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_i64_2d(int64_t** A, flcl::view_i64_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_i64_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_r32_2d(float** A, flcl::view_r32_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_r32_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_r64_2d(double** A, flcl::view_r64_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_r64_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->data();
  }

// 3D flcl view allocation routines
  void c_kokkos_allocate_v_l_3d(bool** A, flcl::view_l_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_l_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_i32_3d(int32_t** A, flcl::view_i32_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_i32_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_i64_3d(int64_t** A, flcl::view_i64_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_i64_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_r32_3d(float** A, flcl::view_r32_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_r32_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->data();
  }

  void c_kokkos_allocate_v_r64_3d(double** A, flcl::view_r64_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::view_r64_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->data();
  }

  // 1D flcl dualview allocation routines
  void c_kokkos_allocate_dv_l_1d(bool** A, flcl::dualview_l_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_l_1d_t(c_label, e0t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_i32_1d(int32_t** A, flcl::dualview_i32_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_i32_1d_t(c_label, e0t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_i64_1d(int64_t** A, flcl::dualview_i64_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_i64_1d_t(c_label, e0t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_r32_1d(float** A, flcl::dualview_r32_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_r32_1d_t(c_label, e0t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_r64_1d(double** A, flcl::dualview_r64_1d_t** v_A, const char** f_label, const size_t* e0) {
    const size_t e0t = std::max(*e0, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_r64_1d_t(c_label, e0t));
    *A = (*v_A)->h_view.data();
    // below is a reminder of how to print the label
    // std::cout << "allocated view with label: " << ((*v_A)->h_view.label()) << std::endl;
  }

  // 2D flcl dualview allocation routines
  void c_kokkos_allocate_dv_l_2d(bool** A, flcl::dualview_l_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_l_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_i32_2d(int32_t** A, flcl::dualview_i32_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_i32_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_i64_2d(int64_t** A, flcl::dualview_i64_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_i64_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_r32_2d(float** A, flcl::dualview_r32_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_r32_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_r64_2d(double** A, flcl::dualview_r64_2d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_r64_2d_t(c_label, e0t, e1t));
    *A = (*v_A)->h_view.data();
  }

// 3D flcl dualview allocation routines
  void c_kokkos_allocate_dv_l_3d(bool** A, flcl::dualview_l_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_l_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_i32_3d(int32_t** A, flcl::dualview_i32_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_i32_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_i64_3d(int64_t** A, flcl::dualview_i64_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_i64_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_r32_3d(float** A, flcl::dualview_r32_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_r32_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->h_view.data();
  }

  void c_kokkos_allocate_dv_r64_3d(double** A, flcl::dualview_r64_3d_t** v_A, const char** f_label, const size_t* e0, const size_t* e1, const size_t* e2) {
    const size_t e0t = std::max(*e0, 1);
    const size_t e1t = std::max(*e1, 1);
    const size_t e2t = std::max(*e2, 1);
    std::string c_label( *f_label );
    *v_A = (new flcl::dualview_r64_3d_t(c_label, e0t, e1t, e2t));
    *A = (*v_A)->h_view.data();
  }

  // 1D flcl view deallocation routines
  void c_kokkos_deallocate_v_l_1d(flcl::view_l_1d_t** v_A) {
    delete(*v_A);
  }
  
  void c_kokkos_deallocate_v_i32_1d(flcl::view_i32_1d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_i64_1d(flcl::view_i64_1d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_r32_1d(flcl::view_r32_1d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_r64_1d(flcl::view_r64_1d_t** v_A) {
    delete(*v_A);
  }

  // 2D flcl view deallocation routines
  void c_kokkos_deallocate_v_l_2d(flcl::view_l_2d_t** v_A) {
    delete(*v_A);
  }
  
  void c_kokkos_deallocate_v_i32_2d(flcl::view_i32_2d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_i64_2d(flcl::view_i64_2d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_r32_2d(flcl::view_r32_2d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_r64_2d(flcl::view_r64_2d_t** v_A) {
    delete(*v_A);
  }

  // 3D flcl view deallocation routines
  void c_kokkos_deallocate_v_l_3d(flcl::view_l_3d_t** v_A) {
    delete(*v_A);
  }
  
  void c_kokkos_deallocate_v_i32_3d(flcl::view_i32_3d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_i64_3d(flcl::view_i64_3d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_r32_3d(flcl::view_r32_3d_t** v_A) {
    delete(*v_A);
  }

  void c_kokkos_deallocate_v_r64_3d(flcl::view_r64_3d_t** v_A) {
    delete(*v_A);
  }

  // 1D flcl dualview deallocation routines
  void c_kokkos_deallocate_dv_l_1d(flcl::dualview_l_1d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_i32_1d(flcl::dualview_i32_1d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_i64_1d(flcl::dualview_i64_1d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_r32_1d(flcl::dualview_r32_1d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_r64_1d(flcl::dualview_r64_1d_t** v_A) {
    delete(*v_A);    
  }

  // 2D flcl dualview deallocation routines
  void c_kokkos_deallocate_dv_l_2d(flcl::dualview_l_2d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_i32_2d(flcl::dualview_i32_2d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_i64_2d(flcl::dualview_i64_2d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_r32_2d(flcl::dualview_r32_2d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_r64_2d(flcl::dualview_r64_2d_t** v_A) {
    delete(*v_A);    
  }

  // 3D flcl dualview deallocation routines
  void c_kokkos_deallocate_dv_l_3d(flcl::dualview_l_3d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_i32_3d(flcl::dualview_i32_3d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_i64_3d(flcl::dualview_i64_3d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_r32_3d(flcl::dualview_r32_3d_t** v_A) {
    delete(*v_A);    
  }

  void c_kokkos_deallocate_dv_r64_3d(flcl::dualview_r64_3d_t** v_A) {
    delete(*v_A);    
  }

} // extern "C"
