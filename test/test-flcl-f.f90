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

module test_flcl_f_mod
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env

  use :: flcl_mod

  implicit none
  
  integer(c_size_t), parameter :: e0_length = 10
  integer(c_size_t), parameter :: e1_length = 9
  integer(c_size_t), parameter :: e2_length = 8
  integer(c_size_t), parameter :: e3_length = 7
  integer(c_size_t), parameter :: e4_length = 6
  integer(c_size_t), parameter :: e5_length = 5
  integer(c_size_t), parameter :: e6_length = 4
  logical(c_bool), parameter :: logical_pre = .true.
  logical(c_bool), parameter :: logical_post = .false.

  enum, bind(c)
    enumerator :: flcl_test_fail = 0
    enumerator :: flcl_test_pass = 1
  end enum

  public

    interface
      integer(c_size_t) &
        & function f_test_ndarray_l_1d( nd_array_l_1d, f_sum ) &
        & bind(c, name='c_test_ndarray_l_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_1d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_l_1d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i32_1d( nd_array_i32_1d, f_sum ) &
        & bind(c, name='c_test_ndarray_i32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_1d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i32_1d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i64_1d( nd_array_i64_1d, f_sum ) &
        & bind(c, name='c_test_ndarray_i64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_1d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i64_1d
    end interface

    interface
      real(c_float) &
        & function f_test_ndarray_r32_1d( nd_array_r32_1d, f_sum ) &
        & bind(c, name='c_test_ndarray_r32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_1d
        real(c_float), intent(inout) :: f_sum
      end function f_test_ndarray_r32_1d
    end interface

    interface
      real(c_double) &
        & function f_test_ndarray_r64_1d( nd_array_r64_1d, f_sum ) &
        & bind(c, name='c_test_ndarray_r64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_1d
        real(c_double), intent(inout) :: f_sum
      end function f_test_ndarray_r64_1d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_l_2d( nd_array_l_2d, f_sum ) &
        & bind(c, name='c_test_ndarray_l_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_2d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_l_2d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i32_2d( nd_array_i32_2d, f_sum ) &
        & bind(c, name='c_test_ndarray_i32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_2d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i32_2d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i64_2d( nd_array_i64_2d, f_sum ) &
        & bind(c, name='c_test_ndarray_i64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_2d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i64_2d
    end interface

    interface
      real(c_float) &
        & function f_test_ndarray_r32_2d( nd_array_r32_2d, f_sum ) &
        & bind(c, name='c_test_ndarray_r32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_2d
        real(c_float), intent(inout) :: f_sum
      end function f_test_ndarray_r32_2d
    end interface

    interface
      real(c_double) &
        & function f_test_ndarray_r64_2d( nd_array_r64_2d, f_sum ) &
        & bind(c, name='c_test_ndarray_r64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_2d
        real(c_double), intent(inout) :: f_sum
      end function f_test_ndarray_r64_2d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_l_3d( nd_array_l_3d, f_sum ) &
        & bind(c, name='c_test_ndarray_l_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_3d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_l_3d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i32_3d( nd_array_i32_3d, f_sum ) &
        & bind(c, name='c_test_ndarray_i32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_3d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i32_3d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i64_3d( nd_array_i64_3d, f_sum ) &
        & bind(c, name='c_test_ndarray_i64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_3d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i64_3d
    end interface

    interface
      real(c_float) &
        & function f_test_ndarray_r32_3d( nd_array_r32_3d, f_sum ) &
        & bind(c, name='c_test_ndarray_r32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_3d
        real(c_float), intent(inout) :: f_sum
      end function f_test_ndarray_r32_3d
    end interface

    interface
      real(c_double) &
        & function f_test_ndarray_r64_3d( nd_array_r64_3d, f_sum ) &
        & bind(c, name='c_test_ndarray_r64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_3d
        real(c_double), intent(inout) :: f_sum
      end function f_test_ndarray_r64_3d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_l_4d( nd_array_l_4d, f_sum ) &
        & bind(c, name='c_test_ndarray_l_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_4d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_l_4d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i32_4d( nd_array_i32_4d, f_sum ) &
        & bind(c, name='c_test_ndarray_i32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_4d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i32_4d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i64_4d( nd_array_i64_4d, f_sum ) &
        & bind(c, name='c_test_ndarray_i64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_4d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i64_4d
    end interface

    interface
      real(c_float) &
        & function f_test_ndarray_r32_4d( nd_array_r32_4d, f_sum ) &
        & bind(c, name='c_test_ndarray_r32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_4d
        real(c_float), intent(inout) :: f_sum
      end function f_test_ndarray_r32_4d
    end interface

    interface
      real(c_double) &
        & function f_test_ndarray_r64_4d( nd_array_r64_4d, f_sum ) &
        & bind(c, name='c_test_ndarray_r64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_4d
        real(c_double), intent(inout) :: f_sum
      end function f_test_ndarray_r64_4d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_l_5d( nd_array_l_5d, f_sum ) &
        & bind(c, name='c_test_ndarray_l_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_5d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_l_5d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i32_5d( nd_array_i32_5d, f_sum ) &
        & bind(c, name='c_test_ndarray_i32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_5d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i32_5d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i64_5d( nd_array_i64_5d, f_sum ) &
        & bind(c, name='c_test_ndarray_i64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_5d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i64_5d
    end interface

    interface
      real(c_float) &
        & function f_test_ndarray_r32_5d( nd_array_r32_5d, f_sum ) &
        & bind(c, name='c_test_ndarray_r32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_5d
        real(c_float), intent(inout) :: f_sum
      end function f_test_ndarray_r32_5d
    end interface

    interface
      real(c_double) &
        & function f_test_ndarray_r64_5d( nd_array_r64_5d, f_sum ) &
        & bind(c, name='c_test_ndarray_r64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_5d
        real(c_double), intent(inout) :: f_sum
      end function f_test_ndarray_r64_5d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_l_6d( nd_array_l_6d, f_sum ) &
        & bind(c, name='c_test_ndarray_l_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_6d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_l_6d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i32_6d( nd_array_i32_6d, f_sum ) &
        & bind(c, name='c_test_ndarray_i32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_6d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i32_6d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i64_6d( nd_array_i64_6d, f_sum ) &
        & bind(c, name='c_test_ndarray_i64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_6d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i64_6d
    end interface

    interface
      real(c_float) &
        & function f_test_ndarray_r32_6d( nd_array_r32_6d, f_sum ) &
        & bind(c, name='c_test_ndarray_r32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_6d
        real(c_float), intent(inout) :: f_sum
      end function f_test_ndarray_r32_6d
    end interface

    interface
      real(c_double) &
        & function f_test_ndarray_r64_6d( nd_array_r64_6d, f_sum ) &
        & bind(c, name='c_test_ndarray_r64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_6d
        real(c_double), intent(inout) :: f_sum
      end function f_test_ndarray_r64_6d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_l_7d( nd_array_l_7d, f_sum ) &
        & bind(c, name='c_test_ndarray_l_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_7d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_l_7d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i32_7d( nd_array_i32_7d, f_sum ) &
        & bind(c, name='c_test_ndarray_i32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_7d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i32_7d
    end interface

    interface
      integer(c_size_t) &
        & function f_test_ndarray_i64_7d( nd_array_i64_7d, f_sum ) &
        & bind(c, name='c_test_ndarray_i64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_7d
        integer(c_size_t), intent(inout) :: f_sum
      end function f_test_ndarray_i64_7d
    end interface

    interface
      real(c_float) &
        & function f_test_ndarray_r32_7d( nd_array_r32_7d, f_sum ) &
        & bind(c, name='c_test_ndarray_r32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_7d
        real(c_float), intent(inout) :: f_sum
      end function f_test_ndarray_r32_7d
    end interface

    interface
      real(c_double) &
        & function f_test_ndarray_r64_7d( nd_array_r64_7d, f_sum ) &
        & bind(c, name='c_test_ndarray_r64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_7d
        real(c_double), intent(inout) :: f_sum
      end function f_test_ndarray_r64_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_1d( v_array_l_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_1d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_1d( v_array_i32_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_1d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_1d( v_array_i64_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_1d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_1d( v_array_r32_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_1d
        real(c_float), intent(inout) :: f_sum
        real(c_float), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_1d( v_array_r64_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_1d
        real(c_double), intent(inout) :: f_sum
        real(c_double), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_2d( v_array_l_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_2d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_2d( v_array_i32_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_2d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_2d( v_array_i64_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_2d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_2d( v_array_r32_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_2d
        real(c_float), intent(inout) :: f_sum
        real(c_float), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_2d( v_array_r64_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_2d
        real(c_double), intent(inout) :: f_sum
        real(c_double), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_3d( v_array_l_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_3d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_3d( v_array_i32_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_3d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_3d( v_array_i64_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_3d
        integer(c_size_t), intent(inout) :: f_sum
        integer(c_size_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_3d( v_array_r32_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_3d
        real(c_float), intent(inout) :: f_sum
        real(c_float), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_3d( v_array_r64_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_3d
        real(c_double), intent(inout) :: f_sum
        real(c_double), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_3d
    end interface

    contains

      integer(c_size_t) &
        & function test_ndarray_l_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), dimension(:), allocatable :: array_l_1d
        integer :: ii
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = e0_length

        allocate( array_l_1d(e0_length) )
        do ii = 1, e0_length
          array_l_1d(ii) = logical_pre
          if (array_l_1d(ii) .eqv. logical_pre) then
            f_sum = f_sum + 1
          end if
        end do
        c_sum = f_test_ndarray_l_1d( to_nd_array(array_l_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          if (array_l_1d(ii) .eqv. logical_post) then
            f_sum = f_sum + 1
          end if
        end do
        if (f_sum == c_sum) then
          write(*,*)'PASSED ndarray_l_1d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarry_l_1d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_l_1d

      integer(c_size_t) &
        & function test_ndarray_i32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), dimension(:), allocatable :: array_i32_1d
        integer :: ii
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = e0_length

        allocate( array_i32_1d(e0_length) )
        do ii = 1, e0_length
          array_i32_1d(ii) = ii
          f_sum = f_sum + array_i32_1d(ii)
        end do
        c_sum = f_test_ndarray_i32_1d( to_nd_array(array_i32_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_i32_1d(ii)
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_1d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i32_1d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i32_1d

      integer(c_size_t) &
        & function test_ndarray_i64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), dimension(:), allocatable :: array_i64_1d
        integer :: ii
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = e0_length

        allocate( array_i64_1d(e0_length) )
        do ii = 1, e0_length
          array_i64_1d(ii) = ii
          f_sum = f_sum + array_i64_1d(ii)
        end do
        c_sum = f_test_ndarray_i64_1d( to_nd_array(array_i64_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_i64_1d(ii)
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_1d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i64_1d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i64_1d

      integer(c_size_t) &
        & function test_ndarray_r32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), dimension(:), allocatable :: array_r32_1d
        integer :: ii
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = e0_length

        allocate( array_r32_1d(e0_length) )
        do ii = 1, e0_length
          array_r32_1d(ii) = ii
          f_sum = f_sum + array_r32_1d(ii)
        end do
        c_sum = f_test_ndarray_r32_1d( to_nd_array(array_r32_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_r32_1d(ii)
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-7 ) then
          write(*,*)'PASSED ndarray_r32_1d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r32_1d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r32_1d
  
      integer(c_size_t) &
        & function test_ndarray_r64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), dimension(:), allocatable :: array_r64_1d
        integer :: ii
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = e0_length

        allocate( array_r64_1d(e0_length) )
        do ii = 1, e0_length
          array_r64_1d(ii) = ii
          f_sum = f_sum + array_r64_1d(ii)
        end do
        c_sum = f_test_ndarray_r64_1d( to_nd_array(array_r64_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_r64_1d(ii)
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-14 ) then
          write(*,*)'PASSED ndarray_r64_1d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r64_1d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r64_1d

      integer(c_size_t) &
        & function test_ndarray_l_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), dimension(:,:), allocatable :: array_l_2d
        integer :: ii, jj
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_l_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj =1, e1_length
            array_l_2d(ii,jj) = logical_pre
            if (array_l_2d(ii,jj) .eqv. logical_pre) then
              f_sum = f_sum + 1
            end if
          end do
        end do
        c_sum = f_test_ndarray_l_2d( to_nd_array(array_l_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            if (array_l_2d(ii,jj) .eqv. logical_post) then
              f_sum = f_sum + 1
            end if
          end do
        end do
        if (f_sum == c_sum) then
          write(*,*)'PASSED ndarray_l_2d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarry_l_2d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_l_2d
  
      integer(c_size_t) &
        & function test_ndarray_i32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), dimension(:,:), allocatable :: array_i32_2d
        integer :: ii, jj
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i32_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i32_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_i32_2d(ii,jj)
          end do
        end do
        c_sum = f_test_ndarray_i32_2d( to_nd_array(array_i32_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_i32_2d(ii,jj)
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_2d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i32_2d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i32_2d

      integer(c_size_t) &
        & function test_ndarray_i64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), dimension(:,:), allocatable :: array_i64_2d
        integer :: ii, jj
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i64_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i64_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_i64_2d(ii,jj)
          end do
        end do
        c_sum = f_test_ndarray_i64_2d( to_nd_array(array_i64_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_i64_2d(ii,jj)
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_2d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i64_2d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i64_2d

      integer(c_size_t) &
        & function test_ndarray_r32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), dimension(:,:), allocatable :: array_r32_2d
        integer :: ii, jj
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        allocate( array_r32_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r32_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_r32_2d(ii,jj)
          end do
        end do
        c_sum = f_test_ndarray_r32_2d( to_nd_array(array_r32_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_r32_2d(ii,jj)
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-7 ) then
          write(*,*)'PASSED ndarray_r32_2d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r32_2d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r32_2d
  
      integer(c_size_t) &
        & function test_ndarray_r64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), dimension(:,:), allocatable :: array_r64_2d
        integer :: ii, jj
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        allocate( array_r64_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r64_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_r64_2d(ii,jj)
          end do
        end do
        c_sum = f_test_ndarray_r64_2d( to_nd_array(array_r64_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_r64_2d(ii,jj)
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-14 ) then
          write(*,*)'PASSED ndarray_r64_2d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r64_2d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r64_2d

      integer(c_size_t) & 
        & function test_ndarray_l_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), dimension(:,:,:), allocatable :: array_l_3d
        integer :: ii, jj, kk
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_l_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_l_3d(ii,jj,kk) = logical_pre
              if (array_l_3d(ii,jj,kk) .eqv. logical_pre) then
                f_sum = f_sum + 1
              end if
            end do
          end do
        end do
        c_sum = f_test_ndarray_l_3d( to_nd_array(array_l_3d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              if (array_l_3d(ii,jj,kk) .eqv. logical_post) then
                f_sum = f_sum + 1
              end if
            end do
          end do
        end do
        if (f_sum == c_sum) then
          write(*,*)'PASSED ndarray_l_3d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarry_l_3d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_l_3d
  
      integer(c_size_t) &
        & function test_ndarray_i32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), dimension(:,:,:), allocatable :: array_i32_3d
        integer :: ii, jj, kk
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i32_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i32_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_i32_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_ndarray_i32_3d( to_nd_array(array_i32_3d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_i32_3d(ii,jj,kk)
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_3d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i32_3d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i32_3d

      integer(c_size_t) &
        & function test_ndarray_i64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), dimension(:,:,:), allocatable :: array_i64_3d
        integer :: ii, jj, kk
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i64_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i64_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_i64_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_ndarray_i64_3d( to_nd_array(array_i64_3d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_i64_3d(ii,jj,kk)
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_3d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i64_3d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i64_3d

      integer(c_size_t) &
        & function test_ndarray_r32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), dimension(:,:,:), allocatable :: array_r32_3d
        integer :: ii, jj, kk
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        allocate( array_r32_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r32_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_r32_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_ndarray_r32_3d( to_nd_array(array_r32_3d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_r32_3d(ii,jj,kk)
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-7 ) then
          write(*,*)'PASSED ndarray_r32_3d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r32_3d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r32_3d
  
      integer(c_size_t) &
        & function test_ndarray_r64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), dimension(:,:,:), allocatable :: array_r64_3d
        integer :: ii, jj, kk
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        allocate( array_r64_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r64_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_r64_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_ndarray_r64_3d( to_nd_array(array_r64_3d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_r64_3d(ii,jj,kk)
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-14 ) then
          write(*,*)'PASSED ndarray_r64_3d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r64_3d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r64_3d

      integer(c_size_t) &
        & function  test_ndarray_l_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), dimension(:,:,:,:), allocatable :: array_l_4d
        integer :: ii, jj, kk, ll
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_l_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_l_4d(ii,jj,kk,ll) = logical_pre
                if (array_l_4d(ii,jj,kk,ll) .eqv. logical_pre) then
                  f_sum = f_sum + 1
                end if
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_l_4d( to_nd_array(array_l_4d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                if (array_l_4d(ii,jj,kk,ll) .eqv. logical_post) then
                  f_sum = f_sum + 1
                end if
              end do
            end do
          end do
        end do
        if (f_sum == c_sum) then
          write(*,*)'PASSED ndarray_l_4d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarry_l_4d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_l_4d
  
      integer(c_size_t) &
        & function  test_ndarray_i32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), dimension(:,:,:,:), allocatable :: array_i32_4d
        integer :: ii, jj, kk, ll
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i32_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i32_4d(ii,jj,kk,ll) = ii*jj*kk*ll
                f_sum = f_sum + array_i32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i32_4d( to_nd_array(array_i32_4d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                f_sum = f_sum + array_i32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_4d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i32_4d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i32_4d

      integer(c_size_t) &
        & function  test_ndarray_i64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), dimension(:,:,:,:), allocatable :: array_i64_4d
        integer :: ii, jj, kk, ll
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i64_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i64_4d(ii,jj,kk,ll) = ii*jj*kk*ll
                f_sum = f_sum + array_i64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i64_4d( to_nd_array(array_i64_4d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                f_sum = f_sum + array_i64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_4d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i64_4d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i64_4d

      integer(c_size_t) &
        & function  test_ndarray_r32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), dimension(:,:,:,:), allocatable :: array_r32_4d
        integer :: ii, jj, kk, ll
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        allocate( array_r32_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r32_4d(ii,jj,kk,ll) = ii*jj*kk*ll
                f_sum = f_sum + array_r32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r32_4d( to_nd_array(array_r32_4d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                f_sum = f_sum + array_r32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-7 ) then
          write(*,*)'PASSED ndarray_r32_4d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r32_4d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r32_4d
  
      integer(c_size_t) &
        & function  test_ndarray_r64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), dimension(:,:,:,:), allocatable :: array_r64_4d
        integer :: ii, jj, kk, ll
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        allocate( array_r64_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r64_4d(ii,jj,kk,ll) = ii*jj*kk*ll
                f_sum = f_sum + array_r64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r64_4d( to_nd_array(array_r64_4d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                f_sum = f_sum + array_r64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-14 ) then
          write(*,*)'PASSED ndarray_r64_4d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r64_4d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r64_4d

      integer(c_size_t) &
        & function  test_ndarray_l_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), dimension(:,:,:,:,:), allocatable :: array_l_5d
        integer :: ii, jj, kk, ll, mm
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_l_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_l_5d(ii,jj,kk,ll,mm) = logical_pre
                  if (array_l_5d(ii,jj,kk,ll,mm) .eqv. logical_pre) then
                    f_sum = f_sum + 1
                  end if
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_l_5d( to_nd_array(array_l_5d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  if (array_l_5d(ii,jj,kk,ll,mm) .eqv. logical_post) then
                    f_sum = f_sum + 1
                  end if
                end do
              end do
            end do
          end do
        end do
        if (f_sum == c_sum) then
          write(*,*)'PASSED ndarray_l_5d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarry_l_5d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_l_5d

      integer(c_size_t) &
        & function  test_ndarray_i32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), dimension(:,:,:,:,:), allocatable :: array_i32_5d
        integer :: ii, jj, kk, ll, mm
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i32_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i32_5d(ii,jj,kk,ll,mm) = ii*jj*kk*ll*mm
                  f_sum = f_sum + array_i32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i32_5d( to_nd_array(array_i32_5d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  f_sum = f_sum + array_i32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_5d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i32_5d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i32_5d

      integer(c_size_t) &
        & function  test_ndarray_i64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), dimension(:,:,:,:,:), allocatable :: array_i64_5d
        integer :: ii, jj, kk, ll, mm
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i64_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i64_5d(ii,jj,kk,ll,mm) = ii*jj*kk*ll*mm
                  f_sum = f_sum + array_i64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i64_5d( to_nd_array(array_i64_5d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  f_sum = f_sum + array_i64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_5d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i64_5d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i64_5d

      integer(c_size_t) &
        & function  test_ndarray_r32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), dimension(:,:,:,:,:), allocatable :: array_r32_5d
        integer :: ii, jj, kk, ll, mm
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        allocate( array_r32_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r32_5d(ii,jj,kk,ll,mm) = ii*jj*kk*ll*mm
                  f_sum = f_sum + array_r32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r32_5d( to_nd_array(array_r32_5d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  f_sum = f_sum + array_r32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-7 ) then
          write(*,*)'PASSED ndarray_r32_5d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r32_5d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r32_5d

      integer(c_size_t) &
        & function  test_ndarray_r64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), dimension(:,:,:,:,:), allocatable :: array_r64_5d
        integer :: ii, jj, kk, ll, mm
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        allocate( array_r64_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r64_5d(ii,jj,kk,ll,mm) = ii*jj*kk*ll*mm
                  f_sum = f_sum + array_r64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r64_5d( to_nd_array(array_r64_5d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  f_sum = f_sum + array_r64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-14 ) then
          write(*,*)'PASSED ndarray_r64_5d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r64_5d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r64_5d

      integer(c_size_t) &
        & function  test_ndarray_l_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), dimension(:,:,:,:,:,:), allocatable :: array_l_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_l_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_l_6d(ii,jj,kk,ll,mm,nn) = logical_pre
                    if (array_l_6d(ii,jj,kk,ll,mm,nn) .eqv. logical_pre) then
                      f_sum = f_sum + 1
                    end if
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_l_6d( to_nd_array(array_l_6d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    if (array_l_6d(ii,jj,kk,ll,mm,nn) .eqv. logical_post) then
                      f_sum = f_sum + 1
                    end if
                  end do
                end do
              end do
            end do
          end do
        end do
        if (f_sum == c_sum) then
          write(*,*)'PASSED ndarray_l_6d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarry_l_6d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_l_6d

      integer(c_size_t) &
        & function  test_ndarray_i32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), dimension(:,:,:,:,:,:), allocatable :: array_i32_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i32_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i32_6d(ii,jj,kk,ll,mm,nn) = ii*jj*kk*ll*mm*nn
                    f_sum = f_sum + array_i32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i32_6d( to_nd_array(array_i32_6d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    f_sum = f_sum + array_i32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_6d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i32_6d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i32_6d

      integer(c_size_t) &
        & function  test_ndarray_i64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), dimension(:,:,:,:,:,:), allocatable :: array_i64_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i64_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i64_6d(ii,jj,kk,ll,mm,nn) = ii*jj*kk*ll*mm*nn
                    f_sum = f_sum + array_i64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i64_6d( to_nd_array(array_i64_6d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    f_sum = f_sum + array_i64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_6d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i64_6d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i64_6d

      integer(c_size_t) &
        & function  test_ndarray_r32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), dimension(:,:,:,:,:,:), allocatable :: array_r32_6d
        integer :: ii, jj, kk, ll, mm, nn
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        allocate( array_r32_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r32_6d(ii,jj,kk,ll,mm,nn) = ii*jj*kk*ll*mm*nn
                    f_sum = f_sum + array_r32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r32_6d( to_nd_array(array_r32_6d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    f_sum = f_sum + array_r32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-7 ) then
          write(*,*)'PASSED ndarray_r32_6d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r32_6d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r32_6d

      integer(c_size_t) &
        & function  test_ndarray_r64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), dimension(:,:,:,:,:,:), allocatable :: array_r64_6d
        integer :: ii, jj, kk, ll, mm, nn
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        allocate( array_r64_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r64_6d(ii,jj,kk,ll,mm,nn) = ii*jj*kk*ll*mm*nn
                    f_sum = f_sum + array_r64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r64_6d( to_nd_array(array_r64_6d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    f_sum = f_sum + array_r64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-14 ) then
          write(*,*)'PASSED ndarray_r64_6d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r64_6d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r64_6d

      integer(c_size_t) &
        & function  test_ndarray_l_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), dimension(:,:,:,:,:,:,:), allocatable :: array_l_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_l_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_l_7d(ii,jj,kk,ll,mm,nn,oo) = logical_pre
                      if (array_l_7d(ii,jj,kk,ll,mm,nn,oo) .eqv. logical_pre) then
                        f_sum = f_sum + 1
                      end if
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_l_7d( to_nd_array(array_l_7d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      if (array_l_7d(ii,jj,kk,ll,mm,nn,oo) .eqv. logical_post) then
                        f_sum = f_sum + 1
                      end if
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        if (f_sum == c_sum) then
          write(*,*)'PASSED ndarray_l_7d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarry_l_7d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_l_7d

      integer(c_size_t) &
        & function  test_ndarray_i32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), dimension(:,:,:,:,:,:,:), allocatable :: array_i32_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i32_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i32_7d(ii,jj,kk,ll,mm,nn,oo) = ii*jj*kk*ll*mm*nn*oo
                      f_sum = f_sum + array_i32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i32_7d( to_nd_array(array_i32_7d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      f_sum = f_sum + array_i32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_7d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i32_7d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i32_7d

      integer(c_size_t) &
        & function  test_ndarray_i64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), dimension(:,:,:,:,:,:,:), allocatable :: array_i64_7d
        integer :: ii, jj, kk, ll, mm, nn,oo
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        allocate( array_i64_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i64_7d(ii,jj,kk,ll,mm,nn,oo) = ii*jj*kk*ll*mm*nn*oo
                      f_sum = f_sum + array_i64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_i64_7d( to_nd_array(array_i64_7d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      f_sum = f_sum + array_i64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_7d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_i64_7d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_i64_7d

      integer(c_size_t) &
        & function  test_ndarray_r32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), dimension(:,:,:,:,:,:,:), allocatable :: array_r32_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        allocate( array_r32_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r32_7d(ii,jj,kk,ll,mm,nn,oo) = ii*jj*kk*ll*mm*nn*oo
                      f_sum = f_sum + array_r32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r32_7d( to_nd_array(array_r32_7d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      f_sum = f_sum + array_r32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-7 ) then
          write(*,*)'PASSED ndarray_r32_7d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r32_7d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r32_7d

      integer(c_size_t) &
        & function  test_ndarray_r64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), dimension(:,:,:,:,:,:,:), allocatable :: array_r64_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        allocate( array_r64_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r64_7d(ii,jj,kk,ll,mm,nn,oo) = ii*jj*kk*ll*mm*nn*oo
                      f_sum = f_sum + array_r64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_ndarray_r64_7d( to_nd_array(array_r64_7d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      f_sum = f_sum + array_r64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < 1.0e-14 ) then
          write(*,*)'PASSED ndarray_r64_7d'
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED ndarray_r64_7d'
          ierr = flcl_test_fail
        end if
      end function test_ndarray_r64_7d

      integer &
        & function test_kokkos_allocate_view_l_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), pointer, dimension(:)  :: array_l_1d
        type(c_ptr) :: v_array_l_1d
        integer :: ii
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_1d, v_array_l_1d, 'array_l_1d', e0_length )
        do ii = 1, e0_length
          array_l_1d(ii) = logical_pre
          if (array_l_1d(ii) .eqv. logical_pre) then
            f_sum = f_sum + 1
          end if
        end do
        ierr = f_test_kokkos_allocate_view_l_1d( v_array_l_1d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            if (array_l_1d(ii) .eqv. logical_post) then
              f_sum = f_sum + 1
            end if
          end do
  
          if (f_sum == c_sum) then
            write(*,*)'PASSED kokkos_allocate_view_l_1d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_l_1d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_l_1d

      integer &
        & function test_kokkos_allocate_view_i32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), pointer, dimension(:)  :: array_i32_1d
        type(c_ptr) :: v_array_i32_1d
        integer :: ii
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_1d, v_array_i32_1d, 'array_i32_1d', e0_length )
        do ii = 1, e0_length
          array_i32_1d(ii) = ii
          f_sum = f_sum + array_i32_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_i32_1d( v_array_i32_1d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_i32_1d(ii)
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i32_1d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_i32_1d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_i32_1d

      integer &
        & function test_kokkos_allocate_view_i64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), pointer, dimension(:)  :: array_i64_1d
        type(c_ptr) :: v_array_i64_1d
        integer :: ii
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_1d, v_array_i64_1d, 'array_i64_1d', e0_length )
        do ii = 1, e0_length
          array_i64_1d(ii) = ii
          f_sum = f_sum + array_i64_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_i64_1d( v_array_i64_1d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_i64_1d(ii)
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i64_1d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_i64_1d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_i64_1d

      integer &
        & function test_kokkos_allocate_view_r32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), pointer, dimension(:)  :: array_r32_1d
        type(c_ptr) :: v_array_r32_1d
        integer :: ii
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        call kokkos_allocate_view( array_r32_1d, v_array_r32_1d, 'array_r32_1d', e0_length )
        do ii = 1, e0_length
          array_r32_1d(ii) = ii
          f_sum = f_sum + array_r32_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_r32_1d( v_array_r32_1d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_r32_1d(ii)
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_1d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_r32_1d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_r32_1d

      integer &
        & function test_kokkos_allocate_view_r64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), pointer, dimension(:)  :: array_r64_1d
        type(c_ptr) :: v_array_r64_1d
        integer :: ii
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        call kokkos_allocate_view( array_r64_1d, v_array_r64_1d, 'array_r64_1d', e0_length )
        do ii = 1, e0_length
          array_r64_1d(ii) = ii
          f_sum = f_sum + array_r64_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_r64_1d( v_array_r64_1d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_r64_1d(ii)
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_1d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_r64_1d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_r64_1d

      integer &
        & function test_kokkos_allocate_view_l_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), pointer, dimension(:,:)  :: array_l_2d
        type(c_ptr) :: v_array_l_2d
        integer :: ii, jj
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_2d, v_array_l_2d, 'array_l_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_l_2d(ii,jj) = logical_pre
            if (array_l_2d(ii,jj) .eqv. logical_pre) then
              f_sum = f_sum + 1
            end if
          end do
        end do
        ierr = f_test_kokkos_allocate_view_l_2d( v_array_l_2d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              if (array_l_2d(ii,jj) .eqv. logical_post) then
                f_sum = f_sum + 1
              end if
            end do
          end do
          if (f_sum == c_sum) then
            write(*,*)'PASSED kokkos_allocate_view_l_2d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_l_2d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_l_2d

      integer &
        & function test_kokkos_allocate_view_i32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), pointer, dimension(:,:)  :: array_i32_2d
        type(c_ptr) :: v_array_i32_2d
        integer :: ii, jj
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_2d, v_array_i32_2d, 'array_i32_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i32_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_i32_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_2d( v_array_i32_2d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_i32_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i32_2d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_i32_2d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_i32_2d

      integer &
        & function test_kokkos_allocate_view_i64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), pointer, dimension(:,:)  :: array_i64_2d
        type(c_ptr) :: v_array_i64_2d
        integer :: ii, jj
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_2d, v_array_i64_2d, 'array_i64_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i64_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_i64_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_2d( v_array_i64_2d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_i64_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i64_2d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_i64_2d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_i64_2d

      integer &
        & function test_kokkos_allocate_view_r32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), pointer, dimension(:,:)  :: array_r32_2d
        type(c_ptr) :: v_array_r32_2d
        integer :: ii, jj
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        call kokkos_allocate_view( array_r32_2d, v_array_r32_2d, 'array_r32_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r32_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_r32_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_2d( v_array_r32_2d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_r32_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_2d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_r32_2d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_r32_2d

      integer &
        & function test_kokkos_allocate_view_r64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), pointer, dimension(:,:)  :: array_r64_2d
        type(c_ptr) :: v_array_r64_2d
        integer :: ii, jj
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        call kokkos_allocate_view( array_r64_2d, v_array_r64_2d, 'array_r64_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r64_2d(ii,jj) = ii*jj
            f_sum = f_sum + array_r64_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_2d( v_array_r64_2d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_r64_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_2d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_r64_2d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_r64_2d

      integer &
        & function test_kokkos_allocate_view_l_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(c_bool), pointer, dimension(:,:,:)  :: array_l_3d
        type(c_ptr) :: v_array_l_3d
        integer :: ii, jj, kk
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_3d, v_array_l_3d, 'array_l_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_l_3d(ii,jj,kk) = logical_pre
              if (array_l_3d(ii,jj,kk) .eqv. logical_pre) then
                f_sum = f_sum + 1
              end if
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_l_3d( v_array_l_3d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                if (array_l_3d(ii,jj,kk) .eqv. logical_post) then
                  f_sum = f_sum + 1
                end if
              end do
            end do
          end do
          if (f_sum == c_sum) then
            write(*,*)'PASSED kokkos_allocate_view_l_3d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_l_3d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_l_3d

      integer &
        & function test_kokkos_allocate_view_i32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int32_t), pointer, dimension(:,:,:)  :: array_i32_3d
        type(c_ptr) :: v_array_i32_3d
        integer :: ii, jj, kk
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_3d, v_array_i32_3d, 'array_i32_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i32_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_i32_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_3d( v_array_i32_3d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_i32_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i32_3d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_i32_3d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_i32_3d

      integer &
        & function test_kokkos_allocate_view_i64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(c_int64_t), pointer, dimension(:,:,:)  :: array_i64_3d
        type(c_ptr) :: v_array_i64_3d
        integer :: ii, jj, kk
        integer(c_size_t) :: f_sum = 0
        integer(c_size_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_3d, v_array_i64_3d, 'array_i64_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i64_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_i64_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_3d( v_array_i64_3d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_i64_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i64_3d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_i64_3d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_i64_3d

      integer &
        & function test_kokkos_allocate_view_r32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_float), pointer, dimension(:,:,:)  :: array_r32_3d
        type(c_ptr) :: v_array_r32_3d
        integer :: ii, jj, kk
        real(c_float) :: f_sum = 0
        real(c_float) :: c_sum = 0

        call kokkos_allocate_view( array_r32_3d, v_array_r32_3d, 'array_r32_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r32_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_r32_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_3d( v_array_r32_3d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_r32_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_3d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_r32_3d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_r32_3d

      integer &
        & function test_kokkos_allocate_view_r64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(c_double), pointer, dimension(:,:,:)  :: array_r64_3d
        type(c_ptr) :: v_array_r64_3d
        integer :: ii, jj, kk
        real(c_double) :: f_sum = 0
        real(c_double) :: c_sum = 0

        call kokkos_allocate_view( array_r64_3d, v_array_r64_3d, 'array_r64_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r64_3d(ii,jj,kk) = ii*jj*kk
              f_sum = f_sum + array_r64_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_3d( v_array_r64_3d, f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_r64_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_3d'
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED kokkos_allocate_view_r64_3d'
            ierr = flcl_test_fail
          end if
        end if
      end function test_kokkos_allocate_view_r64_3d

end module test_flcl_f_mod
