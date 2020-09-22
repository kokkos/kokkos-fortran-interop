! Copyright (c) 2019. Triad National Security, LLC. All rights reserved.
!
! This program was produced under U.S. Government contract 89233218CNA000001 for
! Los Alamos National Laboratory (LANL), which is operated by Triad National
! Security, LLC for the U.S. Department of Energy/National Nuclear Security
! Administration. All rights in the program are reserved by Triad National
! Security, LLC, and the U.S. Department of Energy/National Nuclear Security
! Administration. The Government is granted for itself and others acting on
! its behalf a nonexclusive, paid-up, irrevocable worldwide license in this
! material to reproduce, prepare derivative works, distribute copies to the
! public, perform publicly and display publicly, and to permit others to do so.
!
! This program is open source under the BSD-3 License.
!
! Redistribution and use in source and binary forms, with or without modification,
! are permitted provided that the following conditions are met:
!
! 1. Redistributions of source code must retain the above copyright
!   notice, this list of conditions and the following disclaimer.
! 2. Redistributions in binary form must reproduce the above copyright
!   notice, this list of conditions and the following disclaimer in the
!   documentation and/or other materials provided with the distribution.
! 3. Neither the name of the copyright holder nor the
!   names of its contributors may be used to endorse or promote products
!   derived from this software without specific prior written permission.
!
! THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
! ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
! WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
! DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
! DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
! (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
! ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
! (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
! SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
module flcl_types_mod
    use, intrinsic :: iso_c_binding
    use, intrinsic :: iso_fortran_env

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 1D Kokkos View types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: view_l_1d_t
      private
        type(c_ptr) :: handle
    end type view_l_1d_t

    type, bind(c) :: view_i32_1d_t
      private
        type(c_ptr) :: handle
    end type view_i32_1d_t

    type, bind(c) :: view_i64_1d_t
      private
        type(c_ptr) :: handle
    end type view_i64_1d_t

    type, bind(c) :: view_r32_1d_t
      private
        type(c_ptr) :: handle
    end type view_r32_1d_t

    type, bind(c) :: view_r64_1d_t
      private
        type(c_ptr) :: handle
    end type view_r64_1d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 2D Kokkos View types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: view_l_2d_t
      private
        type(c_ptr) :: handle
    end type view_l_2d_t

    type, bind(c) :: view_i32_2d_t
      private
        type(c_ptr) :: handle
    end type view_i32_2d_t

    type, bind(c) :: view_i64_2d_t
      private
        type(c_ptr) :: handle
    end type view_i64_2d_t

    type, bind(c) :: view_r32_2d_t
      private
        type(c_ptr) :: handle
    end type view_r32_2d_t

    type, bind(c) :: view_r64_2d_t
      private
        type(c_ptr) :: handle
    end type view_r64_2d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 3D Kokkos View types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: view_l_3d_t
      private
        type(c_ptr) :: handle
    end type view_l_3d_t

    type, bind(c) :: view_i32_3d_t
      private
        type(c_ptr) :: handle
    end type view_i32_3d_t

    type, bind(c) :: view_i64_3d_t
      private
        type(c_ptr) :: handle
    end type view_i64_3d_t

    type, bind(c) :: view_r32_3d_t
      private
        type(c_ptr) :: handle
    end type view_r32_3d_t

    type, bind(c) :: view_r64_3d_t
      private
        type(c_ptr) :: handle
    end type view_r64_3d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 4D Kokkos View types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: view_l_4d_t
      private
        type(c_ptr) :: handle
    end type view_l_4d_t

    type, bind(c) :: view_i32_4d_t
      private
        type(c_ptr) :: handle
    end type view_i32_4d_t

    type, bind(c) :: view_i64_4d_t
      private
        type(c_ptr) :: handle
    end type view_i64_4d_t

    type, bind(c) :: view_r32_4d_t
      private
        type(c_ptr) :: handle
    end type view_r32_4d_t

    type, bind(c) :: view_r64_4d_t
      private
        type(c_ptr) :: handle
    end type view_r64_4d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 5D Kokkos View types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: view_l_5d_t
      private
        type(c_ptr) :: handle
    end type view_l_5d_t

    type, bind(c) :: view_i32_5d_t
      private
        type(c_ptr) :: handle
    end type view_i32_5d_t

    type, bind(c) :: view_i64_5d_t
      private
        type(c_ptr) :: handle
    end type view_i64_5d_t

    type, bind(c) :: view_r32_5d_t
      private
        type(c_ptr) :: handle
    end type view_r32_5d_t

    type, bind(c) :: view_r64_5d_t
      private
        type(c_ptr) :: handle
    end type view_r64_5d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 6D Kokkos View types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: view_l_6d_t
      private
        type(c_ptr) :: handle
    end type view_l_6d_t

    type, bind(c) :: view_i32_6d_t
      private
        type(c_ptr) :: handle
    end type view_i32_6d_t

    type, bind(c) :: view_i64_6d_t
      private
        type(c_ptr) :: handle
    end type view_i64_6d_t

    type, bind(c) :: view_r32_6d_t
      private
        type(c_ptr) :: handle
    end type view_r32_6d_t

    type, bind(c) :: view_r64_6d_t
      private
        type(c_ptr) :: handle
    end type view_r64_6d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 7D Kokkos View types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: view_l_7d_t
      private
        type(c_ptr) :: handle
    end type view_l_7d_t

    type, bind(c) :: view_i32_7d_t
      private
        type(c_ptr) :: handle
    end type view_i32_7d_t

    type, bind(c) :: view_i64_7d_t
      private
        type(c_ptr) :: handle
    end type view_i64_7d_t

    type, bind(c) :: view_r32_7d_t
      private
        type(c_ptr) :: handle
    end type view_r32_7d_t

    type, bind(c) :: view_r64_7d_t
      private
        type(c_ptr) :: handle
    end type view_r64_7d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 1D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: dualview_l_1d_t
      private
        type(c_ptr) :: handle
    end type dualview_l_1d_t

    type, bind(c) :: dualview_i32_1d_t
      private
        type(c_ptr) :: handle
    end type dualview_i32_1d_t

    type, bind(c) :: dualview_i64_1d_t
      private
        type(c_ptr) :: handle
    end type dualview_i64_1d_t

    type, bind(c) :: dualview_r32_1d_t
      private
        type(c_ptr) :: handle
    end type dualview_r32_1d_t

    type, bind(c) :: dualview_r64_1d_t
      private
        type(c_ptr) :: handle
    end type dualview_r64_1d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 2D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: dualview_l_2d_t
      private
        type(c_ptr) :: handle
    end type dualview_l_2d_t

    type, bind(c) :: dualview_i32_2d_t
      private
        type(c_ptr) :: handle
    end type dualview_i32_2d_t

    type, bind(c) :: dualview_i64_2d_t
      private
        type(c_ptr) :: handle
    end type dualview_i64_2d_t

    type, bind(c) :: dualview_r32_2d_t
      private
        type(c_ptr) :: handle
    end type dualview_r32_2d_t

    type, bind(c) :: dualview_r64_2d_t
      private
        type(c_ptr) :: handle
    end type dualview_r64_2d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 3D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: dualview_l_3d_t
      private
        type(c_ptr) :: handle
    end type dualview_l_3d_t

    type, bind(c) :: dualview_i32_3d_t
      private
        type(c_ptr) :: handle
    end type dualview_i32_3d_t

    type, bind(c) :: dualview_i64_3d_t
      private
        type(c_ptr) :: handle
    end type dualview_i64_3d_t

    type, bind(c) :: dualview_r32_3d_t
      private
        type(c_ptr) :: handle
    end type dualview_r32_3d_t

    type, bind(c) :: dualview_r64_3d_t
      private
        type(c_ptr) :: handle
    end type dualview_r64_3d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 4D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: dualview_l_4d_t
      private
        type(c_ptr) :: handle
    end type dualview_l_4d_t

    type, bind(c) :: dualview_i32_4d_t
      private
        type(c_ptr) :: handle
    end type dualview_i32_4d_t

    type, bind(c) :: dualview_i64_4d_t
      private
        type(c_ptr) :: handle
    end type dualview_i64_4d_t

    type, bind(c) :: dualview_r32_4d_t
      private
        type(c_ptr) :: handle
    end type dualview_r32_4d_t

    type, bind(c) :: dualview_r64_4d_t
      private
        type(c_ptr) :: handle
    end type dualview_r64_4d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 5D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: dualview_l_5d_t
      private
        type(c_ptr) :: handle
    end type dualview_l_5d_t

    type, bind(c) :: dualview_i32_5d_t
      private
        type(c_ptr) :: handle
    end type dualview_i32_5d_t

    type, bind(c) :: dualview_i64_5d_t
      private
        type(c_ptr) :: handle
    end type dualview_i64_5d_t

    type, bind(c) :: dualview_r32_5d_t
      private
        type(c_ptr) :: handle
    end type dualview_r32_5d_t

    type, bind(c) :: dualview_r64_5d_t
      private
        type(c_ptr) :: handle
    end type dualview_r64_5d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 6D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: dualview_l_6d_t
      private
        type(c_ptr) :: handle
    end type dualview_l_6d_t

    type, bind(c) :: dualview_i32_6d_t
      private
        type(c_ptr) :: handle
    end type dualview_i32_6d_t

    type, bind(c) :: dualview_i64_6d_t
      private
        type(c_ptr) :: handle
    end type dualview_i64_6d_t

    type, bind(c) :: dualview_r32_6d_t
      private
        type(c_ptr) :: handle
    end type dualview_r32_6d_t

    type, bind(c) :: dualview_r64_6d_t
      private
        type(c_ptr) :: handle
    end type dualview_r64_6d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 7D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    type, bind(c) :: dualview_l_7d_t
      private
        type(c_ptr) :: handle
    end type dualview_l_7d_t

    type, bind(c) :: dualview_i32_7d_t
      private
        type(c_ptr) :: handle
    end type dualview_i32_7d_t

    type, bind(c) :: dualview_i64_7d_t
      private
        type(c_ptr) :: handle
    end type dualview_i64_7d_t

    type, bind(c) :: dualview_r32_7d_t
      private
        type(c_ptr) :: handle
    end type dualview_r32_7d_t

    type, bind(c) :: dualview_r64_7d_t
      private
        type(c_ptr) :: handle
    end type dualview_r64_7d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! fin
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end module flcl_types_mod