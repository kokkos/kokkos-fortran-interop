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

#define FLCL_REALPART(X) X%RE
#define FLCL_IMAGPART(X) X%IM

module flcl_test_f_mod
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env

  use :: flcl_mod

  implicit none
  
  integer(flcl_ndarray_index_f_t), parameter :: e0_length = 8
  integer(flcl_ndarray_index_f_t), parameter :: e1_length = 7
  integer(flcl_ndarray_index_f_t), parameter :: e2_length = 6
  integer(flcl_ndarray_index_f_t), parameter :: e3_length = 5
  integer(flcl_ndarray_index_f_t), parameter :: e4_length = 4
  integer(flcl_ndarray_index_f_t), parameter :: e5_length = 3
  integer(flcl_ndarray_index_f_t), parameter :: e6_length = 2
  logical(flcl_ndarray_l_f_t), parameter :: logical_pre = .true.
  logical(flcl_ndarray_l_f_t), parameter :: logical_post = .false.

  enum, bind(c)
    enumerator :: flcl_test_pass = 0
    enumerator :: flcl_test_fail = 1
  end enum

  real(flcl_ndarray_r32_f_t)  :: ndarray_precision_single = 1.0e-7
  real(flcl_ndarray_r64_f_t)  :: ndarray_precision_double = 1.0e-14
  real(flcl_view_r32_f_t)     :: view_precision_single = 1.0e-7
  real(flcl_view_r64_f_t)     :: view_precision_double = 1.0e-14
  real(flcl_dualview_r32_f_t) :: dualview_precision_single = 1.0e-7
  real(flcl_dualview_r64_f_t) :: dualview_precision_double = 1.0e-14

  public

    interface
      integer(flcl_ndarray_index_f_t) &
        & function f_test_to_ndarray_l_1d( nd_array_l_1d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_l_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_1d
        integer(flcl_ndarray_index_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_l_1d
    end interface

    interface
      integer(flcl_ndarray_i32_f_t) &
        & function f_test_to_ndarray_i32_1d( nd_array_i32_1d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_1d
        integer(flcl_ndarray_i32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i32_1d
    end interface

    interface
      integer(flcl_ndarray_i64_f_t) &
        & function f_test_to_ndarray_i64_1d( nd_array_i64_1d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_1d
        integer(flcl_ndarray_i64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i64_1d
    end interface

    interface
      real(flcl_ndarray_r32_f_t) &
        & function f_test_to_ndarray_r32_1d( nd_array_r32_1d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_1d
        real(flcl_ndarray_r32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r32_1d
    end interface

    interface
      real(flcl_ndarray_r64_f_t) &
        & function f_test_to_ndarray_r64_1d( nd_array_r64_1d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_1d
        real(flcl_ndarray_r64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r64_1d
    end interface

    interface
      complex(flcl_ndarray_c32_f_t) &
        & function f_test_to_ndarray_c32_1d( nd_array_c32_1d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_1d
        complex(flcl_ndarray_c32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c32_1d
    end interface

    interface
      complex(flcl_ndarray_c64_f_t) &
        & function f_test_to_ndarray_c64_1d( nd_array_c64_1d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_1d
        complex(flcl_ndarray_c64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c64_1d
    end interface

    interface
      integer(flcl_ndarray_index_f_t) &
        & function f_test_to_ndarray_l_2d( nd_array_l_2d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_l_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_2d
        integer(flcl_ndarray_index_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_l_2d
    end interface

    interface
      integer(flcl_ndarray_i32_f_t) &
        & function f_test_to_ndarray_i32_2d( nd_array_i32_2d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_2d
        integer(flcl_ndarray_i32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i32_2d
    end interface

    interface
      integer(flcl_ndarray_i64_f_t) &
        & function f_test_to_ndarray_i64_2d( nd_array_i64_2d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_2d
        integer(flcl_ndarray_i64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i64_2d
    end interface

    interface
      real(flcl_ndarray_r32_f_t) &
        & function f_test_to_ndarray_r32_2d( nd_array_r32_2d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_2d
        real(flcl_ndarray_r32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r32_2d
    end interface

    interface
      real(flcl_ndarray_r64_f_t) &
        & function f_test_to_ndarray_r64_2d( nd_array_r64_2d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_2d
        real(flcl_ndarray_r64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r64_2d
    end interface

    interface
      complex(flcl_ndarray_c32_f_t) &
        & function f_test_to_ndarray_c32_2d( nd_array_c32_2d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_2d
        complex(flcl_ndarray_c32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c32_2d
    end interface

    interface
      complex(flcl_ndarray_c64_f_t) &
        & function f_test_to_ndarray_c64_2d( nd_array_c64_2d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_2d
        complex(flcl_ndarray_c64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c64_2d
    end interface

    interface
      integer(flcl_ndarray_index_f_t) &
        & function f_test_to_ndarray_l_3d( nd_array_l_3d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_l_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_3d
        integer(flcl_ndarray_index_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_l_3d
    end interface

    interface
      integer(flcl_ndarray_i32_f_t) &
        & function f_test_to_ndarray_i32_3d( nd_array_i32_3d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_3d
        integer(flcl_ndarray_i32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i32_3d
    end interface

    interface
      integer(flcl_ndarray_i64_f_t) &
        & function f_test_to_ndarray_i64_3d( nd_array_i64_3d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_3d
        integer(flcl_ndarray_i64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i64_3d
    end interface

    interface
      real(flcl_ndarray_r32_f_t) &
        & function f_test_to_ndarray_r32_3d( nd_array_r32_3d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_3d
        real(flcl_ndarray_r32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r32_3d
    end interface

    interface
      real(flcl_ndarray_r64_f_t) &
        & function f_test_to_ndarray_r64_3d( nd_array_r64_3d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_3d
        real(flcl_ndarray_r64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r64_3d
    end interface

    interface
      complex(flcl_ndarray_c32_f_t) &
        & function f_test_to_ndarray_c32_3d( nd_array_c32_3d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_3d
        complex(flcl_ndarray_c32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c32_3d
    end interface

    interface
      complex(flcl_ndarray_c64_f_t) &
        & function f_test_to_ndarray_c64_3d( nd_array_c64_3d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_3d
        complex(flcl_ndarray_c64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c64_3d
    end interface

    interface
      integer(flcl_ndarray_index_f_t) &
        & function f_test_to_ndarray_l_4d( nd_array_l_4d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_l_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_4d
        integer(flcl_ndarray_index_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_l_4d
    end interface

    interface
      integer(flcl_ndarray_i32_f_t) &
        & function f_test_to_ndarray_i32_4d( nd_array_i32_4d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_4d
        integer(flcl_ndarray_i32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i32_4d
    end interface

    interface
      integer(flcl_ndarray_i64_f_t) &
        & function f_test_to_ndarray_i64_4d( nd_array_i64_4d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_4d
        integer(flcl_ndarray_i64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i64_4d
    end interface

    interface
      real(flcl_ndarray_r32_f_t) &
        & function f_test_to_ndarray_r32_4d( nd_array_r32_4d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_4d
        real(flcl_ndarray_r32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r32_4d
    end interface

    interface
      real(flcl_ndarray_r64_f_t) &
        & function f_test_to_ndarray_r64_4d( nd_array_r64_4d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_4d
        real(flcl_ndarray_r64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r64_4d
    end interface

    interface
      complex(flcl_ndarray_c32_f_t) &
        & function f_test_to_ndarray_c32_4d( nd_array_c32_4d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_4d
        complex(flcl_ndarray_c32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c32_4d
    end interface

    interface
      complex(flcl_ndarray_c64_f_t) &
        & function f_test_to_ndarray_c64_4d( nd_array_c64_4d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_4d
        complex(flcl_ndarray_c64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c64_4d
    end interface

    interface
      integer(flcl_ndarray_index_f_t) &
        & function f_test_to_ndarray_l_5d( nd_array_l_5d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_l_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_5d
        integer(flcl_ndarray_index_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_l_5d
    end interface

    interface
      integer(flcl_ndarray_i32_f_t) &
        & function f_test_to_ndarray_i32_5d( nd_array_i32_5d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_5d
        integer(flcl_ndarray_i32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i32_5d
    end interface

    interface
      integer(flcl_ndarray_i64_f_t) &
        & function f_test_to_ndarray_i64_5d( nd_array_i64_5d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_5d
        integer(flcl_ndarray_i64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i64_5d
    end interface

    interface
      real(flcl_ndarray_r32_f_t) &
        & function f_test_to_ndarray_r32_5d( nd_array_r32_5d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_5d
        real(flcl_ndarray_r32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r32_5d
    end interface

    interface
      real(flcl_ndarray_r64_f_t) &
        & function f_test_to_ndarray_r64_5d( nd_array_r64_5d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_5d
        real(flcl_ndarray_r64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r64_5d
    end interface

    interface
      complex(flcl_ndarray_c32_f_t) &
        & function f_test_to_ndarray_c32_5d( nd_array_c32_5d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_5d
        complex(flcl_ndarray_c32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c32_5d
    end interface

    interface
      complex(flcl_ndarray_c64_f_t) &
        & function f_test_to_ndarray_c64_5d( nd_array_c64_5d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_5d
        complex(flcl_ndarray_c64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c64_5d
    end interface

    interface
      integer(flcl_ndarray_index_f_t) &
        & function f_test_to_ndarray_l_6d( nd_array_l_6d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_l_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_6d
        integer(flcl_ndarray_index_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_l_6d
    end interface

    interface
      integer(flcl_ndarray_i32_f_t) &
        & function f_test_to_ndarray_i32_6d( nd_array_i32_6d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_6d
        integer(flcl_ndarray_i32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i32_6d
    end interface

    interface
      integer(flcl_ndarray_i64_f_t) &
        & function f_test_to_ndarray_i64_6d( nd_array_i64_6d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_6d
        integer(flcl_ndarray_i64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i64_6d
    end interface

    interface
      real(flcl_ndarray_r32_f_t) &
        & function f_test_to_ndarray_r32_6d( nd_array_r32_6d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_6d
        real(flcl_ndarray_r32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r32_6d
    end interface

    interface
      real(flcl_ndarray_r64_f_t) &
        & function f_test_to_ndarray_r64_6d( nd_array_r64_6d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_6d
        real(flcl_ndarray_r64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r64_6d
    end interface

    interface
      complex(flcl_ndarray_c32_f_t) &
        & function f_test_to_ndarray_c32_6d( nd_array_c32_6d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_6d
        complex(flcl_ndarray_c32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c32_6d
    end interface

    interface
      complex(flcl_ndarray_c64_f_t) &
        & function f_test_to_ndarray_c64_6d( nd_array_c64_6d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_6d
        complex(flcl_ndarray_c64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c64_6d
    end interface

    interface
      integer(flcl_ndarray_index_f_t) &
        & function f_test_to_ndarray_l_7d( nd_array_l_7d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_l_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_7d
        integer(flcl_ndarray_index_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_l_7d
    end interface

    interface
      integer(flcl_ndarray_i32_f_t) &
        & function f_test_to_ndarray_i32_7d( nd_array_i32_7d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_7d
        integer(flcl_ndarray_i32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i32_7d
    end interface

    interface
      integer(flcl_ndarray_i64_f_t) &
        & function f_test_to_ndarray_i64_7d( nd_array_i64_7d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_i64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_7d
        integer(flcl_ndarray_i64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_i64_7d
    end interface

    interface
      real(flcl_ndarray_r32_f_t) &
        & function f_test_to_ndarray_r32_7d( nd_array_r32_7d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_7d
        real(flcl_ndarray_r32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r32_7d
    end interface

    interface
      real(flcl_ndarray_r64_f_t) &
        & function f_test_to_ndarray_r64_7d( nd_array_r64_7d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_r64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_7d
        real(flcl_ndarray_r64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_r64_7d
    end interface

    interface
      complex(flcl_ndarray_c32_f_t) &
        & function f_test_to_ndarray_c32_7d( nd_array_c32_7d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_7d
        complex(flcl_ndarray_c32_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c32_7d
    end interface

    interface
      complex(flcl_ndarray_c64_f_t) &
        & function f_test_to_ndarray_c64_7d( nd_array_c64_7d, f_sum ) &
        & bind(c, name='c_test_to_ndarray_c64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_7d
        complex(flcl_ndarray_c64_f_t), intent(inout) :: f_sum
      end function f_test_to_ndarray_c64_7d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_l_1d( nd_array_l_1d ) &
        & bind(c, name='c_test_from_ndarray_l_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_1d
      end function f_test_from_ndarray_l_1d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i32_1d( nd_array_i32_1d ) &
        & bind(c, name='c_test_from_ndarray_i32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_1d
      end function f_test_from_ndarray_i32_1d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i64_1d( nd_array_i64_1d ) &
        & bind(c, name='c_test_from_ndarray_i64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_1d
      end function f_test_from_ndarray_i64_1d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r32_1d( nd_array_r32_1d ) &
        & bind(c, name='c_test_from_ndarray_r32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_1d
      end function f_test_from_ndarray_r32_1d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r64_1d( nd_array_r64_1d ) &
        & bind(c, name='c_test_from_ndarray_r64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_1d
      end function f_test_from_ndarray_r64_1d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c32_1d( nd_array_c32_1d ) &
        & bind(c, name='c_test_from_ndarray_c32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_1d
      end function f_test_from_ndarray_c32_1d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c64_1d( nd_array_c64_1d ) &
        & bind(c, name='c_test_from_ndarray_c64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_1d
      end function f_test_from_ndarray_c64_1d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_l_2d( nd_array_l_2d ) &
        & bind(c, name='c_test_from_ndarray_l_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_2d
      end function f_test_from_ndarray_l_2d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i32_2d( nd_array_i32_2d ) &
        & bind(c, name='c_test_from_ndarray_i32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_2d
      end function f_test_from_ndarray_i32_2d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i64_2d( nd_array_i64_2d ) &
        & bind(c, name='c_test_from_ndarray_i64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_2d
      end function f_test_from_ndarray_i64_2d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r32_2d( nd_array_r32_2d ) &
        & bind(c, name='c_test_from_ndarray_r32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_2d
      end function f_test_from_ndarray_r32_2d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r64_2d( nd_array_r64_2d ) &
        & bind(c, name='c_test_from_ndarray_r64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_2d
      end function f_test_from_ndarray_r64_2d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c32_2d( nd_array_c32_2d ) &
        & bind(c, name='c_test_from_ndarray_c32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_2d
      end function f_test_from_ndarray_c32_2d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c64_2d( nd_array_c64_2d ) &
        & bind(c, name='c_test_from_ndarray_c64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_2d
      end function f_test_from_ndarray_c64_2d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_l_3d( nd_array_l_3d ) &
        & bind(c, name='c_test_from_ndarray_l_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_3d
      end function f_test_from_ndarray_l_3d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i32_3d( nd_array_i32_3d ) &
        & bind(c, name='c_test_from_ndarray_i32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_3d
      end function f_test_from_ndarray_i32_3d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i64_3d( nd_array_i64_3d ) &
        & bind(c, name='c_test_from_ndarray_i64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_3d
      end function f_test_from_ndarray_i64_3d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r32_3d( nd_array_r32_3d ) &
        & bind(c, name='c_test_from_ndarray_r32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_3d
      end function f_test_from_ndarray_r32_3d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r64_3d( nd_array_r64_3d ) &
        & bind(c, name='c_test_from_ndarray_r64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_3d
      end function f_test_from_ndarray_r64_3d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c32_3d( nd_array_c32_3d ) &
        & bind(c, name='c_test_from_ndarray_c32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_3d
      end function f_test_from_ndarray_c32_3d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c64_3d( nd_array_c64_3d ) &
        & bind(c, name='c_test_from_ndarray_c64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_3d
      end function f_test_from_ndarray_c64_3d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_l_4d( nd_array_l_4d ) &
        & bind(c, name='c_test_from_ndarray_l_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_4d
      end function f_test_from_ndarray_l_4d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i32_4d( nd_array_i32_4d ) &
        & bind(c, name='c_test_from_ndarray_i32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_4d
      end function f_test_from_ndarray_i32_4d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i64_4d( nd_array_i64_4d ) &
        & bind(c, name='c_test_from_ndarray_i64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_4d
      end function f_test_from_ndarray_i64_4d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r32_4d( nd_array_r32_4d ) &
        & bind(c, name='c_test_from_ndarray_r32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_4d
      end function f_test_from_ndarray_r32_4d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r64_4d( nd_array_r64_4d ) &
        & bind(c, name='c_test_from_ndarray_r64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_4d
      end function f_test_from_ndarray_r64_4d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c32_4d( nd_array_c32_4d ) &
        & bind(c, name='c_test_from_ndarray_c32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_4d
      end function f_test_from_ndarray_c32_4d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c64_4d( nd_array_c64_4d ) &
        & bind(c, name='c_test_from_ndarray_c64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_4d
      end function f_test_from_ndarray_c64_4d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_l_5d( nd_array_l_5d ) &
        & bind(c, name='c_test_from_ndarray_l_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_5d
      end function f_test_from_ndarray_l_5d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i32_5d( nd_array_i32_5d ) &
        & bind(c, name='c_test_from_ndarray_i32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_5d
      end function f_test_from_ndarray_i32_5d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i64_5d( nd_array_i64_5d ) &
        & bind(c, name='c_test_from_ndarray_i64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_5d
      end function f_test_from_ndarray_i64_5d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r32_5d( nd_array_r32_5d ) &
        & bind(c, name='c_test_from_ndarray_r32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_5d
      end function f_test_from_ndarray_r32_5d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r64_5d( nd_array_r64_5d ) &
        & bind(c, name='c_test_from_ndarray_r64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_5d
      end function f_test_from_ndarray_r64_5d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c32_5d( nd_array_c32_5d ) &
        & bind(c, name='c_test_from_ndarray_c32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_5d
      end function f_test_from_ndarray_c32_5d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c64_5d( nd_array_c64_5d ) &
        & bind(c, name='c_test_from_ndarray_c64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_5d
      end function f_test_from_ndarray_c64_5d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_l_6d( nd_array_l_6d ) &
        & bind(c, name='c_test_from_ndarray_l_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_6d
      end function f_test_from_ndarray_l_6d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i32_6d( nd_array_i32_6d ) &
        & bind(c, name='c_test_from_ndarray_i32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_6d
      end function f_test_from_ndarray_i32_6d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i64_6d( nd_array_i64_6d ) &
        & bind(c, name='c_test_from_ndarray_i64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_6d
      end function f_test_from_ndarray_i64_6d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r32_6d( nd_array_r32_6d ) &
        & bind(c, name='c_test_from_ndarray_r32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_6d
      end function f_test_from_ndarray_r32_6d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r64_6d( nd_array_r64_6d ) &
        & bind(c, name='c_test_from_ndarray_r64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_6d
      end function f_test_from_ndarray_r64_6d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c32_6d( nd_array_c32_6d ) &
        & bind(c, name='c_test_from_ndarray_c32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_6d
      end function f_test_from_ndarray_c32_6d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c64_6d( nd_array_c64_6d ) &
        & bind(c, name='c_test_from_ndarray_c64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_6d
      end function f_test_from_ndarray_c64_6d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_l_7d( nd_array_l_7d ) &
        & bind(c, name='c_test_from_ndarray_l_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_l_7d
      end function f_test_from_ndarray_l_7d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i32_7d( nd_array_i32_7d ) &
        & bind(c, name='c_test_from_ndarray_i32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i32_7d
      end function f_test_from_ndarray_i32_7d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_i64_7d( nd_array_i64_7d ) &
        & bind(c, name='c_test_from_ndarray_i64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_i64_7d
      end function f_test_from_ndarray_i64_7d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r32_7d( nd_array_r32_7d ) &
        & bind(c, name='c_test_from_ndarray_r32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r32_7d
      end function f_test_from_ndarray_r32_7d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_r64_7d( nd_array_r64_7d ) &
        & bind(c, name='c_test_from_ndarray_r64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_r64_7d
      end function f_test_from_ndarray_r64_7d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c32_7d( nd_array_c32_7d ) &
        & bind(c, name='c_test_from_ndarray_c32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c32_7d
      end function f_test_from_ndarray_c32_7d
    end interface

    interface
      type(nd_array_t) &
        & function f_test_from_ndarray_c64_7d( nd_array_c64_7d ) &
        & bind(c, name='c_test_from_ndarray_c64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(nd_array_t), intent(in) :: nd_array_c64_7d
      end function f_test_from_ndarray_c64_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_1d( v_array_l_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_1d
        integer(flcl_view_index_f_t), intent(inout) :: f_sum
        integer(flcl_view_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_1d( v_array_i32_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_1d
        integer(flcl_view_i32_f_t), intent(inout) :: f_sum
        integer(flcl_view_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_1d( v_array_i64_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_1d
        integer(flcl_view_i64_f_t), intent(inout) :: f_sum
        integer(flcl_view_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_1d( v_array_r32_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_1d
        real(flcl_view_r32_f_t), intent(inout) :: f_sum
        real(flcl_view_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_1d( v_array_r64_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_1d
        real(flcl_view_r64_f_t), intent(inout) :: f_sum
        real(flcl_view_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_2d( v_array_l_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_2d
        integer(flcl_view_index_f_t), intent(inout) :: f_sum
        integer(flcl_view_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_2d( v_array_i32_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_2d
        integer(flcl_view_i32_f_t), intent(inout) :: f_sum
        integer(flcl_view_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_2d( v_array_i64_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_2d
        integer(flcl_view_i64_f_t), intent(inout) :: f_sum
        integer(flcl_view_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_2d( v_array_r32_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_2d
        real(flcl_view_r32_f_t), intent(inout) :: f_sum
        real(flcl_view_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_2d( v_array_r64_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_2d
        real(flcl_view_r64_f_t), intent(inout) :: f_sum
        real(flcl_view_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_3d( v_array_l_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_3d
        integer(flcl_view_index_f_t), intent(inout) :: f_sum
        integer(flcl_view_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_3d( v_array_i32_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_3d
        integer(flcl_view_i32_f_t), intent(inout) :: f_sum
        integer(flcl_view_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_3d( v_array_i64_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_3d
        integer(flcl_view_i64_f_t), intent(inout) :: f_sum
        integer(flcl_view_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_3d( v_array_r32_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_3d
        real(flcl_view_r32_f_t), intent(inout) :: f_sum
        real(flcl_view_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_3d( v_array_r64_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_3d
        real(flcl_view_r64_f_t), intent(inout) :: f_sum
        real(flcl_view_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_4d( v_array_l_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_4d
        integer(flcl_view_index_f_t), intent(inout) :: f_sum
        integer(flcl_view_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_4d( v_array_i32_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_4d
        integer(flcl_view_i32_f_t), intent(inout) :: f_sum
        integer(flcl_view_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_4d( v_array_i64_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_4d
        integer(flcl_view_i64_f_t), intent(inout) :: f_sum
        integer(flcl_view_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_4d( v_array_r32_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_4d
        real(flcl_view_r32_f_t), intent(inout) :: f_sum
        real(flcl_view_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_4d( v_array_r64_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_4d
        real(flcl_view_r64_f_t), intent(inout) :: f_sum
        real(flcl_view_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_5d( v_array_l_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_5d
        integer(flcl_view_index_f_t), intent(inout) :: f_sum
        integer(flcl_view_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_5d( v_array_i32_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_5d
        integer(flcl_view_i32_f_t), intent(inout) :: f_sum
        integer(flcl_view_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_5d( v_array_i64_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_5d
        integer(flcl_view_i64_f_t), intent(inout) :: f_sum
        integer(flcl_view_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_5d( v_array_r32_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_5d
        real(flcl_view_r32_f_t), intent(inout) :: f_sum
        real(flcl_view_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_5d( v_array_r64_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_5d
        real(flcl_view_r64_f_t), intent(inout) :: f_sum
        real(flcl_view_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_6d( v_array_l_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_6d
        integer(flcl_view_index_f_t), intent(inout) :: f_sum
        integer(flcl_view_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_6d( v_array_i32_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_6d
        integer(flcl_view_i32_f_t), intent(inout) :: f_sum
        integer(flcl_view_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_6d( v_array_i64_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_6d
        integer(flcl_view_i64_f_t), intent(inout) :: f_sum
        integer(flcl_view_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_6d( v_array_r32_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_6d
        real(flcl_view_r32_f_t), intent(inout) :: f_sum
        real(flcl_view_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_6d( v_array_r64_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_6d
        real(flcl_view_r64_f_t), intent(inout) :: f_sum
        real(flcl_view_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_l_7d( v_array_l_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_l_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_7d
        integer(flcl_view_index_f_t), intent(inout) :: f_sum
        integer(flcl_view_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_l_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i32_7d( v_array_i32_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_7d
        integer(flcl_view_i32_f_t), intent(inout) :: f_sum
        integer(flcl_view_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i32_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_i64_7d( v_array_i64_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_i64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_7d
        integer(flcl_view_i64_f_t), intent(inout) :: f_sum
        integer(flcl_view_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_i64_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r32_7d( v_array_r32_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_7d
        real(flcl_view_r32_f_t), intent(inout) :: f_sum
        real(flcl_view_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r32_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_view_r64_7d( v_array_r64_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_view_r64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_7d
        real(flcl_view_r64_f_t), intent(inout) :: f_sum
        real(flcl_view_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_view_r64_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_l_1d( v_array_l_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_l_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_1d
        integer(flcl_dualview_index_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_l_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i32_1d( v_array_i32_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_1d
        integer(flcl_dualview_i32_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i32_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i64_1d( v_array_i64_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_1d
        integer(flcl_dualview_i64_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i64_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r32_1d( v_array_r32_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r32_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_1d
        real(flcl_dualview_r32_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r32_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r64_1d( v_array_r64_1d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r64_1d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_1d
        real(flcl_dualview_r64_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r64_1d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_l_2d( v_array_l_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_l_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_2d
        integer(flcl_dualview_index_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_l_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i32_2d( v_array_i32_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_2d
        integer(flcl_dualview_i32_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i32_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i64_2d( v_array_i64_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_2d
        integer(flcl_dualview_i64_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i64_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r32_2d( v_array_r32_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r32_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_2d
        real(flcl_dualview_r32_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r32_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r64_2d( v_array_r64_2d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r64_2d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_2d
        real(flcl_dualview_r64_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r64_2d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_l_3d( v_array_l_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_l_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_3d
        integer(flcl_dualview_index_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_l_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i32_3d( v_array_i32_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_3d
        integer(flcl_dualview_i32_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i32_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i64_3d( v_array_i64_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_3d
        integer(flcl_dualview_i64_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i64_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r32_3d( v_array_r32_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r32_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_3d
        real(flcl_dualview_r32_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r32_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r64_3d( v_array_r64_3d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r64_3d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_3d
        real(flcl_dualview_r64_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r64_3d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_l_4d( v_array_l_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_l_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_4d
        integer(flcl_dualview_index_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_l_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i32_4d( v_array_i32_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_4d
        integer(flcl_dualview_i32_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i32_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i64_4d( v_array_i64_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_4d
        integer(flcl_dualview_i64_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i64_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r32_4d( v_array_r32_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r32_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_4d
        real(flcl_dualview_r32_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r32_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r64_4d( v_array_r64_4d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r64_4d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_4d
        real(flcl_dualview_r64_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r64_4d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_l_5d( v_array_l_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_l_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_5d
        integer(flcl_dualview_index_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_l_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i32_5d( v_array_i32_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_5d
        integer(flcl_dualview_i32_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i32_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i64_5d( v_array_i64_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_5d
        integer(flcl_dualview_i64_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i64_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r32_5d( v_array_r32_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r32_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_5d
        real(flcl_dualview_r32_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r32_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r64_5d( v_array_r64_5d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r64_5d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_5d
        real(flcl_dualview_r64_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r64_5d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_l_6d( v_array_l_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_l_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_6d
        integer(flcl_dualview_index_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_l_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i32_6d( v_array_i32_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_6d
        integer(flcl_dualview_i32_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i32_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i64_6d( v_array_i64_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_6d
        integer(flcl_dualview_i64_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i64_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r32_6d( v_array_r32_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r32_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_6d
        real(flcl_dualview_r32_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r32_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r64_6d( v_array_r64_6d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r64_6d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_6d
        real(flcl_dualview_r64_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r64_6d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_l_7d( v_array_l_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_l_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_l_7d
        integer(flcl_dualview_index_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_index_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_l_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i32_7d( v_array_i32_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i32_7d
        integer(flcl_dualview_i32_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i32_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_i64_7d( v_array_i64_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_i64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_i64_7d
        integer(flcl_dualview_i64_f_t), intent(inout) :: f_sum
        integer(flcl_dualview_i64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_i64_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r32_7d( v_array_r32_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r32_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r32_7d
        real(flcl_dualview_r32_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r32_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r32_7d
    end interface

    interface
      integer &
        & function f_test_kokkos_allocate_dualview_r64_7d( v_array_r64_7d, f_sum, c_sum ) &
        & bind(c, name='c_test_kokkos_allocate_dualview_r64_7d')
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        type(c_ptr), intent(in) :: v_array_r64_7d
        real(flcl_dualview_r64_f_t), intent(inout) :: f_sum
        real(flcl_dualview_r64_f_t), intent(inout) :: c_sum
      end function f_test_kokkos_allocate_dualview_r64_7d
    end interface

    contains

      integer &
        & function test_to_ndarray_l_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_ndarray_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:), allocatable :: array_l_1d
        integer :: ii
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        integer(flcl_ndarray_index_f_t) :: c_sum = e0_length
        integer(c_size_t) :: test_state_zero = flcl_test_fail
        integer(c_size_t) :: test_state_values = flcl_test_fail
        type(nd_array_t) :: zero_ndarray

        allocate( array_l_1d(0) )
        zero_ndarray = to_nd_array( array_l_1d )
        if ( .not.c_associated(zero_ndarray%data) ) then
          test_state_zero = flcl_test_pass
        end if
        deallocate( array_l_1d )

        allocate( array_l_1d(e0_length) )
        do ii = 1, e0_length
          array_l_1d(ii) = logical_pre
          if (array_l_1d(ii) .eqv. logical_pre) then
            f_sum = f_sum + 1
          end if
        end do
        c_sum = f_test_to_ndarray_l_1d( to_nd_array(array_l_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          if (array_l_1d(ii) .eqv. logical_post) then
            f_sum = f_sum + 1
          end if
        end do
        if (f_sum == c_sum) then
          test_state_values = flcl_test_pass
        end if
        if (  test_state_zero .eq. flcl_test_pass .and. &
            & test_state_values .eq. flcl_test_pass ) then
          write(*,*)'PASSED ndarray_l_1d'
          write(*,*)'test_state_zero = ',test_state_zero
          write(*,*)'test_state_values = ',test_state_values
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarry_l_1d'
          write(*,*)'test_state_zero = ',test_state_zero
          write(*,*)'test_state_values = ',test_state_values
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_l_1d

      integer &
        & function test_to_ndarray_i32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:), allocatable :: array_i32_1d
        integer :: ii
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        integer(flcl_ndarray_i32_f_t) :: c_sum = e0_length

        allocate( array_i32_1d(e0_length) )
        do ii = 1, e0_length
          array_i32_1d(ii) = ii
          f_sum = f_sum + array_i32_1d(ii)
        end do
        c_sum = f_test_to_ndarray_i32_1d( to_nd_array(array_i32_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_i32_1d(ii)
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i32_1d

      integer &
        & function test_to_ndarray_i64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:), allocatable :: array_i64_1d
        integer :: ii
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        integer(flcl_ndarray_i64_f_t) :: c_sum = e0_length

        allocate( array_i64_1d(e0_length) )
        do ii = 1, e0_length
          array_i64_1d(ii) = ii
          f_sum = f_sum + array_i64_1d(ii)
        end do
        c_sum = f_test_to_ndarray_i64_1d( to_nd_array(array_i64_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_i64_1d(ii)
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i64_1d

      integer &
        & function test_to_ndarray_r32_1d() &
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
        c_sum = f_test_to_ndarray_r32_1d( to_nd_array(array_r32_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_r32_1d(ii)
        end do
        if ( abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum) ) then
          write(*,*)'PASSED ndarray_r32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r32_1d
  
      integer &
        & function test_to_ndarray_r64_1d() &
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
        c_sum = f_test_to_ndarray_r64_1d( to_nd_array(array_r64_1d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          f_sum = f_sum + array_r64_1d(ii)
        end do
        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED ndarray_r64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r64_1d

      integer &
        & function test_to_ndarray_c32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_float_complex), dimension(:), allocatable :: array_c32_1d
        integer :: ii
        complex(c_float_complex) :: f_sum = (0,0)
        complex(c_float_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c32_1d(e0_length) )
        do ii = 1, e0_length
          array_c32_1d(ii) = cmplx(ii,-ii)
          f_sum = f_sum + array_c32_1d(ii)
        end do
        c_sum = f_test_to_ndarray_c32_1d( to_nd_array(array_c32_1d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          f_sum = f_sum + array_c32_1d(ii)
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c32_1d

      integer &
        & function test_to_ndarray_c64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_double_complex), dimension(:), allocatable :: array_c64_1d
        integer :: ii
        complex(c_double_complex) :: f_sum = (0,0)
        complex(c_double_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c64_1d(e0_length) )
        do ii = 1, e0_length
          array_c64_1d(ii) = cmplx(ii,-ii)
          f_sum = f_sum + array_c64_1d(ii)
        end do
        c_sum = f_test_to_ndarray_c64_1d( to_nd_array(array_c64_1d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          f_sum = f_sum + array_c64_1d(ii)
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c64_1d

      integer &
        & function test_to_ndarray_l_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:), allocatable :: array_l_2d
        integer :: ii, jj
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        integer(flcl_ndarray_index_f_t) :: c_sum = 0

        allocate( array_l_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj =1, e1_length
            array_l_2d(ii,jj) = logical_pre
            if (array_l_2d(ii,jj) .eqv. logical_pre) then
              f_sum = f_sum + 1
            end if
          end do
        end do
        c_sum = f_test_to_ndarray_l_2d( to_nd_array(array_l_2d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarry_l_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_l_2d
  
      integer &
        & function test_to_ndarray_i32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:), allocatable :: array_i32_2d
        integer :: ii, jj
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0

        allocate( array_i32_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i32_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_i32_2d(ii,jj)
          end do
        end do
        c_sum = f_test_to_ndarray_i32_2d( to_nd_array(array_i32_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_i32_2d(ii,jj)
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i32_2d

      integer &
        & function test_to_ndarray_i64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:), allocatable :: array_i64_2d
        integer :: ii, jj
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0

        allocate( array_i64_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i64_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_i64_2d(ii,jj)
          end do
        end do
        c_sum = f_test_to_ndarray_i64_2d( to_nd_array(array_i64_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_i64_2d(ii,jj)
          end do
        end do
        if ( f_sum .eq. c_sum ) then
          write(*,*)'PASSED ndarray_i64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i64_2d

      integer &
        & function test_to_ndarray_r32_2d() &
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
            array_r32_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_r32_2d(ii,jj)
          end do
        end do
        c_sum = f_test_to_ndarray_r32_2d( to_nd_array(array_r32_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_r32_2d(ii,jj)
          end do
        end do
        if ( abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum)) then
          write(*,*)'PASSED ndarray_r32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r32_2d
  
      integer &
        & function test_to_ndarray_r64_2d() &
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
            array_r64_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_r64_2d(ii,jj)
          end do
        end do
        c_sum = f_test_to_ndarray_r64_2d( to_nd_array(array_r64_2d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_r64_2d(ii,jj)
          end do
        end do
        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED ndarray_r64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r64_2d

      integer &
        & function test_to_ndarray_c32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_float_complex), dimension(:,:), allocatable :: array_c32_2d
        integer :: ii,jj
        complex(c_float_complex) :: f_sum = (0,0)
        complex(c_float_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c32_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_c32_2d(ii,jj) = cmplx(ii+jj,-(ii+jj))
            f_sum = f_sum + array_c32_2d(ii,jj)
          end do
        end do
        c_sum = f_test_to_ndarray_c32_2d( to_nd_array(array_c32_2d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_c32_2d(ii,jj)
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c32_2d

      integer &
        & function test_to_ndarray_c64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_double_complex), dimension(:,:), allocatable :: array_c64_2d
        integer :: ii,jj
        complex(c_double_complex) :: f_sum = (0,0)
        complex(c_double_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c64_2d(e0_length, e1_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_c64_2d(ii,jj) = cmplx(ii+jj,-(ii+jj))
            f_sum = f_sum + array_c64_2d(ii,jj)
          end do
        end do
        c_sum = f_test_to_ndarray_c64_2d( to_nd_array(array_c64_2d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            f_sum = f_sum + array_c64_2d(ii,jj)
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c64_2d

      integer & 
        & function test_to_ndarray_l_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:), allocatable :: array_l_3d
        integer :: ii, jj, kk
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        integer(flcl_ndarray_index_f_t) :: c_sum = 0

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
        c_sum = f_test_to_ndarray_l_3d( to_nd_array(array_l_3d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarry_l_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_l_3d
  
      integer &
        & function test_to_ndarray_i32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:), allocatable :: array_i32_3d
        integer :: ii, jj, kk
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0

        allocate( array_i32_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i32_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i32_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i32_3d( to_nd_array(array_i32_3d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i32_3d

      integer &
        & function test_to_ndarray_i64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:), allocatable :: array_i64_3d
        integer :: ii, jj, kk
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0

        allocate( array_i64_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i64_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i64_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i64_3d( to_nd_array(array_i64_3d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i64_3d

      integer &
        & function test_to_ndarray_r32_3d() &
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
              array_r32_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r32_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r32_3d( to_nd_array(array_r32_3d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_r32_3d(ii,jj,kk)
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum)) then
          write(*,*)'PASSED ndarray_r32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r32_3d
  
      integer &
        & function test_to_ndarray_r64_3d() &
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
              array_r64_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r64_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r64_3d( to_nd_array(array_r64_3d), f_sum )
        f_sum = 0
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_r64_3d(ii,jj,kk)
            end do
          end do
        end do
        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED ndarray_r64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r64_3d

      integer &
        & function test_to_ndarray_c32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_float_complex), dimension(:,:,:), allocatable :: array_c32_3d
        integer :: ii,jj,kk
        complex(c_float_complex) :: f_sum = (0,0)
        complex(c_float_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c32_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_c32_3d(ii,jj,kk) = cmplx(ii+jj+kk,-(ii+jj+kk))
              f_sum = f_sum + array_c32_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c32_3d( to_nd_array(array_c32_3d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_c32_3d(ii,jj,kk)
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c32_3d

      integer &
        & function test_to_ndarray_c64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_double_complex), dimension(:,:,:), allocatable :: array_c64_3d
        integer :: ii,jj,kk
        complex(c_double_complex) :: f_sum = (0,0)
        complex(c_double_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c64_3d(e0_length, e1_length, e2_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_c64_3d(ii,jj,kk) = cmplx(ii+jj+kk,-(ii+jj+kk))
              f_sum = f_sum + array_c64_3d(ii,jj,kk)
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c64_3d( to_nd_array(array_c64_3d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              f_sum = f_sum + array_c64_3d(ii,jj,kk)
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c64_3d

      integer &
        & function  test_to_ndarray_l_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:), allocatable :: array_l_4d
        integer :: ii, jj, kk, ll
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        integer(flcl_ndarray_index_f_t) :: c_sum = 0

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
        c_sum = f_test_to_ndarray_l_4d( to_nd_array(array_l_4d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarry_l_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_l_4d
  
      integer &
        & function  test_to_ndarray_i32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:), allocatable :: array_i32_4d
        integer :: ii, jj, kk, ll
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0

        allocate( array_i32_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i32_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i32_4d( to_nd_array(array_i32_4d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i32_4d

      integer &
        & function  test_to_ndarray_i64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:), allocatable :: array_i64_4d
        integer :: ii, jj, kk, ll
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0

        allocate( array_i64_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i64_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i64_4d( to_nd_array(array_i64_4d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i64_4d

      integer &
        & function  test_to_ndarray_r32_4d() &
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
                array_r32_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r32_4d( to_nd_array(array_r32_4d), f_sum )
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
        if ( abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum)) then
          write(*,*)'PASSED ndarray_r32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r32_4d
  
      integer &
        & function  test_to_ndarray_r64_4d() &
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
                array_r64_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r64_4d( to_nd_array(array_r64_4d), f_sum )
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
        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED ndarray_r64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r64_4d

      integer &
        & function test_to_ndarray_c32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_float_complex), dimension(:,:,:,:), allocatable :: array_c32_4d
        integer :: ii,jj,kk,ll
        complex(c_float_complex) :: f_sum = (0,0)
        complex(c_float_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c32_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_c32_4d(ii,jj,kk,ll) = cmplx(ii+jj+kk+ll,-(ii+jj+kk+ll))
                f_sum = f_sum + array_c32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c32_4d( to_nd_array(array_c32_4d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                f_sum = f_sum + array_c32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c32_4d

      integer &
        & function test_to_ndarray_c64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_double_complex), dimension(:,:,:,:), allocatable :: array_c64_4d
        integer :: ii,jj,kk,ll
        complex(c_double_complex) :: f_sum = (0,0)
        complex(c_double_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c64_4d(e0_length, e1_length, e2_length, e3_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_c64_4d(ii,jj,kk,ll) = cmplx(ii+jj+kk+ll,-(ii+jj+kk+ll))
                f_sum = f_sum + array_c64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c64_4d( to_nd_array(array_c64_4d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                f_sum = f_sum + array_c64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c64_4d

      integer &
        & function  test_to_ndarray_l_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:), allocatable :: array_l_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        integer(flcl_ndarray_index_f_t) :: c_sum = 0

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
        c_sum = f_test_to_ndarray_l_5d( to_nd_array(array_l_5d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarry_l_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_l_5d

      integer &
        & function  test_to_ndarray_i32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:), allocatable :: array_i32_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0

        allocate( array_i32_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i32_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i32_5d( to_nd_array(array_i32_5d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i32_5d

      integer &
        & function  test_to_ndarray_i64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:), allocatable :: array_i64_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0

        allocate( array_i64_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i64_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i64_5d( to_nd_array(array_i64_5d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i64_5d

      integer &
        & function  test_to_ndarray_r32_5d() &
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
                  array_r32_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r32_5d( to_nd_array(array_r32_5d), f_sum )
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
        if ( abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum)) then
          write(*,*)'PASSED ndarray_r32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          write(*,*)'abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum) = ', &
            & (abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum))
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r32_5d

      integer &
        & function  test_to_ndarray_r64_5d() &
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
                  array_r64_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r64_5d( to_nd_array(array_r64_5d), f_sum )
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
        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED ndarray_r64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r64_5d

      integer &
        & function test_to_ndarray_c32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_float_complex), dimension(:,:,:,:,:), allocatable :: array_c32_5d
        integer :: ii,jj,kk,ll,mm
        complex(c_float_complex) :: f_sum = (0,0)
        complex(c_float_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c32_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_c32_5d(ii,jj,kk,ll,mm) = cmplx(ii+jj+kk+ll+mm,-(ii+jj+kk+ll+mm))
                  f_sum = f_sum + array_c32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c32_5d( to_nd_array(array_c32_5d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  f_sum = f_sum + array_c32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c32_5d

      integer &
        & function test_to_ndarray_c64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_double_complex), dimension(:,:,:,:,:), allocatable :: array_c64_5d
        integer :: ii,jj,kk,ll,mm
        complex(c_double_complex) :: f_sum = (0,0)
        complex(c_double_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c64_5d(e0_length, e1_length, e2_length, e3_length, e4_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_c64_5d(ii,jj,kk,ll,mm) = cmplx(ii+jj+kk+ll+mm,-(ii+jj+kk+ll+mm))
                  f_sum = f_sum + array_c64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c64_5d( to_nd_array(array_c64_5d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  f_sum = f_sum + array_c64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c64_5d

      integer &
        & function  test_to_ndarray_l_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:,:), allocatable :: array_l_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        integer(flcl_ndarray_index_f_t) :: c_sum = 0

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
        c_sum = f_test_to_ndarray_l_6d( to_nd_array(array_l_6d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarry_l_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_l_6d

      integer &
        & function  test_to_ndarray_i32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:,:), allocatable :: array_i32_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0

        allocate( array_i32_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i32_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_i32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i32_6d( to_nd_array(array_i32_6d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i32_6d

      integer &
        & function  test_to_ndarray_i64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:,:), allocatable :: array_i64_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0

        allocate( array_i64_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i64_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_i64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i64_6d( to_nd_array(array_i64_6d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i64_6d

      integer &
        & function  test_to_ndarray_r32_6d() &
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
                    array_r32_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r32_6d(ii,jj,kk,ll,mm,nn)
                    ! write(*,*)'f_sum1 ',f_sum
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r32_6d( to_nd_array(array_r32_6d), f_sum )
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
        if ( abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum)) then
          write(*,*)'PASSED ndarray_r32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          write(*,*)'abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum) = ', &
            & (abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum))
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r32_6d

      integer &
        & function  test_to_ndarray_r64_6d() &
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
                    array_r64_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r64_6d( to_nd_array(array_r64_6d), f_sum )
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
        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED ndarray_r64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r64_6d

      integer &
        & function test_to_ndarray_c32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_float_complex), dimension(:,:,:,:,:,:), allocatable :: array_c32_6d
        integer :: ii,jj,kk,ll,mm,nn
        complex(c_float_complex) :: f_sum = (0,0)
        complex(c_float_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c32_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_c32_6d(ii,jj,kk,ll,mm,nn) = cmplx(ii+jj+kk+ll+mm+nn,-(ii+jj+kk+ll+mm+nn))
                    f_sum = f_sum + array_c32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c32_6d( to_nd_array(array_c32_6d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    f_sum = f_sum + array_c32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c32_6d

      integer &
        & function test_to_ndarray_c64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_double_complex), dimension(:,:,:,:,:,:), allocatable :: array_c64_6d
        integer :: ii,jj,kk,ll,mm,nn
        complex(c_double_complex) :: f_sum = (0,0)
        complex(c_double_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c64_6d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_c64_6d(ii,jj,kk,ll,mm,nn) = cmplx(ii+jj+kk+ll+mm+nn,-(ii+jj+kk+ll+mm+nn))
                    f_sum = f_sum + array_c64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c64_6d( to_nd_array(array_c64_6d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    f_sum = f_sum + array_c64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c64_6d

      integer &
        & function  test_to_ndarray_l_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_l_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        integer(flcl_ndarray_index_f_t) :: c_sum = 0

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
        c_sum = f_test_to_ndarray_l_7d( to_nd_array(array_l_7d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarry_l_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_l_7d

      integer &
        & function  test_to_ndarray_i32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_i32_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0

        allocate( array_i32_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i32_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i32_7d( to_nd_array(array_i32_7d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i32_7d

      integer &
        & function  test_to_ndarray_i64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_i64_7d
        integer :: ii, jj, kk, ll, mm, nn,oo
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0

        allocate( array_i64_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i64_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_i64_7d( to_nd_array(array_i64_7d), f_sum )
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
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_i64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_i64_7d

      integer &
        & function  test_to_ndarray_r32_7d() &
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
                      array_r32_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r32_7d( to_nd_array(array_r32_7d), f_sum )
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
        if ( abs(f_sum - c_sum ) < (ndarray_precision_single * c_sum)) then
          write(*,*)'PASSED ndarray_r32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r32_7d

      integer &
        & function  test_to_ndarray_r64_7d() &
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
                      array_r64_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_r64_7d( to_nd_array(array_r64_7d), f_sum )
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
        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED ndarray_r64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_r64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_r64_7d

      integer &
        & function test_to_ndarray_c32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_float_complex), dimension(:,:,:,:,:,:,:), allocatable :: array_c32_7d
        integer :: ii,jj,kk,ll,mm,nn,oo
        complex(c_float_complex) :: f_sum = (0,0)
        complex(c_float_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c32_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_c32_7d(ii,jj,kk,ll,mm,nn,oo) = cmplx(ii+jj+kk+ll+mm+nn+oo,-(ii+jj+kk+ll+mm+nn+oo))
                      f_sum = f_sum + array_c32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c32_7d( to_nd_array(array_c32_7d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      f_sum = f_sum + array_c32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c32_7d

      integer &
        & function test_to_ndarray_c64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(c_double_complex), dimension(:,:,:,:,:,:,:), allocatable :: array_c64_7d
        integer :: ii,jj,kk,ll,mm,nn,oo
        complex(c_double_complex) :: f_sum = (0,0)
        complex(c_double_complex) :: c_sum = (e0_length, e0_length)

        allocate( array_c64_7d(e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length) )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_c64_7d(ii,jj,kk,ll,mm,nn,oo) = cmplx(ii+jj+kk+ll+mm+nn+oo,-(ii+jj+kk+ll+mm+nn+oo))
                      f_sum = f_sum + array_c64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        c_sum = f_test_to_ndarray_c64_7d( to_nd_array(array_c64_7d), f_sum )
        f_sum = (0,0)
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      f_sum = f_sum + array_c64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED ndarray_c64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F ndarray_c64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_to_ndarray_c64_7d

      integer &
        & function test_from_ndarray_l_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:), allocatable :: array_l_1d_in
        logical(flcl_ndarray_l_f_t), dimension(:), pointer :: array_l_1d_out
        integer(flcl_ndarray_index_f_t) :: c_sum = 0
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii

        allocate( array_l_1d_in(e0_length) )
        allocate( array_l_1d_out(e0_length) )

        do ii = 1, e0_length
          array_l_1d_in(ii) = logical_pre
          if (array_l_1d_in(ii) .eqv. logical_pre) then
            f_sum = f_sum + 1
          end if
        end do

        nd_array_out = f_test_from_ndarray_l_1d( to_nd_array(array_l_1d_in) )

        call from_nd_array( nd_array_out, array_l_1d_out )

        do ii = 1, e0_length
          if (array_l_1d_out(ii) .eqv. logical_pre) then
            c_sum = c_sum + 1
          end if
        end do

        if ( f_sum == c_sum ) then
          write(*,*)'PASSED from_ndarray_l_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_l_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_l_1d

      integer &
        & function test_from_ndarray_i32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:), allocatable :: array_i32_1d_in
        integer(flcl_ndarray_i32_f_t), dimension(:), pointer :: array_i32_1d_out
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii

        allocate( array_i32_1d_in(e0_length) )
        allocate( array_i32_1d_out(e0_length) )

        do ii = 1, e0_length
          array_i32_1d_in(ii) = ii
          f_sum = f_sum + array_i32_1d_in(ii)
        end do

        nd_array_out = f_test_from_ndarray_i32_1d( to_nd_array(array_i32_1d_in) )

        call from_nd_array( nd_array_out, array_i32_1d_out )

        do ii = 1, e0_length
          c_sum = c_sum + array_i32_1d_out(ii)
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i32_1d

      integer &
        & function test_from_ndarray_i64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:), allocatable :: array_i64_1d_in
        integer(flcl_ndarray_i64_f_t), dimension(:), pointer :: array_i64_1d_out
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii

        allocate( array_i64_1d_in(e0_length) )
        allocate( array_i64_1d_out(e0_length) )

        do ii = 1, e0_length
          array_i64_1d_in(ii) = ii
          f_sum = f_sum + array_i64_1d_in(ii)
        end do

        nd_array_out = f_test_from_ndarray_i64_1d( to_nd_array(array_i64_1d_in) )

        call from_nd_array( nd_array_out, array_i64_1d_out )

        do ii = 1, e0_length
          c_sum = c_sum + array_i64_1d_out(ii)
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i64_1d

      integer &
        & function test_from_ndarray_r32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r32_f_t), dimension(:), allocatable :: array_r32_1d_in
        real(flcl_ndarray_r32_f_t), dimension(:), pointer :: array_r32_1d_out
        real(flcl_ndarray_r32_f_t) :: c_sum = 0
        real(flcl_ndarray_r32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii

        allocate( array_r32_1d_in(e0_length) )
        allocate( array_r32_1d_out(e0_length) )

        do ii = 1, e0_length
          array_r32_1d_in(ii) = ii
          f_sum = f_sum + array_r32_1d_in(ii)
        end do

        nd_array_out = f_test_from_ndarray_r32_1d( to_nd_array(array_r32_1d_in) )

        call from_nd_array( nd_array_out, array_r32_1d_out )

        do ii = 1, e0_length
          c_sum = c_sum + array_r32_1d_out(ii)
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r32_1d

      integer &
        & function test_from_ndarray_r64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r64_f_t), dimension(:), allocatable :: array_r64_1d_in
        real(flcl_ndarray_r64_f_t), dimension(:), pointer :: array_r64_1d_out
        real(flcl_ndarray_r64_f_t) :: c_sum = 0
        real(flcl_ndarray_r64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii

        allocate( array_r64_1d_in(e0_length) )
        allocate( array_r64_1d_out(e0_length) )

        do ii = 1, e0_length
          array_r64_1d_in(ii) = ii
          f_sum = f_sum + array_r64_1d_in(ii)
        end do

        nd_array_out = f_test_from_ndarray_r64_1d( to_nd_array(array_r64_1d_in) )

        call from_nd_array( nd_array_out, array_r64_1d_out )

        do ii = 1, e0_length
          c_sum = c_sum + array_r64_1d_out(ii)
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r64_1d

      integer &
        & function test_from_ndarray_c32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c32_f_t), dimension(:), allocatable :: array_c32_1d_in
        complex(flcl_ndarray_c32_f_t), dimension(:), pointer :: array_c32_1d_out
        complex(flcl_ndarray_c32_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c32_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii

        allocate( array_c32_1d_in(e0_length) )
        allocate( array_c32_1d_out(e0_length) )

        do ii = 1, e0_length
          array_c32_1d_in(ii) = cmplx(ii,-ii)
          f_sum = f_sum + array_c32_1d_in(ii)
        end do

        nd_array_out = f_test_from_ndarray_c32_1d( to_nd_array(array_c32_1d_in) )

        call from_nd_array( nd_array_out, array_c32_1d_out )

        do ii = 1, e0_length
          c_sum = c_sum + array_c32_1d_out(ii)
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c32_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c32_1d

      integer &
        & function test_from_ndarray_c64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c64_f_t), dimension(:), allocatable :: array_c64_1d_in
        complex(flcl_ndarray_c64_f_t), dimension(:), pointer :: array_c64_1d_out
        complex(flcl_ndarray_c64_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c64_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii

        allocate( array_c64_1d_in(e0_length) )
        allocate( array_c64_1d_out(e0_length) )

        do ii = 1, e0_length
          array_c64_1d_in(ii) = cmplx(ii,-ii)
          f_sum = f_sum + array_c64_1d_in(ii)
        end do

        nd_array_out = f_test_from_ndarray_c64_1d( to_nd_array(array_c64_1d_in) )

        call from_nd_array( nd_array_out, array_c64_1d_out )

        do ii = 1, e0_length
          c_sum = c_sum + array_c64_1d_out(ii)
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c64_1d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c64_1d

      integer &
        & function test_from_ndarray_l_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:), allocatable :: array_l_2d_in
        logical(flcl_ndarray_l_f_t), dimension(:,:), pointer :: array_l_2d_out
        integer(flcl_ndarray_index_f_t) :: c_sum = 0
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj

        allocate( array_l_2d_in(e0_length, e1_length) )
        allocate( array_l_2d_out(e0_length, e1_length) )

        do ii = 1, e0_length
          do jj =1, e1_length
            array_l_2d_in(ii,jj) = logical_pre
            if (array_l_2d_in(ii,jj) .eqv. logical_pre) then
              f_sum = f_sum + 1
            end if
          end do
        end do

        nd_array_out = f_test_from_ndarray_l_2d( to_nd_array(array_l_2d_in) )

        call from_nd_array( nd_array_out, array_l_2d_out )

        do ii = 1, e0_length
          do jj =1, e1_length
            if (array_l_2d_out(ii,jj) .eqv. logical_pre) then
              c_sum = c_sum + 1
            end if
          end do
        end do

        if ( f_sum == c_sum ) then
          write(*,*)'PASSED from_ndarray_l_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_l_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_l_2d

      integer &
        & function test_from_ndarray_i32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:), allocatable :: array_i32_2d_in
        integer(flcl_ndarray_i32_f_t), dimension(:,:), pointer :: array_i32_2d_out
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj

        allocate( array_i32_2d_in(e0_length, e1_length) )
        allocate( array_i32_2d_out(e0_length, e1_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i32_2d_in(ii,jj) = ii+jj
            f_sum = f_sum + array_i32_2d_in(ii,jj)
          end do
        end do

        nd_array_out = f_test_from_ndarray_i32_2d( to_nd_array(array_i32_2d_in) )

        call from_nd_array( nd_array_out, array_i32_2d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            c_sum = c_sum + array_i32_2d_out(ii,jj)
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i32_2d

      integer &
        & function test_from_ndarray_i64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:), allocatable :: array_i64_2d_in
        integer(flcl_ndarray_i64_f_t), dimension(:,:), pointer :: array_i64_2d_out
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj

        allocate( array_i64_2d_in(e0_length, e1_length) )
        allocate( array_i64_2d_out(e0_length, e1_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i64_2d_in(ii,jj) = ii+jj
            f_sum = f_sum + array_i64_2d_in(ii,jj)
          end do
        end do

        nd_array_out = f_test_from_ndarray_i64_2d( to_nd_array(array_i64_2d_in) )

        call from_nd_array( nd_array_out, array_i64_2d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            c_sum = c_sum + array_i64_2d_out(ii,jj)
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i64_2d

      integer &
        & function test_from_ndarray_r32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r32_f_t), dimension(:,:), allocatable :: array_r32_2d_in
        real(flcl_ndarray_r32_f_t), dimension(:,:), pointer :: array_r32_2d_out
        real(flcl_ndarray_r32_f_t) :: c_sum = 0
        real(flcl_ndarray_r32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj

        allocate( array_r32_2d_in(e0_length, e1_length) )
        allocate( array_r32_2d_out(e0_length, e1_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r32_2d_in(ii,jj) = ii+jj
            f_sum = f_sum + array_r32_2d_in(ii,jj)
          end do
        end do

        nd_array_out = f_test_from_ndarray_r32_2d( to_nd_array(array_r32_2d_in) )

        call from_nd_array( nd_array_out, array_r32_2d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            c_sum = c_sum + array_r32_2d_out(ii,jj)
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r32_2d

      integer &
        & function test_from_ndarray_r64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r64_f_t), dimension(:,:), allocatable :: array_r64_2d_in
        real(flcl_ndarray_r64_f_t), dimension(:,:), pointer :: array_r64_2d_out
        real(flcl_ndarray_r64_f_t) :: c_sum = 0
        real(flcl_ndarray_r64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj

        allocate( array_r64_2d_in(e0_length, e1_length) )
        allocate( array_r64_2d_out(e0_length, e1_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r64_2d_in(ii,jj) = ii+jj
            f_sum = f_sum + array_r64_2d_in(ii,jj)
          end do
        end do

        nd_array_out = f_test_from_ndarray_r64_2d( to_nd_array(array_r64_2d_in) )

        call from_nd_array( nd_array_out, array_r64_2d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            c_sum = c_sum + array_r64_2d_out(ii,jj)
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r64_2d

      integer &
        & function test_from_ndarray_c32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c32_f_t), dimension(:,:), allocatable :: array_c32_2d_in
        complex(flcl_ndarray_c32_f_t), dimension(:,:), pointer :: array_c32_2d_out
        complex(flcl_ndarray_c32_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c32_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj

        allocate( array_c32_2d_in(e0_length, e1_length) )
        allocate( array_c32_2d_out(e0_length, e1_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            array_c32_2d_in(ii,jj) = cmplx(ii+jj,-(ii+jj))
            f_sum = f_sum + array_c32_2d_in(ii,jj)
          end do
        end do

        nd_array_out = f_test_from_ndarray_c32_2d( to_nd_array(array_c32_2d_in) )

        call from_nd_array( nd_array_out, array_c32_2d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            c_sum = c_sum + array_c32_2d_out(ii,jj)
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c32_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c32_2d

      integer &
        & function test_from_ndarray_c64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c64_f_t), dimension(:,:), allocatable :: array_c64_2d_in
        complex(flcl_ndarray_c64_f_t), dimension(:,:), pointer :: array_c64_2d_out
        complex(flcl_ndarray_c64_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c64_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj

        allocate( array_c64_2d_in(e0_length, e1_length) )
        allocate( array_c64_2d_out(e0_length, e1_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            array_c64_2d_in(ii,jj) = cmplx(ii+jj,-(ii+jj))
            f_sum = f_sum + array_c64_2d_in(ii,jj)
          end do
        end do

        nd_array_out = f_test_from_ndarray_c64_2d( to_nd_array(array_c64_2d_in) )

        call from_nd_array( nd_array_out, array_c64_2d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            c_sum = c_sum + array_c64_2d_out(ii,jj)
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c64_2d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c64_2d

      integer &
        & function test_from_ndarray_l_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:), allocatable :: array_l_3d_in
        logical(flcl_ndarray_l_f_t), dimension(:,:,:), pointer :: array_l_3d_out
        integer(flcl_ndarray_index_f_t) :: c_sum = 0
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk

        allocate( array_l_3d_in(e0_length, e1_length, e2_length) )
        allocate( array_l_3d_out(e0_length, e1_length, e2_length) )

        do ii = 1, e0_length
          do jj =1 , e1_length
            do kk = 1, e2_length
              array_l_3d_in(ii,jj,kk) = logical_pre
              if (array_l_3d_in(ii,jj,kk) .eqv. logical_pre) then
                f_sum = f_sum + 1
              end if
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_l_3d( to_nd_array(array_l_3d_in) )

        call from_nd_array( nd_array_out, array_l_3d_out )

        do ii = 1, e0_length
          do jj =1, e1_length
            do kk = 1, e2_length
              if (array_l_3d_out(ii,jj,kk) .eqv. logical_pre) then
                c_sum = c_sum + 1
              end if
            end do
          end do
        end do

        if ( f_sum == c_sum ) then
          write(*,*)'PASSED from_ndarray_l_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_l_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_l_3d

      integer &
        & function test_from_ndarray_i32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:), allocatable :: array_i32_3d_in
        integer(flcl_ndarray_i32_f_t), dimension(:,:,:), pointer :: array_i32_3d_out
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk

        allocate( array_i32_3d_in(e0_length, e1_length, e2_length) )
        allocate( array_i32_3d_out(e0_length, e1_length, e2_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i32_3d_in(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i32_3d_in(ii,jj,kk)
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i32_3d( to_nd_array(array_i32_3d_in) )

        call from_nd_array( nd_array_out, array_i32_3d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              c_sum = c_sum + array_i32_3d_out(ii,jj,kk)
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i32_3d

      integer &
        & function test_from_ndarray_i64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:), allocatable :: array_i64_3d_in
        integer(flcl_ndarray_i64_f_t), dimension(:,:,:), pointer :: array_i64_3d_out
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk

        allocate( array_i64_3d_in(e0_length, e1_length, e2_length) )
        allocate( array_i64_3d_out(e0_length, e1_length, e2_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i64_3d_in(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i64_3d_in(ii,jj,kk)
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i64_3d( to_nd_array(array_i64_3d_in) )

        call from_nd_array( nd_array_out, array_i64_3d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              c_sum = c_sum + array_i64_3d_out(ii,jj,kk)
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i64_3d

      integer &
        & function test_from_ndarray_r32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r32_f_t), dimension(:,:,:), allocatable :: array_r32_3d_in
        real(flcl_ndarray_r32_f_t), dimension(:,:,:), pointer :: array_r32_3d_out
        real(flcl_ndarray_r32_f_t) :: c_sum = 0
        real(flcl_ndarray_r32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk

        allocate( array_r32_3d_in(e0_length, e1_length, e2_length) )
        allocate( array_r32_3d_out(e0_length, e1_length, e2_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r32_3d_in(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r32_3d_in(ii,jj,kk)
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r32_3d( to_nd_array(array_r32_3d_in) )

        call from_nd_array( nd_array_out, array_r32_3d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              c_sum = c_sum + array_r32_3d_out(ii,jj,kk)
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r32_3d

      integer &
        & function test_from_ndarray_r64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r64_f_t), dimension(:,:,:), allocatable :: array_r64_3d_in
        real(flcl_ndarray_r64_f_t), dimension(:,:,:), pointer :: array_r64_3d_out
        real(flcl_ndarray_r64_f_t) :: c_sum = 0
        real(flcl_ndarray_r64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk

        allocate( array_r64_3d_in(e0_length, e1_length, e2_length) )
        allocate( array_r64_3d_out(e0_length, e1_length, e2_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r64_3d_in(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r64_3d_in(ii,jj,kk)
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r64_3d( to_nd_array(array_r64_3d_in) )

        call from_nd_array( nd_array_out, array_r64_3d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              c_sum = c_sum + array_r64_3d_out(ii,jj,kk)
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r64_3d

      integer &
        & function test_from_ndarray_c32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c32_f_t), dimension(:,:,:), allocatable :: array_c32_3d_in
        complex(flcl_ndarray_c32_f_t), dimension(:,:,:), pointer :: array_c32_3d_out
        complex(flcl_ndarray_c32_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c32_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk

        allocate( array_c32_3d_in(e0_length, e1_length, e2_length) )
        allocate( array_c32_3d_out(e0_length, e1_length, e2_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_c32_3d_in(ii,jj,kk) = cmplx(ii+jj+kk,-(ii+jj+kk))
              f_sum = f_sum + array_c32_3d_in(ii,jj,kk)
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c32_3d( to_nd_array(array_c32_3d_in) )

        call from_nd_array( nd_array_out, array_c32_3d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              c_sum = c_sum + array_c32_3d_out(ii,jj,kk)
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c32_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c32_3d

      integer &
        & function test_from_ndarray_c64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c64_f_t), dimension(:,:,:), allocatable :: array_c64_3d_in
        complex(flcl_ndarray_c64_f_t), dimension(:,:,:), pointer :: array_c64_3d_out
        complex(flcl_ndarray_c64_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c64_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk

        allocate( array_c64_3d_in(e0_length, e1_length, e2_length) )
        allocate( array_c64_3d_out(e0_length, e1_length, e2_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_c64_3d_in(ii,jj,kk) = cmplx(ii+jj+kk,-(ii+jj+kk))
              f_sum = f_sum + array_c64_3d_in(ii,jj,kk)
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c64_3d( to_nd_array(array_c64_3d_in) )

        call from_nd_array( nd_array_out, array_c64_3d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              c_sum = c_sum + array_c64_3d_out(ii,jj,kk)
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c64_3d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c64_3d

      integer &
        & function test_from_ndarray_l_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:), allocatable :: array_l_4d_in
        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:), pointer :: array_l_4d_out
        integer(flcl_ndarray_index_f_t) :: c_sum = 0
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll

        allocate( array_l_4d_in(e0_length, e1_length, e2_length, e3_length) )
        allocate( array_l_4d_out(e0_length, e1_length, e2_length, e3_length) )

        do ii = 1, e0_length
          do jj =1 , e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_l_4d_in(ii,jj,kk,ll) = logical_pre
                if (array_l_4d_in(ii,jj,kk,ll) .eqv. logical_pre) then
                  f_sum = f_sum + 1
                end if
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_l_4d( to_nd_array(array_l_4d_in) )

        call from_nd_array( nd_array_out, array_l_4d_out )

        do ii = 1, e0_length
          do jj =1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                if (array_l_4d_out(ii,jj,kk,ll) .eqv. logical_pre) then
                  c_sum = c_sum + 1
                end if
              end do
            end do
          end do
        end do

        if ( f_sum == c_sum ) then
          write(*,*)'PASSED from_ndarray_l_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_l_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_l_4d

      integer &
        & function test_from_ndarray_i32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:), allocatable :: array_i32_4d_in
        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:), pointer :: array_i32_4d_out
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll

        allocate( array_i32_4d_in(e0_length, e1_length, e2_length, e3_length) )
        allocate( array_i32_4d_out(e0_length, e1_length, e2_length, e3_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i32_4d_in(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i32_4d_in(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i32_4d( to_nd_array(array_i32_4d_in) )

        call from_nd_array( nd_array_out, array_i32_4d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                c_sum = c_sum + array_i32_4d_out(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i32_4d

      integer &
        & function test_from_ndarray_i64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:), allocatable :: array_i64_4d_in
        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:), pointer :: array_i64_4d_out
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll

        allocate( array_i64_4d_in(e0_length, e1_length, e2_length, e3_length) )
        allocate( array_i64_4d_out(e0_length, e1_length, e2_length, e3_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i64_4d_in(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i64_4d_in(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i64_4d( to_nd_array(array_i64_4d_in) )

        call from_nd_array( nd_array_out, array_i64_4d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                c_sum = c_sum + array_i64_4d_out(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i64_4d

      integer &
        & function test_from_ndarray_r32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:), allocatable :: array_r32_4d_in
        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:), pointer :: array_r32_4d_out
        real(flcl_ndarray_r32_f_t) :: c_sum = 0
        real(flcl_ndarray_r32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll

        allocate( array_r32_4d_in(e0_length, e1_length, e2_length, e3_length) )
        allocate( array_r32_4d_out(e0_length, e1_length, e2_length, e3_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r32_4d_in(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r32_4d_in(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r32_4d( to_nd_array(array_r32_4d_in) )

        call from_nd_array( nd_array_out, array_r32_4d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                c_sum = c_sum + array_r32_4d_out(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r32_4d

      integer &
        & function test_from_ndarray_r64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:), allocatable :: array_r64_4d_in
        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:), pointer :: array_r64_4d_out
        real(flcl_ndarray_r64_f_t) :: c_sum = 0
        real(flcl_ndarray_r64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll

        allocate( array_r64_4d_in(e0_length, e1_length, e2_length, e3_length) )
        allocate( array_r64_4d_out(e0_length, e1_length, e2_length, e3_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r64_4d_in(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r64_4d_in(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r64_4d( to_nd_array(array_r64_4d_in) )

        call from_nd_array( nd_array_out, array_r64_4d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                c_sum = c_sum + array_r64_4d_out(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r64_4d

      integer &
        & function test_from_ndarray_c32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:), allocatable :: array_c32_4d_in
        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:), pointer :: array_c32_4d_out
        complex(flcl_ndarray_c32_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c32_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll

        allocate( array_c32_4d_in(e0_length, e1_length, e2_length, e3_length) )
        allocate( array_c32_4d_out(e0_length, e1_length, e2_length, e3_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_c32_4d_in(ii,jj,kk,ll) = cmplx(ii+jj+kk+ll,-(ii+jj+kk+ll))
                f_sum = f_sum + array_c32_4d_in(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c32_4d( to_nd_array(array_c32_4d_in) )

        call from_nd_array( nd_array_out, array_c32_4d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                c_sum = c_sum + array_c32_4d_out(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c32_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c32_4d

      integer &
        & function test_from_ndarray_c64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:), allocatable :: array_c64_4d_in
        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:), pointer :: array_c64_4d_out
        complex(flcl_ndarray_c64_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c64_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll

        allocate( array_c64_4d_in(e0_length, e1_length, e2_length, e3_length) )
        allocate( array_c64_4d_out(e0_length, e1_length, e2_length, e3_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_c64_4d_in(ii,jj,kk,ll) = cmplx(ii+jj+kk+ll,-(ii+jj+kk+ll))
                f_sum = f_sum + array_c64_4d_in(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c64_4d( to_nd_array(array_c64_4d_in) )

        call from_nd_array( nd_array_out, array_c64_4d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                c_sum = c_sum + array_c64_4d_out(ii,jj,kk,ll)
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c64_4d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c64_4d

      integer &
        & function test_from_ndarray_l_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:), allocatable :: array_l_5d_in
        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:), pointer :: array_l_5d_out
        integer(flcl_ndarray_index_f_t) :: c_sum = 0
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm

        allocate( array_l_5d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )
        allocate( array_l_5d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )

        do ii = 1, e0_length
          do jj = 1 , e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_l_5d_in(ii,jj,kk,ll,mm) = logical_pre
                  if (array_l_5d_in(ii,jj,kk,ll,mm) .eqv. logical_pre) then
                    f_sum = f_sum + 1
                  end if
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_l_5d( to_nd_array(array_l_5d_in) )

        call from_nd_array( nd_array_out, array_l_5d_out )

        do ii = 1, e0_length
          do jj =1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  if (array_l_5d_out(ii,jj,kk,ll,mm) .eqv. logical_pre) then
                    c_sum = c_sum + 1
                  end if
                end do
              end do
            end do
          end do
        end do

        if ( f_sum == c_sum ) then
          write(*,*)'PASSED from_ndarray_l_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_l_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_l_5d

      integer &
        & function test_from_ndarray_i32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:), allocatable :: array_i32_5d_in
        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:), pointer :: array_i32_5d_out
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm

        allocate( array_i32_5d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )
        allocate( array_i32_5d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i32_5d_in(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i32_5d_in(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i32_5d( to_nd_array(array_i32_5d_in) )

        call from_nd_array( nd_array_out, array_i32_5d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  c_sum = c_sum + array_i32_5d_out(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i32_5d

      integer &
        & function test_from_ndarray_i64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:), allocatable :: array_i64_5d_in
        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:), pointer :: array_i64_5d_out
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm

        allocate( array_i64_5d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )
        allocate( array_i64_5d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i64_5d_in(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i64_5d_in(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i64_5d( to_nd_array(array_i64_5d_in) )

        call from_nd_array( nd_array_out, array_i64_5d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  c_sum = c_sum + array_i64_5d_out(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i64_5d

      integer &
        & function test_from_ndarray_r32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:,:), allocatable :: array_r32_5d_in
        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:,:), pointer :: array_r32_5d_out
        real(flcl_ndarray_r32_f_t) :: c_sum = 0
        real(flcl_ndarray_r32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm

        allocate( array_r32_5d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )
        allocate( array_r32_5d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r32_5d_in(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r32_5d_in(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r32_5d( to_nd_array(array_r32_5d_in) )

        call from_nd_array( nd_array_out, array_r32_5d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  c_sum = c_sum + array_r32_5d_out(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r32_5d

      integer &
        & function test_from_ndarray_r64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:,:), allocatable :: array_r64_5d_in
        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:,:), pointer :: array_r64_5d_out
        real(flcl_ndarray_r64_f_t) :: c_sum = 0
        real(flcl_ndarray_r64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm

        allocate( array_r64_5d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )
        allocate( array_r64_5d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r64_5d_in(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r64_5d_in(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r64_5d( to_nd_array(array_r64_5d_in) )

        call from_nd_array( nd_array_out, array_r64_5d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  c_sum = c_sum + array_r64_5d_out(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r64_5d

      integer &
        & function test_from_ndarray_c32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:,:), allocatable :: array_c32_5d_in
        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:,:), pointer :: array_c32_5d_out
        complex(flcl_ndarray_c32_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c32_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm

        allocate( array_c32_5d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )
        allocate( array_c32_5d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_c32_5d_in(ii,jj,kk,ll,mm) = cmplx(ii+jj+kk+ll+mm,-(ii+jj+kk+ll+mm))
                  f_sum = f_sum + array_c32_5d_in(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c32_5d( to_nd_array(array_c32_5d_in) )

        call from_nd_array( nd_array_out, array_c32_5d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  c_sum = c_sum + array_c32_5d_out(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c32_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c32_5d

      integer &
        & function test_from_ndarray_c64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:,:), allocatable :: array_c64_5d_in
        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:,:), pointer :: array_c64_5d_out
        complex(flcl_ndarray_c64_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c64_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm

        allocate( array_c64_5d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )
        allocate( array_c64_5d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_c64_5d_in(ii,jj,kk,ll,mm) = cmplx(ii+jj+kk+ll+mm,-(ii+jj+kk+ll+mm))
                  f_sum = f_sum + array_c64_5d_in(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c64_5d( to_nd_array(array_c64_5d_in) )

        call from_nd_array( nd_array_out, array_c64_5d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  c_sum = c_sum + array_c64_5d_out(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c64_5d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c64_5d

      integer &
        & function test_from_ndarray_l_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:,:), allocatable :: array_l_6d_in
        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:,:), pointer :: array_l_6d_out
        integer(flcl_ndarray_index_f_t) :: c_sum = 0
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn

        allocate( array_l_6d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )
        allocate( array_l_6d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )

        do ii = 1, e0_length
          do jj = 1 , e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_l_6d_in(ii,jj,kk,ll,mm,nn) = logical_pre
                    if (array_l_6d_in(ii,jj,kk,ll,mm,nn) .eqv. logical_pre) then
                      f_sum = f_sum + 1
                    end if
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_l_6d( to_nd_array(array_l_6d_in) )

        call from_nd_array( nd_array_out, array_l_6d_out )

        do ii = 1, e0_length
          do jj =1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    if (array_l_6d_out(ii,jj,kk,ll,mm,nn) .eqv. logical_pre) then
                      c_sum = c_sum + 1
                    end if
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( f_sum == c_sum ) then
          write(*,*)'PASSED from_ndarray_l_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_l_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_l_6d

      integer &
        & function test_from_ndarray_i32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:,:), allocatable :: array_i32_6d_in
        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:,:), pointer :: array_i32_6d_out
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn

        allocate( array_i32_6d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )
        allocate( array_i32_6d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i32_6d_in(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_i32_6d_in(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i32_6d( to_nd_array(array_i32_6d_in) )

        call from_nd_array( nd_array_out, array_i32_6d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    c_sum = c_sum + array_i32_6d_out(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i32_6d

      integer &
        & function test_from_ndarray_i64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:,:), allocatable :: array_i64_6d_in
        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:,:), pointer :: array_i64_6d_out
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn

        allocate( array_i64_6d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )
        allocate( array_i64_6d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i64_6d_in(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_i64_6d_in(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i64_6d( to_nd_array(array_i64_6d_in) )

        call from_nd_array( nd_array_out, array_i64_6d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    c_sum = c_sum + array_i64_6d_out(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i64_6d

      integer &
        & function test_from_ndarray_r32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:,:,:), allocatable :: array_r32_6d_in
        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:,:,:), pointer :: array_r32_6d_out
        real(flcl_ndarray_r32_f_t) :: c_sum = 0
        real(flcl_ndarray_r32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn

        allocate( array_r32_6d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )
        allocate( array_r32_6d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r32_6d_in(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r32_6d_in(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r32_6d( to_nd_array(array_r32_6d_in) )

        call from_nd_array( nd_array_out, array_r32_6d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    c_sum = c_sum + array_r32_6d_out(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r32_6d

      integer &
        & function test_from_ndarray_r64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:,:,:), allocatable :: array_r64_6d_in
        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:,:,:), pointer :: array_r64_6d_out
        real(flcl_ndarray_r64_f_t) :: c_sum = 0
        real(flcl_ndarray_r64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn

        allocate( array_r64_6d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )
        allocate( array_r64_6d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r64_6d_in(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r64_6d_in(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r64_6d( to_nd_array(array_r64_6d_in) )

        call from_nd_array( nd_array_out, array_r64_6d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    c_sum = c_sum + array_r64_6d_out(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r64_6d

      integer &
        & function test_from_ndarray_c32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:,:,:), allocatable :: array_c32_6d_in
        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:,:,:), pointer :: array_c32_6d_out
        complex(flcl_ndarray_c32_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c32_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn

        allocate( array_c32_6d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )
        allocate( array_c32_6d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_c32_6d_in(ii,jj,kk,ll,mm,nn) = cmplx(ii+jj+kk+ll+mm+nn,-(ii+jj+kk+ll+mm+nn))
                    f_sum = f_sum + array_c32_6d_in(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c32_6d( to_nd_array(array_c32_6d_in) )

        call from_nd_array( nd_array_out, array_c32_6d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    c_sum = c_sum + array_c32_6d_out(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c32_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c32_6d

      integer &
        & function test_from_ndarray_c64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:,:,:), allocatable :: array_c64_6d_in
        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:,:,:), pointer :: array_c64_6d_out
        complex(flcl_ndarray_c64_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c64_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn

        allocate( array_c64_6d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )
        allocate( array_c64_6d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_c64_6d_in(ii,jj,kk,ll,mm,nn) = cmplx(ii+jj+kk+ll+mm+nn,-(ii+jj+kk+ll+mm+nn))
                    f_sum = f_sum + array_c64_6d_in(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c64_6d( to_nd_array(array_c64_6d_in) )

        call from_nd_array( nd_array_out, array_c64_6d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    c_sum = c_sum + array_c64_6d_out(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c64_6d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c64_6d

      integer &
        & function test_from_ndarray_l_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_l_7d_in
        logical(flcl_ndarray_l_f_t), dimension(:,:,:,:,:,:,:), pointer :: array_l_7d_out
        integer(flcl_ndarray_index_f_t) :: c_sum = 0
        integer(flcl_ndarray_index_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn, oo

        allocate( array_l_7d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )
        allocate( array_l_7d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )

        do ii = 1, e0_length
          do jj = 1 , e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_l_7d_in(ii,jj,kk,ll,mm,nn,oo) = logical_pre
                      if (array_l_7d_in(ii,jj,kk,ll,mm,nn,oo) .eqv. logical_pre) then
                        f_sum = f_sum + 1
                      end if
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_l_7d( to_nd_array(array_l_7d_in) )

        call from_nd_array( nd_array_out, array_l_7d_out )

        do ii = 1, e0_length
          do jj =1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      if (array_l_7d_out(ii,jj,kk,ll,mm,nn,oo) .eqv. logical_pre) then
                        c_sum = c_sum + 1
                      end if
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( f_sum == c_sum ) then
          write(*,*)'PASSED from_ndarray_l_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_l_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_l_7d

      integer &
        & function test_from_ndarray_i32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_i32_7d_in
        integer(flcl_ndarray_i32_f_t), dimension(:,:,:,:,:,:,:), pointer :: array_i32_7d_out
        integer(flcl_ndarray_i32_f_t) :: c_sum = 0
        integer(flcl_ndarray_i32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn, oo

        allocate( array_i32_7d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )
        allocate( array_i32_7d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i32_7d_in(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i32_7d_in(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i32_7d( to_nd_array(array_i32_7d_in) )

        call from_nd_array( nd_array_out, array_i32_7d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      c_sum = c_sum + array_i32_7d_out(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i32_7d

      integer &
        & function test_from_ndarray_i64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_i64_7d_in
        integer(flcl_ndarray_i64_f_t), dimension(:,:,:,:,:,:,:), pointer :: array_i64_7d_out
        integer(flcl_ndarray_i64_f_t) :: c_sum = 0
        integer(flcl_ndarray_i64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn, oo

        allocate( array_i64_7d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )
        allocate( array_i64_7d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i64_7d_in(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i64_7d_in(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_i64_7d( to_nd_array(array_i64_7d_in) )

        call from_nd_array( nd_array_out, array_i64_7d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      c_sum = c_sum + array_i64_7d_out(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_i64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_i64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_i64_7d

      integer &
        & function test_from_ndarray_r32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_r32_7d_in
        real(flcl_ndarray_r32_f_t), dimension(:,:,:,:,:,:,:), pointer :: array_r32_7d_out
        real(flcl_ndarray_r32_f_t) :: c_sum = 0
        real(flcl_ndarray_r32_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn, oo

        allocate( array_r32_7d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )
        allocate( array_r32_7d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r32_7d_in(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r32_7d_in(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r32_7d( to_nd_array(array_r32_7d_in) )

        call from_nd_array( nd_array_out, array_r32_7d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      c_sum = c_sum + array_r32_7d_out(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r32_7d

      integer &
        & function test_from_ndarray_r64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_r64_7d_in
        real(flcl_ndarray_r64_f_t), dimension(:,:,:,:,:,:,:), pointer :: array_r64_7d_out
        real(flcl_ndarray_r64_f_t) :: c_sum = 0
        real(flcl_ndarray_r64_f_t) :: f_sum = 0
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn, oo

        allocate( array_r64_7d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )
        allocate( array_r64_7d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r64_7d_in(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r64_7d_in(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_r64_7d( to_nd_array(array_r64_7d_in) )

        call from_nd_array( nd_array_out, array_r64_7d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      c_sum = c_sum + array_r64_7d_out(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        if ( abs(f_sum - c_sum ) < ndarray_precision_single * c_sum ) then
          write(*,*)'PASSED from_ndarray_r64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_r64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_r64_7d

      integer &
        & function test_from_ndarray_c32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_c32_7d_in
        complex(flcl_ndarray_c32_f_t), dimension(:,:,:,:,:,:,:), pointer :: array_c32_7d_out
        complex(flcl_ndarray_c32_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c32_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn, oo

        allocate( array_c32_7d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )
        allocate( array_c32_7d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_c32_7d_in(ii,jj,kk,ll,mm,nn,oo) = cmplx(ii+jj+kk+ll+mm+nn+oo,-(ii+jj+kk+ll+mm+nn+oo))
                      f_sum = f_sum + array_c32_7d_in(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c32_7d( to_nd_array(array_c32_7d_in) )

        call from_nd_array( nd_array_out, array_c32_7d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      c_sum = c_sum + array_c32_7d_out(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c32_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c32_7d

      integer &
        & function test_from_ndarray_c64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:,:,:,:), allocatable :: array_c64_7d_in
        complex(flcl_ndarray_c64_f_t), dimension(:,:,:,:,:,:,:), pointer :: array_c64_7d_out
        complex(flcl_ndarray_c64_f_t) :: c_sum = (0,0)
        complex(flcl_ndarray_c64_f_t) :: f_sum = (0,0)
        type(nd_array_t) :: nd_array_out
        integer :: ii, jj, kk, ll, mm, nn, oo

        allocate( array_c64_7d_in(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )
        allocate( array_c64_7d_out(e0_length, e1_length, e2_length, e3_length, &
                  & e4_length, e5_length, e6_length) )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_c64_7d_in(ii,jj,kk,ll,mm,nn,oo) = cmplx(ii+jj+kk+ll+mm+nn+oo,-(ii+jj+kk+ll+mm+nn+oo))
                      f_sum = f_sum + array_c64_7d_in(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        nd_array_out = f_test_from_ndarray_c64_7d( to_nd_array(array_c64_7d_in) )

        call from_nd_array( nd_array_out, array_c64_7d_out )

        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      c_sum = c_sum + array_c64_7d_out(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do

        if (FLCL_REALPART(f_sum) - FLCL_REALPART(c_sum) > ndarray_precision_single * FLCL_REALPART(f_sum) .or. &
          & FLCL_IMAGPART(f_sum) - FLCL_IMAGPART(c_sum) > ndarray_precision_single * FLCL_IMAGPART(f_sum) ) then
          write(*,*)'PASSED from_ndarray_c64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_pass
        else
          write(*,*)'FAILED F from_ndarray_c64_7d'
          write(*,*)'f_sum = ',f_sum
          write(*,*)'c_sum = ',c_sum
          ierr = flcl_test_fail
        end if
      end function test_from_ndarray_c64_7d

      integer &
        & function test_kokkos_allocate_view_l_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_view_mod
        implicit none

        logical(flcl_view_l_f_t), pointer, dimension(:)  :: array_l_1d
        type(view_l_1d_t) :: v_array_l_1d
        integer :: ii
        integer(flcl_view_index_f_t) :: f_sum = 0
        integer(flcl_view_index_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_1d, v_array_l_1d, 'array_l_1d', e0_length )
        do ii = 1, e0_length
          array_l_1d(ii) = logical_pre
          if (array_l_1d(ii) .eqv. logical_pre) then
            f_sum = f_sum + 1
          end if
        end do
        ierr = f_test_kokkos_allocate_view_l_1d( v_array_l_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            if (array_l_1d(ii) .eqv. logical_post) then
              f_sum = f_sum + 1
            end if
          end do
  
          if (f_sum == c_sum) then
            write(*,*)'PASSED kokkos_allocate_view_l_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_l_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_l_1d, v_array_l_1d )
      end function test_kokkos_allocate_view_l_1d

      integer &
        & function test_kokkos_allocate_view_i32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i32_f_t), pointer, dimension(:)  :: array_i32_1d
        type(view_i32_1d_t) :: v_array_i32_1d
        integer :: ii
        integer(flcl_view_i32_f_t) :: f_sum = 0
        integer(flcl_view_i32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_1d, v_array_i32_1d, 'array_i32_1d', e0_length )
        do ii = 1, e0_length
          array_i32_1d(ii) = ii
          f_sum = f_sum + array_i32_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_i32_1d( v_array_i32_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_i32_1d(ii)
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i32_1d, v_array_i32_1d )
      end function test_kokkos_allocate_view_i32_1d

      integer &
        & function test_kokkos_allocate_view_i64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i64_f_t), pointer, dimension(:)  :: array_i64_1d
        type(view_i64_1d_t) :: v_array_i64_1d
        integer :: ii
        integer(flcl_view_i64_f_t) :: f_sum = 0
        integer(flcl_view_i64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_1d, v_array_i64_1d, 'array_i64_1d', e0_length )
        do ii = 1, e0_length
          array_i64_1d(ii) = ii
          f_sum = f_sum + array_i64_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_i64_1d( v_array_i64_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_i64_1d(ii)
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i64_1d, v_array_i64_1d )
      end function test_kokkos_allocate_view_i64_1d

      integer &
        & function test_kokkos_allocate_view_r32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r32_f_t), pointer, dimension(:)  :: array_r32_1d
        type(view_r32_1d_t) :: v_array_r32_1d
        integer :: ii
        real(flcl_view_r32_f_t) :: f_sum = 0
        real(flcl_view_r32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r32_1d, v_array_r32_1d, 'array_r32_1d', e0_length )
        do ii = 1, e0_length
          array_r32_1d(ii) = ii
          f_sum = f_sum + array_r32_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_r32_1d( v_array_r32_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_r32_1d(ii)
          end do
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r32_1d, v_array_r32_1d )
      end function test_kokkos_allocate_view_r32_1d

      integer &
        & function test_kokkos_allocate_view_r64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r64_f_t), pointer, dimension(:)  :: array_r64_1d
        type(view_r64_1d_t) :: v_array_r64_1d
        integer :: ii
        real(flcl_view_r64_f_t) :: f_sum = 0
        real(flcl_view_r64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r64_1d, v_array_r64_1d, 'array_r64_1d', e0_length )
        do ii = 1, e0_length
          array_r64_1d(ii) = ii
          f_sum = f_sum + array_r64_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_view_r64_1d( v_array_r64_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_r64_1d(ii)
          end do
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r64_1d, v_array_r64_1d )
      end function test_kokkos_allocate_view_r64_1d

      integer &
        & function test_kokkos_allocate_view_l_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_view_l_f_t), pointer, dimension(:,:)  :: array_l_2d
        type(view_l_2d_t) :: v_array_l_2d
        integer :: ii, jj
        integer(flcl_view_index_f_t) :: f_sum = 0
        integer(flcl_view_index_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_2d, v_array_l_2d, 'array_l_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_l_2d(ii,jj) = logical_pre
            if (array_l_2d(ii,jj) .eqv. logical_pre) then
              f_sum = f_sum + 1
            end if
          end do
        end do
        ierr = f_test_kokkos_allocate_view_l_2d( v_array_l_2d%ptr(), f_sum, c_sum )
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
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_l_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_l_2d, v_array_l_2d )
      end function test_kokkos_allocate_view_l_2d

      integer &
        & function test_kokkos_allocate_view_i32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i32_f_t), pointer, dimension(:,:)  :: array_i32_2d
        type(view_i32_2d_t) :: v_array_i32_2d
        integer :: ii, jj
        integer(flcl_view_i32_f_t) :: f_sum = 0
        integer(flcl_view_i32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_2d, v_array_i32_2d, 'array_i32_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i32_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_i32_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_2d( v_array_i32_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_i32_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i32_2d, v_array_i32_2d )
      end function test_kokkos_allocate_view_i32_2d

      integer &
        & function test_kokkos_allocate_view_i64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i64_f_t), pointer, dimension(:,:)  :: array_i64_2d
        type(view_i64_2d_t) :: v_array_i64_2d
        integer :: ii, jj
        integer(flcl_view_i64_f_t) :: f_sum = 0
        integer(flcl_view_i64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_2d, v_array_i64_2d, 'array_i64_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i64_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_i64_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_2d( v_array_i64_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_i64_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_view_i64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i64_2d, v_array_i64_2d )
      end function test_kokkos_allocate_view_i64_2d

      integer &
        & function test_kokkos_allocate_view_r32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r32_f_t), pointer, dimension(:,:)  :: array_r32_2d
        type(view_r32_2d_t) :: v_array_r32_2d
        integer :: ii, jj
        real(flcl_view_r32_f_t) :: f_sum = 0
        real(flcl_view_r32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r32_2d, v_array_r32_2d, 'array_r32_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r32_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_r32_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_2d( v_array_r32_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_r32_2d(ii,jj)
            end do
          end do
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r32_2d, v_array_r32_2d )
      end function test_kokkos_allocate_view_r32_2d

      integer &
        & function test_kokkos_allocate_view_r64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r64_f_t), pointer, dimension(:,:)  :: array_r64_2d
        type(view_r64_2d_t) :: v_array_r64_2d
        integer :: ii, jj
        real(flcl_view_r64_f_t) :: f_sum = 0
        real(flcl_view_r64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r64_2d, v_array_r64_2d, 'array_r64_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r64_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_r64_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_2d( v_array_r64_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_r64_2d(ii,jj)
            end do
          end do
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r64_2d, v_array_r64_2d )
      end function test_kokkos_allocate_view_r64_2d

      integer &
        & function test_kokkos_allocate_view_l_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_view_l_f_t), pointer, dimension(:,:,:)  :: array_l_3d
        type(view_l_3d_t) :: v_array_l_3d
        integer :: ii, jj, kk
        integer(flcl_view_index_f_t) :: f_sum = 0
        integer(flcl_view_index_f_t) :: c_sum = 0

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
        ierr = f_test_kokkos_allocate_view_l_3d( v_array_l_3d%ptr(), f_sum, c_sum )
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
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_l_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_l_3d, v_array_l_3d )
      end function test_kokkos_allocate_view_l_3d

      integer &
        & function test_kokkos_allocate_view_i32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i32_f_t), pointer, dimension(:,:,:)  :: array_i32_3d
        type(view_i32_3d_t) :: v_array_i32_3d
        integer :: ii, jj, kk
        integer(flcl_view_i32_f_t) :: f_sum = 0
        integer(flcl_view_i32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_3d, v_array_i32_3d, 'array_i32_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i32_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i32_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_3d( v_array_i32_3d%ptr(), f_sum, c_sum )
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
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i32_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i32_3d, v_array_i32_3d )
      end function test_kokkos_allocate_view_i32_3d

      integer &
        & function test_kokkos_allocate_view_i64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i64_f_t), pointer, dimension(:,:,:)  :: array_i64_3d
        type(view_i64_3d_t) :: v_array_i64_3d
        integer :: ii, jj, kk
        integer(flcl_view_i64_f_t) :: f_sum = 0
        integer(flcl_view_i64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_3d, v_array_i64_3d, 'array_i64_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i64_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i64_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_3d( v_array_i64_3d%ptr(), f_sum, c_sum )
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
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i64_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i64_3d, v_array_i64_3d )
      end function test_kokkos_allocate_view_i64_3d

      integer &
        & function test_kokkos_allocate_view_r32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r32_f_t), pointer, dimension(:,:,:)  :: array_r32_3d
        type(view_r32_3d_t) :: v_array_r32_3d
        integer :: ii, jj, kk
        real(flcl_view_r32_f_t) :: f_sum = 0
        real(flcl_view_r32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r32_3d, v_array_r32_3d, 'array_r32_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r32_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r32_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_3d( v_array_r32_3d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_r32_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r32_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r32_3d, v_array_r32_3d )
      end function test_kokkos_allocate_view_r32_3d

      integer &
        & function test_kokkos_allocate_view_r64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r64_f_t), pointer, dimension(:,:,:)  :: array_r64_3d
        type(view_r64_3d_t) :: v_array_r64_3d
        integer :: ii, jj, kk
        real(flcl_view_r64_f_t) :: f_sum = 0
        real(flcl_view_r64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r64_3d, v_array_r64_3d, 'array_r64_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r64_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r64_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_3d( v_array_r64_3d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_r64_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r64_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r64_3d, v_array_r64_3d )
      end function test_kokkos_allocate_view_r64_3d

      integer &
        & function test_kokkos_allocate_view_l_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_view_l_f_t), pointer, dimension(:,:,:,:)  :: array_l_4d
        type(view_l_4d_t) :: v_array_l_4d
        integer :: ii, jj, kk, ll
        integer(flcl_view_index_f_t) :: f_sum = 0
        integer(flcl_view_index_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_4d, v_array_l_4d, 'array_l_4d', e0_length, e1_length, e2_length, e3_length )
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
        ierr = f_test_kokkos_allocate_view_l_4d( v_array_l_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_l_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_l_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_l_4d, v_array_l_4d )
      end function test_kokkos_allocate_view_l_4d

      integer &
        & function test_kokkos_allocate_view_i32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i32_f_t), pointer, dimension(:,:,:,:)  :: array_i32_4d
        type(view_i32_4d_t) :: v_array_i32_4d
        integer :: ii, jj, kk, ll
        integer(flcl_view_i32_f_t) :: f_sum = 0
        integer(flcl_view_i32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_4d, v_array_i32_4d, 'array_i32_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i32_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_4d( v_array_i32_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i32_4d, v_array_i32_4d )
      end function test_kokkos_allocate_view_i32_4d

      integer &
        & function test_kokkos_allocate_view_i64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i64_f_t), pointer, dimension(:,:,:,:)  :: array_i64_4d
        type(view_i64_4d_t) :: v_array_i64_4d
        integer :: ii, jj, kk, ll
        integer(flcl_view_i64_f_t) :: f_sum = 0
        integer(flcl_view_i64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_4d, v_array_i64_4d, 'array_i64_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i64_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_4d( v_array_i64_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i64_4d, v_array_i64_4d )
      end function test_kokkos_allocate_view_i64_4d

      integer &
        & function test_kokkos_allocate_view_r32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r32_f_t), pointer, dimension(:,:,:,:)  :: array_r32_4d
        type(view_r32_4d_t) :: v_array_r32_4d
        integer :: ii, jj, kk, ll
        real(flcl_view_r32_f_t) :: f_sum = 0
        real(flcl_view_r32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r32_4d, v_array_r32_4d, 'array_r32_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r32_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_4d( v_array_r32_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r32_4d, v_array_r32_4d )
      end function test_kokkos_allocate_view_r32_4d

      integer &
        & function test_kokkos_allocate_view_r64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r64_f_t), pointer, dimension(:,:,:,:)  :: array_r64_4d
        type(view_r64_4d_t) :: v_array_r64_4d
        integer :: ii, jj, kk, ll
        real(flcl_view_r64_f_t) :: f_sum = 0
        real(flcl_view_r64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r64_4d, v_array_r64_4d, 'array_r64_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r64_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_4d( v_array_r64_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r64_4d, v_array_r64_4d )
      end function test_kokkos_allocate_view_r64_4d

      integer &
        & function test_kokkos_allocate_view_l_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_view_l_f_t), pointer, dimension(:,:,:,:,:)  :: array_l_5d
        type(view_l_5d_t) :: v_array_l_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_view_index_f_t) :: f_sum = 0
        integer(flcl_view_index_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_5d, v_array_l_5d, 'array_l_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
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
        ierr = f_test_kokkos_allocate_view_l_5d( v_array_l_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_l_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_l_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_l_5d, v_array_l_5d )
      end function test_kokkos_allocate_view_l_5d

      integer &
        & function test_kokkos_allocate_view_i32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i32_f_t), pointer, dimension(:,:,:,:,:)  :: array_i32_5d
        type(view_i32_5d_t) :: v_array_i32_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_view_i32_f_t) :: f_sum = 0
        integer(flcl_view_i32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_5d, v_array_i32_5d, 'array_i32_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i32_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_5d( v_array_i32_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i32_5d, v_array_i32_5d )
      end function test_kokkos_allocate_view_i32_5d

      integer &
        & function test_kokkos_allocate_view_i64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i64_f_t), pointer, dimension(:,:,:,:,:)  :: array_i64_5d
        type(view_i64_5d_t) :: v_array_i64_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_view_i64_f_t) :: f_sum = 0
        integer(flcl_view_i64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_5d, v_array_i64_5d, 'array_i64_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i64_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_5d( v_array_i64_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i64_5d, v_array_i64_5d )
      end function test_kokkos_allocate_view_i64_5d

      integer &
        & function test_kokkos_allocate_view_r32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r32_f_t), pointer, dimension(:,:,:,:,:)  :: array_r32_5d
        type(view_r32_5d_t) :: v_array_r32_5d
        integer :: ii, jj, kk, ll, mm
        real(flcl_view_r32_f_t) :: f_sum = 0
        real(flcl_view_r32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r32_5d, v_array_r32_5d, 'array_r32_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r32_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_5d( v_array_r32_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r32_5d, v_array_r32_5d )
      end function test_kokkos_allocate_view_r32_5d

      integer &
        & function test_kokkos_allocate_view_r64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r64_f_t), pointer, dimension(:,:,:,:,:)  :: array_r64_5d
        type(view_r64_5d_t) :: v_array_r64_5d
        integer :: ii, jj, kk, ll, mm
        real(flcl_view_r64_f_t) :: f_sum = 0
        real(flcl_view_r64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r64_5d, v_array_r64_5d, 'array_r64_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r64_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_5d( v_array_r64_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r64_5d, v_array_r64_5d )
      end function test_kokkos_allocate_view_r64_5d

      integer &
        & function test_kokkos_allocate_view_l_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_view_l_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_l_6d
        type(view_l_6d_t) :: v_array_l_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_view_index_f_t) :: f_sum = 0
        integer(flcl_view_index_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_6d, v_array_l_6d, 'array_l_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
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
        ierr = f_test_kokkos_allocate_view_l_6d( v_array_l_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_l_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_l_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_l_6d, v_array_l_6d )
      end function test_kokkos_allocate_view_l_6d

      integer &
        & function test_kokkos_allocate_view_i32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i32_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_i32_6d
        type(view_i32_6d_t) :: v_array_i32_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_view_i32_f_t) :: f_sum = 0
        integer(flcl_view_i32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_6d, v_array_i32_6d, 'array_i32_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i32_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_i32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_6d( v_array_i32_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i32_6d, v_array_i32_6d )
      end function test_kokkos_allocate_view_i32_6d

      integer &
        & function test_kokkos_allocate_view_i64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i64_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_i64_6d
        type(view_i64_6d_t) :: v_array_i64_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_view_i64_f_t) :: f_sum = 0
        integer(flcl_view_i64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_6d, v_array_i64_6d, 'array_i64_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                      array_i64_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                      f_sum = f_sum + array_i64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_6d( v_array_i64_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i64_6d, v_array_i64_6d )
      end function test_kokkos_allocate_view_i64_6d

      integer &
        & function test_kokkos_allocate_view_r32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r32_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_r32_6d
        type(view_r32_6d_t) :: v_array_r32_6d
        integer :: ii, jj, kk, ll, mm, nn
        real(flcl_view_r32_f_t) :: f_sum = 0
        real(flcl_view_r32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r32_6d, v_array_r32_6d, 'array_r32_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r32_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_6d( v_array_r32_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r32_6d, v_array_r32_6d )
      end function test_kokkos_allocate_view_r32_6d

      integer &
        & function test_kokkos_allocate_view_r64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r64_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_r64_6d
        type(view_r64_6d_t) :: v_array_r64_6d
        integer :: ii, jj, kk, ll, mm, nn
        real(flcl_view_r64_f_t) :: f_sum = 0
        real(flcl_view_r64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r64_6d, v_array_r64_6d, 'array_r64_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r64_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_6d( v_array_r64_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r64_6d, v_array_r64_6d )
      end function test_kokkos_allocate_view_r64_6d

      integer &
        & function test_kokkos_allocate_view_l_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_view_l_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_l_7d
        type(view_l_7d_t) :: v_array_l_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_view_index_f_t) :: f_sum = 0
        integer(flcl_view_index_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_l_7d, v_array_l_7d, 'array_l_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
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
        ierr = f_test_kokkos_allocate_view_l_7d( v_array_l_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_l_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_l_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_l_7d, v_array_l_7d )
      end function test_kokkos_allocate_view_l_7d

      integer &
        & function test_kokkos_allocate_view_i32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i32_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_i32_7d
        type(view_i32_7d_t) :: v_array_i32_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_view_i32_f_t) :: f_sum = 0
        integer(flcl_view_i32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i32_7d, v_array_i32_7d, 'array_i32_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i32_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i32_7d( v_array_i32_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i32_7d, v_array_i32_7d )
      end function test_kokkos_allocate_view_i32_7d

      integer &
        & function test_kokkos_allocate_view_i64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_view_i64_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_i64_7d
        type(view_i64_7d_t) :: v_array_i64_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_view_i64_f_t) :: f_sum = 0
        integer(flcl_view_i64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_i64_7d, v_array_i64_7d, 'array_i64_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i64_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_i64_7d( v_array_i64_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_view_i64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_i64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_i64_7d, v_array_i64_7d )
      end function test_kokkos_allocate_view_i64_7d

      integer &
        & function test_kokkos_allocate_view_r32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r32_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_r32_7d
        type(view_r32_7d_t) :: v_array_r32_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        real(flcl_view_r32_f_t) :: f_sum = 0
        real(flcl_view_r32_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r32_7d, v_array_r32_7d, 'array_r32_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r32_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r32_7d( v_array_r32_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r32_7d, v_array_r32_7d )
      end function test_kokkos_allocate_view_r32_7d

      integer &
        & function test_kokkos_allocate_view_r64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_view_r64_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_r64_7d
        type(view_r64_7d_t) :: v_array_r64_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        real(flcl_view_r64_f_t) :: f_sum = 0
        real(flcl_view_r64_f_t) :: c_sum = 0

        call kokkos_allocate_view( array_r64_7d, v_array_r64_7d, 'array_r64_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r64_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_view_r64_7d( v_array_r64_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (view_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_view_r64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_view_r64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_view( array_r64_7d, v_array_r64_7d )
      end function test_kokkos_allocate_view_r64_7d

      integer &
        & function test_kokkos_allocate_dualview_l_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_view_mod
        implicit none

        logical(flcl_dualview_l_f_t), pointer, dimension(:)  :: array_l_1d
        type(dualview_l_1d_t) :: v_array_l_1d
        integer :: ii
        integer(flcl_dualview_index_f_t) :: f_sum = 0
        integer(flcl_dualview_index_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_l_1d, v_array_l_1d, 'array_l_1d', e0_length )
        do ii = 1, e0_length
          array_l_1d(ii) = logical_pre
          if (array_l_1d(ii) .eqv. logical_pre) then
            f_sum = f_sum + 1
          end if
        end do
        ierr = f_test_kokkos_allocate_dualview_l_1d( v_array_l_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            if (array_l_1d(ii) .eqv. logical_post) then
              f_sum = f_sum + 1
            end if
          end do
  
          if (f_sum == c_sum) then
            write(*,*)'PASSED kokkos_allocate_dualview_l_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_l_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_l_1d, v_array_l_1d )
      end function test_kokkos_allocate_dualview_l_1d

      integer &
        & function test_kokkos_allocate_dualview_i32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_view_mod
        implicit none

        integer(flcl_dualview_i32_f_t), pointer, dimension(:)  :: array_i32_1d
        type(dualview_i32_1d_t) :: v_array_i32_1d
        integer :: ii
        integer(flcl_dualview_i32_f_t) :: f_sum = 0
        integer(flcl_dualview_i32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i32_1d, v_array_i32_1d, 'array_i32_1d', e0_length )
        do ii = 1, e0_length
          array_i32_1d(ii) = ii
          f_sum = f_sum + array_i32_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_dualview_i32_1d( v_array_i32_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_i32_1d(ii)
          end do
          if (f_sum == c_sum) then
            write(*,*)'PASSED kokkos_allocate_dualview_i32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i32_1d, v_array_i32_1d )
      end function test_kokkos_allocate_dualview_i32_1d

      integer &
        & function test_kokkos_allocate_dualview_i64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i64_f_t), pointer, dimension(:)  :: array_i64_1d
        type(dualview_i64_1d_t) :: v_array_i64_1d
        integer :: ii
        integer(flcl_dualview_i64_f_t) :: f_sum = 0
        integer(flcl_dualview_i64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i64_1d, v_array_i64_1d, 'array_i64_1d', e0_length )
        do ii = 1, e0_length
          array_i64_1d(ii) = ii
          f_sum = f_sum + array_i64_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_dualview_i64_1d( v_array_i64_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_i64_1d(ii)
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_dualview_i64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dual_view_i64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i64_1d, v_array_i64_1d )
      end function test_kokkos_allocate_dualview_i64_1d

      integer &
        & function test_kokkos_allocate_dualview_r32_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r32_f_t), pointer, dimension(:)  :: array_r32_1d
        type(dualview_r32_1d_t) :: v_array_r32_1d
        integer :: ii
        real(flcl_dualview_r32_f_t) :: f_sum = 0
        real(flcl_dualview_r32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r32_1d, v_array_r32_1d, 'array_r32_1d', e0_length )
        do ii = 1, e0_length
          array_r32_1d(ii) = ii
          f_sum = f_sum + array_r32_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_dualview_r32_1d( v_array_r32_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_r32_1d(ii)
          end do
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r32_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r32_1d, v_array_r32_1d )
      end function test_kokkos_allocate_dualview_r32_1d

      integer &
        & function test_kokkos_allocate_dualview_r64_1d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r64_f_t), pointer, dimension(:)  :: array_r64_1d
        type(dualview_r64_1d_t) :: v_array_r64_1d
        integer :: ii
        real(flcl_dualview_r64_f_t) :: f_sum = 0
        real(flcl_dualview_r64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r64_1d, v_array_r64_1d, 'array_r64_1d', e0_length )
        do ii = 1, e0_length
          array_r64_1d(ii) = ii
          f_sum = f_sum + array_r64_1d(ii)
        end do
        ierr = f_test_kokkos_allocate_dualview_r64_1d( v_array_r64_1d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            f_sum = f_sum + array_r64_1d(ii)
          end do
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r64_1d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r64_1d, v_array_r64_1d )
      end function test_kokkos_allocate_dualview_r64_1d

      integer &
        & function test_kokkos_allocate_dualview_l_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_dualview_l_f_t), pointer, dimension(:,:)  :: array_l_2d
        type(dualview_l_2d_t) :: v_array_l_2d
        integer :: ii, jj
        integer(flcl_dualview_index_f_t) :: f_sum = 0
        integer(flcl_dualview_index_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_l_2d, v_array_l_2d, 'array_l_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_l_2d(ii,jj) = logical_pre
            if (array_l_2d(ii,jj) .eqv. logical_pre) then
              f_sum = f_sum + 1
            end if
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_l_2d( v_array_l_2d%ptr(), f_sum, c_sum )
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
            write(*,*)'PASSED kokkos_allocate_dualview_l_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_l_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_l_2d, v_array_l_2d )
      end function test_kokkos_allocate_dualview_l_2d

      integer &
        & function test_kokkos_allocate_dualview_i32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i32_f_t), pointer, dimension(:,:)  :: array_i32_2d
        type(dualview_i32_2d_t) :: v_array_i32_2d
        integer :: ii, jj
        integer(flcl_dualview_i32_f_t) :: f_sum = 0
        integer(flcl_dualview_i32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i32_2d, v_array_i32_2d, 'array_i32_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i32_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_i32_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i32_2d( v_array_i32_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_i32_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_dualview_i32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i32_2d, v_array_i32_2d )
      end function test_kokkos_allocate_dualview_i32_2d

      integer &
        & function test_kokkos_allocate_dualview_i64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i64_f_t), pointer, dimension(:,:)  :: array_i64_2d
        type(dualview_i64_2d_t) :: v_array_i64_2d
        integer :: ii, jj
        integer(flcl_dualview_i64_f_t) :: f_sum = 0
        integer(flcl_dualview_i64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i64_2d, v_array_i64_2d, 'array_i64_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_i64_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_i64_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i64_2d( v_array_i64_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_i64_2d(ii,jj)
            end do
          end do
          if ( f_sum .eq. c_sum ) then
            write(*,*)'PASSED kokkos_allocate_dualview_i64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i64_2d, v_array_i64_2d )
      end function test_kokkos_allocate_dualview_i64_2d

      integer &
        & function test_kokkos_allocate_dualview_r32_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r32_f_t), pointer, dimension(:,:)  :: array_r32_2d
        type(dualview_r32_2d_t) :: v_array_r32_2d
        integer :: ii, jj
        real(flcl_dualview_r32_f_t) :: f_sum = 0
        real(flcl_dualview_r32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r32_2d, v_array_r32_2d, 'array_r32_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r32_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_r32_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r32_2d( v_array_r32_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_r32_2d(ii,jj)
            end do
          end do
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r32_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r32_2d, v_array_r32_2d )
      end function test_kokkos_allocate_dualview_r32_2d

      integer &
        & function test_kokkos_allocate_dualview_r64_2d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r64_f_t), pointer, dimension(:,:)  :: array_r64_2d
        type(dualview_r64_2d_t) :: v_array_r64_2d
        integer :: ii, jj
        real(flcl_dualview_r64_f_t) :: f_sum = 0
        real(flcl_dualview_r64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r64_2d, v_array_r64_2d, 'array_r64_2d', e0_length, e1_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            array_r64_2d(ii,jj) = ii+jj
            f_sum = f_sum + array_r64_2d(ii,jj)
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r64_2d( v_array_r64_2d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              f_sum = f_sum + array_r64_2d(ii,jj)
            end do
          end do
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r64_2d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r64_2d, v_array_r64_2d )
      end function test_kokkos_allocate_dualview_r64_2d

      integer &
        & function test_kokkos_allocate_dualview_l_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:)  :: array_l_3d
        type(dualview_l_3d_t) :: v_array_l_3d
        integer :: ii, jj, kk
        integer(flcl_dualview_index_f_t) :: f_sum = 0
        integer(flcl_dualview_index_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_l_3d, v_array_l_3d, 'array_l_3d', e0_length, e1_length, e2_length )
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
        ierr = f_test_kokkos_allocate_dualview_l_3d( v_array_l_3d%ptr(), f_sum, c_sum )
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
            write(*,*)'PASSED kokkos_allocate_dualview_l_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_l_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_l_3d, v_array_l_3d )
      end function test_kokkos_allocate_dualview_l_3d

      integer &
        & function test_kokkos_allocate_dualview_i32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:)  :: array_i32_3d
        type(dualview_i32_3d_t) :: v_array_i32_3d
        integer :: ii, jj, kk
        integer(flcl_dualview_i32_f_t) :: f_sum = 0
        integer(flcl_dualview_i32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i32_3d, v_array_i32_3d, 'array_i32_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i32_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i32_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i32_3d( v_array_i32_3d%ptr(), f_sum, c_sum )
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
            write(*,*)'PASSED kokkos_allocate_dualview_i32_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i32_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i32_3d, v_array_i32_3d )
      end function test_kokkos_allocate_dualview_i32_3d

      integer &
        & function test_kokkos_allocate_dualview_i64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:)  :: array_i64_3d
        type(dualview_i64_3d_t) :: v_array_i64_3d
        integer :: ii, jj, kk
        integer(flcl_dualview_i64_f_t) :: f_sum = 0
        integer(flcl_dualview_i64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i64_3d, v_array_i64_3d, 'array_i64_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_i64_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_i64_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i64_3d( v_array_i64_3d%ptr(), f_sum, c_sum )
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
            write(*,*)'PASSED kokkos_allocate_dualview_i64_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i64_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i64_3d, v_array_i64_3d )
      end function test_kokkos_allocate_dualview_i64_3d

      integer &
        & function test_kokkos_allocate_dualview_r32_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:)  :: array_r32_3d
        type(dualview_r32_3d_t) :: v_array_r32_3d
        integer :: ii, jj, kk
        real(flcl_dualview_r32_f_t) :: f_sum = 0
        real(flcl_dualview_r32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r32_3d, v_array_r32_3d, 'array_r32_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r32_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r32_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r32_3d( v_array_r32_3d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_r32_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r32_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r32_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r32_3d, v_array_r32_3d )
      end function test_kokkos_allocate_dualview_r32_3d

      integer &
        & function test_kokkos_allocate_dualview_r64_3d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:)  :: array_r64_3d
        type(dualview_r64_3d_t) :: v_array_r64_3d
        integer :: ii, jj, kk
        real(flcl_dualview_r64_f_t) :: f_sum = 0
        real(flcl_dualview_r64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r64_3d, v_array_r64_3d, 'array_r64_3d', e0_length, e1_length, e2_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              array_r64_3d(ii,jj,kk) = ii+jj+kk
              f_sum = f_sum + array_r64_3d(ii,jj,kk)
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r64_3d( v_array_r64_3d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
          f_sum = 0
          do ii = 1, e0_length
            do jj = 1, e1_length
              do kk = 1, e2_length
                f_sum = f_sum + array_r64_3d(ii,jj,kk)
              end do
            end do
          end do
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r64_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r64_3d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r64_3d, v_array_r64_3d )
      end function test_kokkos_allocate_dualview_r64_3d

      integer &
        & function test_kokkos_allocate_dualview_l_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:)  :: array_l_4d
        type(dualview_l_4d_t) :: v_array_l_4d
        integer :: ii, jj, kk, ll
        integer(flcl_dualview_index_f_t) :: f_sum = 0
        integer(flcl_dualview_index_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_l_4d, v_array_l_4d, 'array_l_4d', e0_length, e1_length, e2_length, e3_length )
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
        ierr = f_test_kokkos_allocate_dualview_l_4d( v_array_l_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_l_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_l_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_l_4d, v_array_l_4d )
      end function test_kokkos_allocate_dualview_l_4d

      integer &
        & function test_kokkos_allocate_dualview_i32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:)  :: array_i32_4d
        type(dualview_i32_4d_t) :: v_array_i32_4d
        integer :: ii, jj, kk, ll
        integer(flcl_dualview_i32_f_t) :: f_sum = 0
        integer(flcl_dualview_i32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i32_4d, v_array_i32_4d, 'array_i32_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i32_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i32_4d( v_array_i32_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i32_4d, v_array_i32_4d )
      end function test_kokkos_allocate_dualview_i32_4d

      integer &
        & function test_kokkos_allocate_dualview_i64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:)  :: array_i64_4d
        type(dualview_i64_4d_t) :: v_array_i64_4d
        integer :: ii, jj, kk, ll
        integer(flcl_dualview_i64_f_t) :: f_sum = 0
        integer(flcl_dualview_i64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i64_4d, v_array_i64_4d, 'array_i64_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_i64_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_i64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i64_4d( v_array_i64_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i64_4d, v_array_i64_4d )
      end function test_kokkos_allocate_dualview_i64_4d

      integer &
        & function test_kokkos_allocate_dualview_r32_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:)  :: array_r32_4d
        type(dualview_r32_4d_t) :: v_array_r32_4d
        integer :: ii, jj, kk, ll
        real(flcl_dualview_r32_f_t) :: f_sum = 0
        real(flcl_dualview_r32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r32_4d, v_array_r32_4d, 'array_r32_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r32_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r32_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r32_4d( v_array_r32_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r32_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r32_4d, v_array_r32_4d )
      end function test_kokkos_allocate_dualview_r32_4d

      integer &
        & function test_kokkos_allocate_dualview_r64_4d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:)  :: array_r64_4d
        type(dualview_r64_4d_t) :: v_array_r64_4d
        integer :: ii, jj, kk, ll
        real(flcl_dualview_r64_f_t) :: f_sum = 0
        real(flcl_dualview_r64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r64_4d, v_array_r64_4d, 'array_r64_4d', e0_length, e1_length, e2_length, e3_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                array_r64_4d(ii,jj,kk,ll) = ii+jj+kk+ll
                f_sum = f_sum + array_r64_4d(ii,jj,kk,ll)
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r64_4d( v_array_r64_4d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r64_4d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r64_4d, v_array_r64_4d )
      end function test_kokkos_allocate_dualview_r64_4d

      integer &
        & function test_kokkos_allocate_dualview_l_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:)  :: array_l_5d
        type(dualview_l_5d_t) :: v_array_l_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_dualview_index_f_t) :: f_sum = 0
        integer(flcl_dualview_index_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_l_5d, v_array_l_5d, 'array_l_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
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
        ierr = f_test_kokkos_allocate_dualview_l_5d( v_array_l_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_l_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_l_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_l_5d, v_array_l_5d )
      end function test_kokkos_allocate_dualview_l_5d

      integer &
        & function test_kokkos_allocate_dualview_i32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:)  :: array_i32_5d
        type(dualview_i32_5d_t) :: v_array_i32_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_dualview_i32_f_t) :: f_sum = 0
        integer(flcl_dualview_i32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i32_5d, v_array_i32_5d, 'array_i32_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i32_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i32_5d( v_array_i32_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i32_5d, v_array_i32_5d )
      end function test_kokkos_allocate_dualview_i32_5d

      integer &
        & function test_kokkos_allocate_dualview_i64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:)  :: array_i64_5d
        type(dualview_i64_5d_t) :: v_array_i64_5d
        integer :: ii, jj, kk, ll, mm
        integer(flcl_dualview_i64_f_t) :: f_sum = 0
        integer(flcl_dualview_i64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i64_5d, v_array_i64_5d, 'array_i64_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_i64_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_i64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i64_5d( v_array_i64_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i64_5d, v_array_i64_5d )
      end function test_kokkos_allocate_dualview_i64_5d

      integer &
        & function test_kokkos_allocate_dualview_r32_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:)  :: array_r32_5d
        type(dualview_r32_5d_t) :: v_array_r32_5d
        integer :: ii, jj, kk, ll, mm
        real(flcl_dualview_r32_f_t) :: f_sum = 0
        real(flcl_dualview_r32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r32_5d, v_array_r32_5d, 'array_r32_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r32_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r32_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r32_5d( v_array_r32_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r32_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r32_5d, v_array_r32_5d )
      end function test_kokkos_allocate_dualview_r32_5d

      integer &
        & function test_kokkos_allocate_dualview_r64_5d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:)  :: array_r64_5d
        type(dualview_r64_5d_t) :: v_array_r64_5d
        integer :: ii, jj, kk, ll, mm
        real(flcl_dualview_r64_f_t) :: f_sum = 0
        real(flcl_dualview_r64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r64_5d, v_array_r64_5d, 'array_r64_5d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  array_r64_5d(ii,jj,kk,ll,mm) = ii+jj+kk+ll+mm
                  f_sum = f_sum + array_r64_5d(ii,jj,kk,ll,mm)
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r64_5d( v_array_r64_5d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r64_5d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r64_5d, v_array_r64_5d )
      end function test_kokkos_allocate_dualview_r64_5d

      integer &
        & function test_kokkos_allocate_dualview_l_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_l_6d
        type(dualview_l_6d_t) :: v_array_l_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_dualview_index_f_t) :: f_sum = 0
        integer(flcl_dualview_index_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_l_6d, v_array_l_6d, 'array_l_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
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
        ierr = f_test_kokkos_allocate_dualview_l_6d( v_array_l_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_l_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_l_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_l_6d, v_array_l_6d )
      end function test_kokkos_allocate_dualview_l_6d

      integer &
        & function test_kokkos_allocate_dualview_i32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_i32_6d
        type(dualview_i32_6d_t) :: v_array_i32_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_dualview_i32_f_t) :: f_sum = 0
        integer(flcl_dualview_i32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i32_6d, v_array_i32_6d, 'array_i32_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_i32_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_i32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i32_6d( v_array_i32_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i32_6d, v_array_i32_6d )
      end function test_kokkos_allocate_dualview_i32_6d

      integer &
        & function test_kokkos_allocate_dualview_i64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_i64_6d
        type(dualview_i64_6d_t) :: v_array_i64_6d
        integer :: ii, jj, kk, ll, mm, nn
        integer(flcl_dualview_i64_f_t) :: f_sum = 0
        integer(flcl_dualview_i64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i64_6d, v_array_i64_6d, 'array_i64_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                      array_i64_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                      f_sum = f_sum + array_i64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i64_6d( v_array_i64_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i64_6d, v_array_i64_6d )
      end function test_kokkos_allocate_dualview_i64_6d

      integer &
        & function test_kokkos_allocate_dualview_r32_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_r32_6d
        type(dualview_r32_6d_t) :: v_array_r32_6d
        integer :: ii, jj, kk, ll, mm, nn
        real(flcl_dualview_r32_f_t) :: f_sum = 0
        real(flcl_dualview_r32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r32_6d, v_array_r32_6d, 'array_r32_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r32_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r32_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r32_6d( v_array_r32_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r32_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r32_6d, v_array_r32_6d )
      end function test_kokkos_allocate_dualview_r32_6d

      integer &
        & function test_kokkos_allocate_dualview_r64_6d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:,:)  :: array_r64_6d
        type(dualview_r64_6d_t) :: v_array_r64_6d
        integer :: ii, jj, kk, ll, mm, nn
        real(flcl_dualview_r64_f_t) :: f_sum = 0
        real(flcl_dualview_r64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r64_6d, v_array_r64_6d, 'array_r64_6d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    array_r64_6d(ii,jj,kk,ll,mm,nn) = ii+jj+kk+ll+mm+nn
                    f_sum = f_sum + array_r64_6d(ii,jj,kk,ll,mm,nn)
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r64_6d( v_array_r64_6d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r64_6d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r64_6d, v_array_r64_6d )
      end function test_kokkos_allocate_dualview_r64_6d

      integer &
        & function test_kokkos_allocate_dualview_l_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_l_7d
        type(dualview_l_7d_t) :: v_array_l_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_dualview_index_f_t) :: f_sum = 0
        integer(flcl_dualview_index_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_l_7d, v_array_l_7d, 'array_l_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
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
        ierr = f_test_kokkos_allocate_dualview_l_7d( v_array_l_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_l_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_l_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_l_7d, v_array_l_7d )
      end function test_kokkos_allocate_dualview_l_7d

      integer &
        & function test_kokkos_allocate_dualview_i32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_i32_7d
        type(dualview_i32_7d_t) :: v_array_i32_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_dualview_i32_f_t) :: f_sum = 0
        integer(flcl_dualview_i32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i32_7d, v_array_i32_7d, 'array_i32_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i32_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i32_7d( v_array_i32_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i32_7d, v_array_i32_7d )
      end function test_kokkos_allocate_dualview_i32_7d

      integer &
        & function test_kokkos_allocate_dualview_i64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_i64_7d
        type(dualview_i64_7d_t) :: v_array_i64_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        integer(flcl_dualview_i64_f_t) :: f_sum = 0
        integer(flcl_dualview_i64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_i64_7d, v_array_i64_7d, 'array_i64_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_i64_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_i64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_i64_7d( v_array_i64_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
            write(*,*)'PASSED kokkos_allocate_dualview_i64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_i64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_i64_7d, v_array_i64_7d )
      end function test_kokkos_allocate_dualview_i64_7d

      integer &
        & function test_kokkos_allocate_dualview_r32_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_r32_7d
        type(dualview_r32_7d_t) :: v_array_r32_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        real(flcl_dualview_r32_f_t) :: f_sum = 0
        real(flcl_dualview_r32_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r32_7d, v_array_r32_7d, 'array_r32_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r32_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r32_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r32_7d( v_array_r32_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r32_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r32_7d, v_array_r32_7d )
      end function test_kokkos_allocate_dualview_r32_7d

      integer &
        & function test_kokkos_allocate_dualview_r64_7d() &
        & result(ierr)
        use, intrinsic :: iso_c_binding
        use :: flcl_mod
        implicit none

        real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:,:,:)  :: array_r64_7d
        type(dualview_r64_7d_t) :: v_array_r64_7d
        integer :: ii, jj, kk, ll, mm, nn, oo
        real(flcl_dualview_r64_f_t) :: f_sum = 0
        real(flcl_dualview_r64_f_t) :: c_sum = 0

        call kokkos_allocate_dualview( array_r64_7d, v_array_r64_7d, 'array_r64_7d', &
          & e0_length, e1_length, e2_length, e3_length, e4_length, e5_length, e6_length )
        do ii = 1, e0_length
          do jj = 1, e1_length
            do kk = 1, e2_length
              do ll = 1, e3_length
                do mm = 1, e4_length
                  do nn = 1, e5_length
                    do oo = 1, e6_length
                      array_r64_7d(ii,jj,kk,ll,mm,nn,oo) = ii+jj+kk+ll+mm+nn+oo
                      f_sum = f_sum + array_r64_7d(ii,jj,kk,ll,mm,nn,oo)
                    end do
                  end do
                end do
              end do
            end do
          end do
        end do
        ierr = f_test_kokkos_allocate_dualview_r64_7d( v_array_r64_7d%ptr(), f_sum, c_sum )
        if (ierr == flcl_test_pass) then
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
          if ( abs(f_sum - c_sum ) < (dualview_precision_single * c_sum) ) then
            write(*,*)'PASSED kokkos_allocate_dualview_r64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_pass
          else
            write(*,*)'FAILED F kokkos_allocate_dualview_r64_7d'
            write(*,*)'f_sum = ',f_sum
            write(*,*)'c_sum = ',c_sum
            ierr = flcl_test_fail
          end if
        end if
        call kokkos_deallocate_dualview( array_r64_7d, v_array_r64_7d )
      end function test_kokkos_allocate_dualview_r64_7d

end module flcl_test_f_mod
