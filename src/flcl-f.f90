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

module flcl_mod
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env
  use flcl_util_strings_mod, only: char_add_null
  
  implicit none
  private
  
  public nd_array_t
  public to_nd_array
  public ND_ARRAY_MAX_RANK
  public kokkos_allocate_view
  public kokkos_allocate_dualview
  public kokkos_deallocate_view
  public kokkos_deallocate_dualview
  integer, parameter :: ND_ARRAY_MAX_RANK = 8

  type, bind(C) :: nd_array_t
    integer(c_size_t) :: rank
    integer(c_size_t) :: dims(ND_ARRAY_MAX_RANK)
    integer(c_size_t) :: strides(ND_ARRAY_MAX_RANK)
    type(c_ptr) :: data
  end type nd_array_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   
  interface to_nd_array
    ! 1D specializations
    module procedure to_nd_array_l_1d
    module procedure to_nd_array_i32_1d
    module procedure to_nd_array_i64_1d
    module procedure to_nd_array_r32_1d
    module procedure to_nd_array_r64_1d
    module procedure to_nd_array_c32_1d
    module procedure to_nd_array_c64_1d  
    
    ! 2D specializations
    module procedure to_nd_array_l_2d
    module procedure to_nd_array_i32_2d
    module procedure to_nd_array_i64_2d
    module procedure to_nd_array_r32_2d
    module procedure to_nd_array_r64_2d
    module procedure to_nd_array_c32_2d
    module procedure to_nd_array_c64_2d 

    ! 3D specializations
    module procedure to_nd_array_l_3d
    module procedure to_nd_array_i32_3d
    module procedure to_nd_array_i64_3d
    module procedure to_nd_array_r32_3d
    module procedure to_nd_array_r64_3d
    module procedure to_nd_array_c32_3d
    module procedure to_nd_array_c64_3d

    ! 4D specializations
    module procedure to_nd_array_l_4d
    module procedure to_nd_array_i32_4d
    module procedure to_nd_array_i64_4d
    module procedure to_nd_array_r32_4d
    module procedure to_nd_array_r64_4d
    module procedure to_nd_array_c32_4d
    module procedure to_nd_array_c64_4d

    ! 5D specializations
    module procedure to_nd_array_l_5d
    module procedure to_nd_array_i32_5d
    module procedure to_nd_array_i64_5d
    module procedure to_nd_array_r32_5d
    module procedure to_nd_array_r64_5d
    module procedure to_nd_array_c32_5d
    module procedure to_nd_array_c64_5d

    ! 6D specializations
    module procedure to_nd_array_l_6d
    module procedure to_nd_array_i32_6d
    module procedure to_nd_array_i64_6d
    module procedure to_nd_array_r32_6d
    module procedure to_nd_array_r64_6d
    module procedure to_nd_array_c32_6d
    module procedure to_nd_array_c64_6d

    ! 7D specializations
    module procedure to_nd_array_l_7d
    module procedure to_nd_array_i32_7d
    module procedure to_nd_array_i64_7d
    module procedure to_nd_array_r32_7d
    module procedure to_nd_array_r64_7d
    module procedure to_nd_array_c32_7d
    module procedure to_nd_array_c64_7d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_view interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  interface kokkos_allocate_view
    ! 1D specializations
    module procedure kokkos_allocate_v_l_1d
    module procedure kokkos_allocate_v_i32_1d
    module procedure kokkos_allocate_v_i64_1d
    module procedure kokkos_allocate_v_r32_1d
    module procedure kokkos_allocate_v_r64_1d

    ! 2D specializations  
    module procedure kokkos_allocate_v_l_2d
    module procedure kokkos_allocate_v_i32_2d
    module procedure kokkos_allocate_v_i64_2d
    module procedure kokkos_allocate_v_r32_2d
    module procedure kokkos_allocate_v_r64_2d

    ! 3D specializations
    module procedure kokkos_allocate_v_l_3d
    module procedure kokkos_allocate_v_i32_3d
    module procedure kokkos_allocate_v_i64_3d
    module procedure kokkos_allocate_v_r32_3d
    module procedure kokkos_allocate_v_r64_3d
  end interface kokkos_allocate_view
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface kokkos_allocate_dualview
    ! 1D specializations
    module procedure kokkos_allocate_dv_l_1d
    module procedure kokkos_allocate_dv_i32_1d
    module procedure kokkos_allocate_dv_i64_1d
    module procedure kokkos_allocate_dv_r32_1d
    module procedure kokkos_allocate_dv_r64_1d

    ! 2D specializations  
    module procedure kokkos_allocate_dv_l_2d
    module procedure kokkos_allocate_dv_i32_2d
    module procedure kokkos_allocate_dv_i64_2d
    module procedure kokkos_allocate_dv_r32_2d
    module procedure kokkos_allocate_dv_r64_2d

    ! 3D specializations
    module procedure kokkos_allocate_dv_l_3d
    module procedure kokkos_allocate_dv_i32_3d
    module procedure kokkos_allocate_dv_i64_3d
    module procedure kokkos_allocate_dv_r32_3d
    module procedure kokkos_allocate_dv_r64_3d
  end interface kokkos_allocate_dualview
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_view interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  interface kokkos_deallocate_view
    ! 1D specializations
    module procedure kokkos_deallocate_v_l_1d
    module procedure kokkos_deallocate_v_i32_1d
    module procedure kokkos_deallocate_v_i64_1d
    module procedure kokkos_deallocate_v_r32_1d
    module procedure kokkos_deallocate_v_r64_1d

    ! 2D specializations
    module procedure kokkos_deallocate_v_l_2d
    module procedure kokkos_deallocate_v_i32_2d
    module procedure kokkos_deallocate_v_i64_2d
    module procedure kokkos_deallocate_v_r32_2d
    module procedure kokkos_deallocate_v_r64_2d

    ! 3D specializations
    module procedure kokkos_deallocate_v_l_3d  
    module procedure kokkos_deallocate_v_i32_3d
    module procedure kokkos_deallocate_v_i64_3d
    module procedure kokkos_deallocate_v_r32_3d
    module procedure kokkos_deallocate_v_r64_3d
  end interface kokkos_deallocate_view
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  interface kokkos_deallocate_dualview
    ! 1D specializations
    module procedure kokkos_deallocate_dv_l_1d
    module procedure kokkos_deallocate_dv_i32_1d
    module procedure kokkos_deallocate_dv_i64_1d
    module procedure kokkos_deallocate_dv_r32_1d
    module procedure kokkos_deallocate_dv_r64_1d

    ! 2D specializations
    module procedure kokkos_deallocate_dv_l_2d
    module procedure kokkos_deallocate_dv_i32_2d
    module procedure kokkos_deallocate_dv_i64_2d
    module procedure kokkos_deallocate_dv_r32_2d
    module procedure kokkos_deallocate_dv_r64_2d

    ! 3D specializations
    module procedure kokkos_deallocate_dv_l_3d  
    module procedure kokkos_deallocate_dv_i32_3d
    module procedure kokkos_deallocate_dv_i64_3d
    module procedure kokkos_deallocate_dv_r32_3d
    module procedure kokkos_deallocate_dv_r64_3d
  end interface kokkos_deallocate_dualview
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_view 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_allocate_v_l_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_v_l_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0      
    end subroutine f_kokkos_allocate_v_l_1d
  end interface

  interface 
    subroutine f_kokkos_allocate_v_i32_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_v_i32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_v_i32_1d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_v_i64_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_v_i64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_v_i64_1d
  end interface

  interface 
    subroutine f_kokkos_allocate_v_r32_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_v_r32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_v_r32_1d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_v_r64_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_v_r64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_v_r64_1d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_view 2D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_allocate_v_l_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_v_l_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_v_l_2d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_v_i32_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_v_i32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_v_i32_2d
  end interface

  interface 
    subroutine f_kokkos_allocate_v_i64_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_v_i64_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_v_i64_2d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_v_r32_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_v_r32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_v_r32_2d
  end interface

  interface 
    subroutine f_kokkos_allocate_v_r64_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_v_r64_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_v_r64_2d
  end interface  
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_view 3D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_allocate_v_l_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_v_l_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_v_l_3d
  end interface

  interface 
    subroutine f_kokkos_allocate_v_i32_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_v_i32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_v_i32_3d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_v_i64_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_v_i64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_v_i64_3d
  end interface

  interface 
    subroutine f_kokkos_allocate_v_r32_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_v_r32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_v_r32_3d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_v_r64_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_v_r64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_v_r64_3d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_allocate_dv_l_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_l_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0      
    end subroutine f_kokkos_allocate_dv_l_1d
  end interface

  interface 
    subroutine f_kokkos_allocate_dv_i32_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_i32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_i32_1d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_dv_i64_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_i64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_i64_1d
  end interface

  interface 
    subroutine f_kokkos_allocate_dv_r32_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_r32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_r32_1d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_dv_r64_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_r64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_r64_1d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 2D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_allocate_dv_l_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_l_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_l_2d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_dv_i32_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_i32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_i32_2d
  end interface

  interface 
    subroutine f_kokkos_allocate_dv_i64_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_i64_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_i64_2d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_dv_r32_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_r32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_r32_2d
  end interface

  interface 
    subroutine f_kokkos_allocate_dv_r64_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_r64_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_r64_2d
  end interface  
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 3D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_allocate_dv_l_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_l_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_l_3d
  end interface

  interface 
    subroutine f_kokkos_allocate_dv_i32_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_i32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_i32_3d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_dv_i64_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_i64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_i64_3d
  end interface

  interface 
    subroutine f_kokkos_allocate_dv_r32_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_r32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_r32_3d
  end interface
  
  interface 
    subroutine f_kokkos_allocate_dv_r64_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_r64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_r64_3d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_view 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_deallocate_v_l_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_l_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_l_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_i32_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_i32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_i32_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_i64_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_i64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_i64_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_r32_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_r32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_r32_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_r64_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_r64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_r64_1d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_view 2D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_deallocate_v_l_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_l_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_l_2d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_i32_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_i32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_i32_2d
  end interface

  interface 
  subroutine f_kokkos_deallocate_v_i64_2d(v_A) &
    & bind (c, name='c_kokkos_deallocate_v_i64_2d')
    use, intrinsic :: iso_c_binding
    implicit none
    type(c_ptr), intent(out) :: v_A
  end subroutine f_kokkos_deallocate_v_i64_2d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_r32_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_r32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_r32_2d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_r64_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_r64_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_r64_2d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_view 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_deallocate_v_l_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_l_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_l_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_i32_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_i32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_i32_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_i64_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_i64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_i64_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_r32_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_r32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_r32_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_v_r64_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_v_r64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_v_r64_3d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_deallocate_dv_l_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_i32_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_i64_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_r32_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_1d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_r64_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_1d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_1d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 2D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_deallocate_dv_l_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_2d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_i32_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_2d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_i64_2d(v_A) &
    & bind (c, name='c_kokkos_deallocate_dv_i64_2d')
    use, intrinsic :: iso_c_binding
    implicit none
    type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_2d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_r32_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_2d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_r64_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_2d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_2d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface 
    subroutine f_kokkos_deallocate_dv_l_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_i32_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_i64_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_r32_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_3d
  end interface

  interface 
    subroutine f_kokkos_deallocate_dv_r64_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_3d')
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_3d
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  contains
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate view 1D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_v_l_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      logical(c_bool), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_l_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_v_l_1d
  
    subroutine kokkos_allocate_v_i32_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer (INT32), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_i32_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_v_i32_1d
  
    subroutine kokkos_allocate_v_i64_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT64), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_i64_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_v_i64_1d
  
    subroutine kokkos_allocate_v_r32_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL32), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_r32_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_v_r32_1d
  
    subroutine kokkos_allocate_v_r64_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL64), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_r64_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_v_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate view 2D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_v_l_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      logical(c_bool), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_l_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_v_l_2d
  
    subroutine kokkos_allocate_v_i32_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT32), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_i32_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_v_i32_2d
  
    subroutine kokkos_allocate_v_i64_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer (INT64), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_i64_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_v_i64_2d
  
    subroutine kokkos_allocate_v_r32_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL32), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_r32_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_v_r32_2d
  
    subroutine kokkos_allocate_v_r64_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL64), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_r64_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_v_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate view 3D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_v_l_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_l_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_v_l_3d
  
    subroutine kokkos_allocate_v_i32_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT32), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_i32_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_v_i32_3d
  
    subroutine kokkos_allocate_v_i64_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT64), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_i64_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_v_i64_3d
  
    subroutine kokkos_allocate_v_r32_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL32), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
  
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_r32_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_v_r32_3d
  
    subroutine kokkos_allocate_v_r64_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL64), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label

      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_v_r64_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_v_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 1D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      logical(c_bool), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_l_1d
  
    subroutine kokkos_allocate_dv_i32_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer (INT32), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_i32_1d
  
    subroutine kokkos_allocate_dv_i64_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT64), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_i64_1d
  
    subroutine kokkos_allocate_dv_r32_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL32), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_r32_1d
  
    subroutine kokkos_allocate_dv_r64_1d(A, v_A, n_A, e0)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL64), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_1d(c_A, v_A, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 2D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      logical(c_bool), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_l_2d
  
    subroutine kokkos_allocate_dv_i32_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT32), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_i32_2d
  
    subroutine kokkos_allocate_dv_i64_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer (INT64), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_i64_2d
  
    subroutine kokkos_allocate_dv_r32_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL32), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_r32_2d
  
    subroutine kokkos_allocate_dv_r64_2d(A, v_A, n_A, e0, e1)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL64), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_2d(c_A, v_A, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 3D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_l_3d
  
    subroutine kokkos_allocate_dv_i32_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT32), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_i32_3d
  
    subroutine kokkos_allocate_dv_i64_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      integer(INT64), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_i64_3d
  
    subroutine kokkos_allocate_dv_r32_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL32), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
  
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_r32_3d
  
    subroutine kokkos_allocate_dv_r64_3d(A, v_A, n_A, e0, e1, e2)
      use, intrinsic :: iso_c_binding
      use flcl_util_strings_mod, only: char_add_null
      implicit none
      real(REAL64), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(c_size_t), intent(in) :: e0
      integer(c_size_t), intent(in) :: e1
      integer(c_size_t), intent(in) :: e2
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label

      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_3d(c_A, v_A, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate view 1D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_deallocate_v_l_1d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      logical(c_bool), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_l_1d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_l_1d
  
    subroutine kokkos_deallocate_v_i32_1d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      integer(INT32), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_i32_1d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_i32_1d
  
    subroutine kokkos_deallocate_v_i64_1d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      integer(INT64), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_i64_1d(v_A)      
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_i64_1d
  
    subroutine kokkos_deallocate_v_r32_1d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      real(REAL32), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_r32_1d(v_A)      
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_r32_1d
  
    subroutine kokkos_deallocate_v_r64_1d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      real(REAL64), pointer, dimension(:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_r64_1d(v_A)      
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate view 2D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_deallocate_v_l_2d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      logical(c_bool), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_l_2d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_l_2d
  
    subroutine kokkos_deallocate_v_i32_2d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      integer(INT32), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_i32_2d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_i32_2d
  
    subroutine kokkos_deallocate_v_i64_2d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      integer(INT64), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_i64_2d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_i64_2d
  
    subroutine kokkos_deallocate_v_r32_2d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      real(REAL32), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_r32_2d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_r32_2d
  
    subroutine kokkos_deallocate_v_r64_2d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      real(REAL64), pointer, dimension(:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_r64_2d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate view 3D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_deallocate_v_l_3d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_l_3d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_l_3d
  
    subroutine kokkos_deallocate_v_i32_3d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      integer(INT32), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_i32_3d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_i32_3d
  
    subroutine kokkos_deallocate_v_i64_3d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      integer(INT64), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_i64_3d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_i64_3d
  
    subroutine kokkos_deallocate_v_r32_3d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      real(REAL32), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_r32_3d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_r32_3d
  
    subroutine kokkos_deallocate_v_r64_3d(A, v_A )
      use, intrinsic :: iso_c_binding
      implicit none
      real(REAL64), pointer, dimension(:,:,:), intent(inout) :: A
      type(c_ptr), intent(inout) :: v_A
  
      A => NULL()
      call f_kokkos_deallocate_v_r64_3d(v_A)
      v_A = c_null_ptr
  
    end subroutine kokkos_deallocate_v_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 1D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_1d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_1d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_1d

  subroutine kokkos_deallocate_dv_i32_1d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    integer(INT32), pointer, dimension(:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_1d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_1d

  subroutine kokkos_deallocate_dv_i64_1d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    integer(INT64), pointer, dimension(:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_1d(v_A)      
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_1d

  subroutine kokkos_deallocate_dv_r32_1d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    real(REAL32), pointer, dimension(:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_1d(v_A)      
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_1d

  subroutine kokkos_deallocate_dv_r64_1d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    real(REAL64), pointer, dimension(:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_1d(v_A)      
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 2D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_2d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_2d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_2d

  subroutine kokkos_deallocate_dv_i32_2d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    integer(INT32), pointer, dimension(:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_2d(v_A)  
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_2d

  subroutine kokkos_deallocate_dv_i64_2d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    integer(INT64), pointer, dimension(:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_2d(v_A)  
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_2d

  subroutine kokkos_deallocate_dv_r32_2d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    real(REAL32), pointer, dimension(:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_2d(v_A)  
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_2d

  subroutine kokkos_deallocate_dv_r64_2d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    real(REAL64), pointer, dimension(:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_2d(v_A)  
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 3D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_3d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_3d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_3d

  subroutine kokkos_deallocate_dv_i32_3d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    integer(INT32), pointer, dimension(:,:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_3d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_3d

  subroutine kokkos_deallocate_dv_i64_3d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    integer(INT64), pointer, dimension(:,:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_3d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_3d

  subroutine kokkos_deallocate_dv_r32_3d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    real(REAL32), pointer, dimension(:,:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_3d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_3d

  subroutine kokkos_deallocate_dv_r64_3d(A, v_A )
    use, intrinsic :: iso_c_binding
    implicit none
    real(REAL64), pointer, dimension(:,:,:), intent(inout) :: A
    type(c_ptr), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_3d(v_A)
    v_A = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array 1D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function to_nd_array_l_1d(array) result(ndarray)
      logical(c_bool), target, intent(in) :: array(:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2)), 1_c_size_t) - &
            transfer(c_loc(array(1)), 1_c_size_t)) / c_sizeof(array(1))
      else
        ndarray%strides(1) = 1
      end if
  
      ndarray%rank = 1
      if (size(array, 1) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1))
      end if
    end function to_nd_array_l_1d
    
    function to_nd_array_i32_1d(array) result(ndarray)
      integer(INT32), target, intent(in) :: array(:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2)), 1_c_size_t) - &
            transfer(c_loc(array(1)), 1_c_size_t)) / c_sizeof(array(1))
      else
        ndarray%strides(1) = 1
      end if
  
      ndarray%rank = 1
      if (size(array, 1) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1))
      end if
    end function to_nd_array_i32_1d
    
    function to_nd_array_i64_1d(array) result(ndarray)
      integer(INT64), target, intent(in) :: array(:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2)), 1_c_size_t) - &
            transfer(c_loc(array(1)), 1_c_size_t)) / c_sizeof(array(1))
      else
        ndarray%strides(1) = 1
      end if
  
      ndarray%rank = 1
      if (size(array, 1) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1))
      end if
    end function to_nd_array_i64_1d
    
    function to_nd_array_r32_1d(array) result(ndarray)
      real(REAL32), target, intent(in) :: array(:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2)), 1_c_size_t) - &
            transfer(c_loc(array(1)), 1_c_size_t)) / c_sizeof(array(1))
      else
        ndarray%strides(1) = 1
      end if
  
      ndarray%rank = 1
      if (size(array, 1) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1))
      end if
    end function to_nd_array_r32_1d
    
    function to_nd_array_r64_1d(array) result(ndarray)
      real(REAL64), target, intent(in) :: array(:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2)), 1_c_size_t) - &
            transfer(c_loc(array(1)), 1_c_size_t)) / c_sizeof(array(1))
      else
        ndarray%strides(1) = 1
      end if
  
      ndarray%rank = 1
      if (size(array, 1) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1))
      end if
    end function to_nd_array_r64_1d

    function to_nd_array_c32_1d(array) result(ndarray)
      complex(c_float_complex), target, intent(in) :: array(:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2)), 1_c_size_t) - &
            transfer(c_loc(array(1)), 1_c_size_t)) / c_sizeof(array(1))
      else
        ndarray%strides(1) = 1
      end if
  
      ndarray%rank = 1
      if (size(array, 1) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1))
      end if
    end function to_nd_array_c32_1d

    function to_nd_array_c64_1d(array) result(ndarray)
      complex(c_double_complex), target, intent(in) :: array(:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2)), 1_c_size_t) - &
            transfer(c_loc(array(1)), 1_c_size_t)) / c_sizeof(array(1))
      else
        ndarray%strides(1) = 1
      end if
  
      ndarray%rank = 1
      if (size(array, 1) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1))
      end if
    end function to_nd_array_c64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array 2D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function to_nd_array_l_2d(array) result(ndarray)
      logical(c_bool), target, intent(in) :: array(:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(2) = size(array, 1)
      end if
  
      ndarray%rank = 2
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1))
      end if
    end function to_nd_array_l_2d
    
    function to_nd_array_i32_2d(array) result(ndarray)
      integer(INT32), target, intent(in) :: array(:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(2) = size(array, 1)
      end if
  
      ndarray%rank = 2
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1))
      end if
    end function to_nd_array_i32_2d
    
    function to_nd_array_i64_2d(array) result(ndarray)
      integer(INT64), target, intent(in) :: array(:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(2) = size(array, 1)
      end if
  
      ndarray%rank = 2
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1))
      end if
    end function to_nd_array_i64_2d
    
    function to_nd_array_r32_2d(array) result(ndarray)
      real(REAL32), target, intent(in) :: array(:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(2) = size(array, 1)
      end if
  
      ndarray%rank = 2
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1))
      end if
    end function to_nd_array_r32_2d
    
    function to_nd_array_r64_2d(array) result(ndarray)
      real(REAL64), target, intent(in) :: array(:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(2) = size(array, 1)
      end if
  
      ndarray%rank = 2
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1))
      end if
    end function to_nd_array_r64_2d

    function to_nd_array_c32_2d(array) result(ndarray)
      complex(c_float_complex), target, intent(in) :: array(:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(2) = size(array, 1)
      end if
  
      ndarray%rank = 2
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1))
      end if
    end function to_nd_array_c32_2d

    function to_nd_array_c64_2d(array) result(ndarray)
      complex(c_double_complex), target, intent(in) :: array(:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1)), 1_c_size_t)) / c_sizeof(array(1,1))
      else
        ndarray%strides(2) = size(array, 1)
      end if
  
      ndarray%rank = 2
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1))
      end if
    end function to_nd_array_c64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array 3D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function to_nd_array_l_3d(array) result(ndarray)
      logical(c_bool), target, intent(in) :: array(:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      ndarray%rank = 3
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1))
      end if
    end function to_nd_array_l_3d
    
    function to_nd_array_i32_3d(array) result(ndarray)
      integer(INT32), target, intent(in) :: array(:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      ndarray%rank = 3
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1))
      end if
    end function to_nd_array_i32_3d
    
    function to_nd_array_i64_3d(array) result(ndarray)
      integer(INT64), target, intent(in) :: array(:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      ndarray%rank = 3
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1))
      end if
    end function to_nd_array_i64_3d
    
    function to_nd_array_r32_3d(array) result(ndarray)
      real(REAL32), target, intent(in) :: array(:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      ndarray%rank = 3
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1))
      end if
    end function to_nd_array_r32_3d
    
    function to_nd_array_r64_3d(array) result(ndarray)
      real(REAL64), target, intent(in) :: array(:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      ndarray%rank = 3
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1))
      end if
    end function to_nd_array_r64_3d

    function to_nd_array_c32_3d(array) result(ndarray)
      complex(c_float_complex), target, intent(in) :: array(:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      ndarray%rank = 3
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1))
      end if
    end function to_nd_array_c32_3d

    function to_nd_array_c64_3d(array) result(ndarray)
      complex(c_double_complex), target, intent(in) :: array(:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      ndarray%rank = 3
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1))
      end if
    end function to_nd_array_c64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array 4D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function to_nd_array_l_4d(array) result(ndarray)
      logical(c_bool), target, intent(in) :: array(:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      ndarray%rank = 4
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1))
      end if
    end function to_nd_array_l_4d
  
    function to_nd_array_i32_4d(array) result(ndarray)
      integer(INT32), target, intent(in) :: array(:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      ndarray%rank = 4
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1))
      end if
    end function to_nd_array_i32_4d
  
    function to_nd_array_i64_4d(array) result(ndarray)
      integer(INT64), target, intent(in) :: array(:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      ndarray%rank = 4
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1))
      end if
    end function to_nd_array_i64_4d
  
    function to_nd_array_r32_4d(array) result(ndarray)
      real(REAL32), target, intent(in) :: array(:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      ndarray%rank = 4
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1))
      end if
    end function to_nd_array_r32_4d
  
    function to_nd_array_r64_4d(array) result(ndarray)
      real(REAL64), target, intent(in) :: array(:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      ndarray%rank = 4
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1))
      end if
    end function to_nd_array_r64_4d

    function to_nd_array_c32_4d(array) result(ndarray)
      complex(c_float_complex), target, intent(in) :: array(:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      ndarray%rank = 4
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1))
      end if
    end function to_nd_array_c32_4d

    function to_nd_array_c64_4d(array) result(ndarray)
      complex(c_double_complex), target, intent(in) :: array(:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2)), 1_c_size_t) - &
            transfer(c_loc(array(1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      ndarray%rank = 4
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1))
      end if
    end function to_nd_array_c64_4d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array 5D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function to_nd_array_l_5d(array) result(ndarray)
      logical(c_bool), target, intent(in) :: array(:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      ndarray%rank = 5
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1))
      end if
    end function to_nd_array_l_5d

    function to_nd_array_i32_5d(array) result(ndarray)
      integer(INT32), target, intent(in) :: array(:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      ndarray%rank = 5
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1))
      end if
    end function to_nd_array_i32_5d

    function to_nd_array_i64_5d(array) result(ndarray)
      integer(INT64), target, intent(in) :: array(:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      ndarray%rank = 5
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1))
      end if
    end function to_nd_array_i64_5d

    function to_nd_array_r32_5d(array) result(ndarray)
      real(REAL32), target, intent(in) :: array(:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      ndarray%rank = 5
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1))
      end if
    end function to_nd_array_r32_5d

    function to_nd_array_r64_5d(array) result(ndarray)
      real(REAL64), target, intent(in) :: array(:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      ndarray%rank = 5
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1))
      end if
    end function to_nd_array_r64_5d

    function to_nd_array_c32_5d(array) result(ndarray)
      complex(c_float_complex), target, intent(in) :: array(:,:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      ndarray%rank = 5
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1))
      end if
    end function to_nd_array_c32_5d

    function to_nd_array_c64_5d(array) result(ndarray)
      complex(c_double_complex), target, intent(in) :: array(:,:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      ndarray%rank = 5
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1))
      end if
    end function to_nd_array_c64_5d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array 6D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function to_nd_array_l_6d(array) result(ndarray)
      logical(c_bool), target, intent(in) :: array(:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      ndarray%rank = 6
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1))
      end if
    end function to_nd_array_l_6d

    function to_nd_array_i32_6d(array) result(ndarray)
      integer(INT32), target, intent(in) :: array(:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      ndarray%rank = 6
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1))
      end if
    end function to_nd_array_i32_6d

    function to_nd_array_i64_6d(array) result(ndarray)
      integer(INT64), target, intent(in) :: array(:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      ndarray%rank = 6
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1))
      end if
    end function to_nd_array_i64_6d

    function to_nd_array_r32_6d(array) result(ndarray)
      real(REAL32), target, intent(in) :: array(:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      ndarray%rank = 6
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1))
      end if
    end function to_nd_array_r32_6d

    function to_nd_array_r64_6d(array) result(ndarray)
      real(REAL64), target, intent(in) :: array(:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      ndarray%rank = 6
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1))
      end if
    end function to_nd_array_r64_6d

    function to_nd_array_c32_6d(array) result(ndarray)
      complex(c_float_complex), target, intent(in) :: array(:,:,:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      ndarray%rank = 6
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1))
      end if
    end function to_nd_array_c32_6d

    function to_nd_array_c64_6d(array) result(ndarray)
      complex(c_double_complex), target, intent(in) :: array(:,:,:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      ndarray%rank = 6
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1))
      end if
    end function to_nd_array_c64_6d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! to_nd_array 7D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function to_nd_array_l_7d(array) result(ndarray)
      logical(c_bool), target, intent(in) :: array(:,:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
      ndarray%dims(7) = size(array, 7, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      if (size(array, 7) .ge. 2) then
        ndarray%strides(7) = &
          (transfer(c_loc(array(1,1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(7) = size(array, 6, c_size_t) * ndarray%strides(6)
      end if
  
      ndarray%rank = 7
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0 .or. size(array, 7) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1,1))
      end if
    end function to_nd_array_l_7d

    function to_nd_array_i32_7d(array) result(ndarray)
      integer(INT32), target, intent(in) :: array(:,:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
      ndarray%dims(7) = size(array, 7, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      if (size(array, 7) .ge. 2) then
        ndarray%strides(7) = &
          (transfer(c_loc(array(1,1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(7) = size(array, 6, c_size_t) * ndarray%strides(6)
      end if
  
      ndarray%rank = 7
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0 .or. size(array, 7) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1,1))
      end if
    end function to_nd_array_i32_7d

    function to_nd_array_i64_7d(array) result(ndarray)
      integer(INT64), target, intent(in) :: array(:,:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
      ndarray%dims(7) = size(array, 7, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      if (size(array, 7) .ge. 2) then
        ndarray%strides(7) = &
          (transfer(c_loc(array(1,1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(7) = size(array, 6, c_size_t) * ndarray%strides(6)
      end if
  
      ndarray%rank = 7
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0 .or. size(array, 7) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1,1))
      end if
    end function to_nd_array_i64_7d

    function to_nd_array_r32_7d(array) result(ndarray)
      real(REAL32), target, intent(in) :: array(:,:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
      ndarray%dims(7) = size(array, 7, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      if (size(array, 7) .ge. 2) then
        ndarray%strides(7) = &
          (transfer(c_loc(array(1,1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(7) = size(array, 6, c_size_t) * ndarray%strides(6)
      end if
  
      ndarray%rank = 7
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0 .or. size(array, 7) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1,1))
      end if
    end function to_nd_array_r32_7d

    function to_nd_array_r64_7d(array) result(ndarray)
      real(REAL64), target, intent(in) :: array(:,:,:,:,:,:,:)
  
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
      ndarray%dims(7) = size(array, 7, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      if (size(array, 7) .ge. 2) then
        ndarray%strides(7) = &
          (transfer(c_loc(array(1,1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(7) = size(array, 6, c_size_t) * ndarray%strides(6)
      end if
  
      ndarray%rank = 7
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0 .or. size(array, 7) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1,1))
      end if
    end function to_nd_array_r64_7d

    function to_nd_array_c32_7d(array) result(ndarray)
      complex(c_float_complex), target, intent(in) :: array(:,:,:,:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
      ndarray%dims(7) = size(array, 7, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      if (size(array, 7) .ge. 2) then
        ndarray%strides(7) = &
          (transfer(c_loc(array(1,1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(7) = size(array, 6, c_size_t) * ndarray%strides(6)
      end if
  
      ndarray%rank = 7
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0 .or. size(array, 7) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1,1))
      end if
    end function to_nd_array_c32_7d

    function to_nd_array_c64_7d(array) result(ndarray)
      complex(c_double_complex), target, intent(in) :: array(:,:,:,:,:,:,:)
      
      type(nd_array_t) :: ndarray
  
      ndarray%dims(1) = size(array, 1, c_size_t)
      ndarray%dims(2) = size(array, 2, c_size_t)
      ndarray%dims(3) = size(array, 3, c_size_t)
      ndarray%dims(4) = size(array, 4, c_size_t)
      ndarray%dims(5) = size(array, 5, c_size_t)
      ndarray%dims(6) = size(array, 6, c_size_t)
      ndarray%dims(7) = size(array, 7, c_size_t)
  
      if (size(array, 1) .ge. 2) then
        ndarray%strides(1) = &
          (transfer(c_loc(array(2,1,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(1) = 1
      end if
  
      if (size(array, 2) .ge. 2) then
        ndarray%strides(2) = &
          (transfer(c_loc(array(1,2,1,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(2) = size(array, 1, c_size_t) * ndarray%strides(1)
      end if
  
      if (size(array, 3) .ge. 2) then
        ndarray%strides(3) = &
          (transfer(c_loc(array(1,1,2,1,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(3) = size(array, 2, c_size_t) * ndarray%strides(2)
      end if
  
      if (size(array, 4) .ge. 2) then
        ndarray%strides(4) = &
          (transfer(c_loc(array(1,1,1,2,1,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(4) = size(array, 3, c_size_t) * ndarray%strides(3)
      end if
  
      if (size(array, 5) .ge. 2) then
        ndarray%strides(5) = &
          (transfer(c_loc(array(1,1,1,1,2,1,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(5) = size(array, 4, c_size_t) * ndarray%strides(4)
      end if
  
      if (size(array, 6) .ge. 2) then
        ndarray%strides(6) = &
          (transfer(c_loc(array(1,1,1,1,1,2,1)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(6) = size(array, 5, c_size_t) * ndarray%strides(5)
      end if
  
      if (size(array, 7) .ge. 2) then
        ndarray%strides(7) = &
          (transfer(c_loc(array(1,1,1,1,1,1,2)), 1_c_size_t) - &
           transfer(c_loc(array(1,1,1,1,1,1,1)), 1_c_size_t)) / c_sizeof(array(1,1,1,1,1,1,1))
      else
        ndarray%strides(7) = size(array, 6, c_size_t) * ndarray%strides(6)
      end if
  
      ndarray%rank = 7
      if (size(array, 1) .eq. 0 .or. size(array, 2) .eq. 0 .or. &
        & size(array, 3) .eq. 0 .or. size(array, 4) .eq. 0 .or. &
        & size(array, 5) .eq. 0 .or. size(array, 6) .eq. 0 .or. size(array, 7) .eq. 0) then
        ndarray%data = c_null_ptr
      else
        ndarray%data = c_loc(array(1,1,1,1,1,1,1))
      end if
    end function to_nd_array_c64_7d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! fin
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end module flcl_mod