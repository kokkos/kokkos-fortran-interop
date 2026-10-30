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

module flcl_dualview_mod
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env
  use flcl_util_strings_mod, only: char_add_null
  use flcl_types_f_mod

  implicit none
  private
  
  public kokkos_allocate_dualview
  public kokkos_deallocate_dualview
  public dualview_l_1d_t
  public dualview_i32_1d_t
  public dualview_i64_1d_t
  public dualview_r32_1d_t
  public dualview_r64_1d_t
  public dualview_l_2d_t
  public dualview_i32_2d_t
  public dualview_i64_2d_t
  public dualview_r32_2d_t
  public dualview_r64_2d_t
  public dualview_l_3d_t
  public dualview_i32_3d_t
  public dualview_i64_3d_t
  public dualview_r32_3d_t
  public dualview_r64_3d_t
  public dualview_l_4d_t
  public dualview_i32_4d_t
  public dualview_i64_4d_t
  public dualview_r32_4d_t
  public dualview_r64_4d_t
  public dualview_l_5d_t
  public dualview_i32_5d_t
  public dualview_i64_5d_t
  public dualview_r32_5d_t
  public dualview_r64_5d_t
  public dualview_l_6d_t
  public dualview_i32_6d_t
  public dualview_i64_6d_t
  public dualview_r32_6d_t
  public dualview_r64_6d_t
  public dualview_l_7d_t
  public dualview_i32_7d_t
  public dualview_i64_7d_t
  public dualview_r32_7d_t
  public dualview_r64_7d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 1D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type dualview_l_1d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_l_1d_t
  end type dualview_l_1d_t

  type dualview_i32_1d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i32_1d_t
  end type dualview_i32_1d_t

  type dualview_i64_1d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i64_1d_t
  end type dualview_i64_1d_t

  type dualview_r32_1d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r32_1d_t
  end type dualview_r32_1d_t

  type dualview_r64_1d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r64_1d_t
  end type dualview_r64_1d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 2D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type dualview_l_2d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_l_2d_t
  end type dualview_l_2d_t

  type dualview_i32_2d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i32_2d_t
  end type dualview_i32_2d_t

  type dualview_i64_2d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i64_2d_t
  end type dualview_i64_2d_t

  type dualview_r32_2d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r32_2d_t
  end type dualview_r32_2d_t

  type dualview_r64_2d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r64_2d_t
  end type dualview_r64_2d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 3D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type dualview_l_3d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_l_3d_t
  end type dualview_l_3d_t

  type dualview_i32_3d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i32_3d_t
  end type dualview_i32_3d_t

  type dualview_i64_3d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i64_3d_t
  end type dualview_i64_3d_t

  type dualview_r32_3d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r32_3d_t
  end type dualview_r32_3d_t

  type dualview_r64_3d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r64_3d_t
  end type dualview_r64_3d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 4D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type dualview_l_4d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_l_4d_t
  end type dualview_l_4d_t

  type dualview_i32_4d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i32_4d_t
  end type dualview_i32_4d_t

  type dualview_i64_4d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i64_4d_t
  end type dualview_i64_4d_t

  type dualview_r32_4d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r32_4d_t
  end type dualview_r32_4d_t

  type dualview_r64_4d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r64_4d_t
  end type dualview_r64_4d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 5D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type dualview_l_5d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_l_5d_t
  end type dualview_l_5d_t

  type dualview_i32_5d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i32_5d_t
  end type dualview_i32_5d_t

  type dualview_i64_5d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i64_5d_t
  end type dualview_i64_5d_t

  type dualview_r32_5d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r32_5d_t
  end type dualview_r32_5d_t

  type dualview_r64_5d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r64_5d_t
  end type dualview_r64_5d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 6D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type dualview_l_6d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_l_6d_t
  end type dualview_l_6d_t

  type dualview_i32_6d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i32_6d_t
  end type dualview_i32_6d_t

  type dualview_i64_6d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i64_6d_t
  end type dualview_i64_6d_t

  type dualview_r32_6d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r32_6d_t
  end type dualview_r32_6d_t

  type dualview_r64_6d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r64_6d_t
  end type dualview_r64_6d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! 7D Kokkos DualView types
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type dualview_l_7d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_l_7d_t
  end type dualview_l_7d_t

  type dualview_i32_7d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i32_7d_t
  end type dualview_i32_7d_t

  type dualview_i64_7d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_i64_7d_t
  end type dualview_i64_7d_t

  type dualview_r32_7d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r32_7d_t
  end type dualview_r32_7d_t

  type dualview_r64_7d_t
    private
      type(c_ptr) :: handle
    contains
      procedure :: ptr => view_ptr_dualview_r64_7d_t
  end type dualview_r64_7d_t
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

    ! 4D specializations
    module procedure kokkos_allocate_dv_l_4d
    module procedure kokkos_allocate_dv_i32_4d
    module procedure kokkos_allocate_dv_i64_4d
    module procedure kokkos_allocate_dv_r32_4d
    module procedure kokkos_allocate_dv_r64_4d

    ! 5D specializations  
    module procedure kokkos_allocate_dv_l_5d
    module procedure kokkos_allocate_dv_i32_5d
    module procedure kokkos_allocate_dv_i64_5d
    module procedure kokkos_allocate_dv_r32_5d
    module procedure kokkos_allocate_dv_r64_5d

    ! 6D specializations
    module procedure kokkos_allocate_dv_l_6d
    module procedure kokkos_allocate_dv_i32_6d
    module procedure kokkos_allocate_dv_i64_6d
    module procedure kokkos_allocate_dv_r32_6d
    module procedure kokkos_allocate_dv_r64_6d

    ! 7D specializations
    module procedure kokkos_allocate_dv_l_7d
    module procedure kokkos_allocate_dv_i32_7d
    module procedure kokkos_allocate_dv_i64_7d
    module procedure kokkos_allocate_dv_r32_7d
    module procedure kokkos_allocate_dv_r64_7d
  end interface kokkos_allocate_dualview
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

    ! 4D specializations
    module procedure kokkos_deallocate_dv_l_4d  
    module procedure kokkos_deallocate_dv_i32_4d
    module procedure kokkos_deallocate_dv_i64_4d
    module procedure kokkos_deallocate_dv_r32_4d
    module procedure kokkos_deallocate_dv_r64_4d

    ! 5D specializations
    module procedure kokkos_deallocate_dv_l_5d  
    module procedure kokkos_deallocate_dv_i32_5d
    module procedure kokkos_deallocate_dv_i64_5d
    module procedure kokkos_deallocate_dv_r32_5d
    module procedure kokkos_deallocate_dv_r64_5d

    ! 6D specializations
    module procedure kokkos_deallocate_dv_l_6d  
    module procedure kokkos_deallocate_dv_i32_6d
    module procedure kokkos_deallocate_dv_i64_6d
    module procedure kokkos_deallocate_dv_r32_6d
    module procedure kokkos_deallocate_dv_r64_6d

    ! 7D specializations
    module procedure kokkos_deallocate_dv_l_7d  
    module procedure kokkos_deallocate_dv_i32_7d
    module procedure kokkos_deallocate_dv_i64_7d
    module procedure kokkos_deallocate_dv_r32_7d
    module procedure kokkos_deallocate_dv_r64_7d
  end interface kokkos_deallocate_dualview
  interface 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_allocate_dv_l_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_l_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0      
    end subroutine f_kokkos_allocate_dv_l_1d

    subroutine f_kokkos_allocate_dv_i32_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_i32_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_i32_1d
  
    subroutine f_kokkos_allocate_dv_i64_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_i64_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_i64_1d

    subroutine f_kokkos_allocate_dv_r32_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_r32_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_r32_1d
  
    subroutine f_kokkos_allocate_dv_r64_1d(c_A, v_A, n_A, e0) &
      & bind (c, name='c_kokkos_allocate_dv_r64_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
    end subroutine f_kokkos_allocate_dv_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 2D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_allocate_dv_l_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_l_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_l_2d
  
    subroutine f_kokkos_allocate_dv_i32_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_i32_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_i32_2d

    subroutine f_kokkos_allocate_dv_i64_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_i64_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_i64_2d
  
    subroutine f_kokkos_allocate_dv_r32_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_r32_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_r32_2d

    subroutine f_kokkos_allocate_dv_r64_2d(c_A, v_A, n_A, e0, e1) &
      & bind (c, name='c_kokkos_allocate_dv_r64_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
    end subroutine f_kokkos_allocate_dv_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 3D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_allocate_dv_l_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_l_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_l_3d

    subroutine f_kokkos_allocate_dv_i32_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_i32_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_i32_3d
  
    subroutine f_kokkos_allocate_dv_i64_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_i64_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_i64_3d

    subroutine f_kokkos_allocate_dv_r32_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_r32_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_r32_3d
  
    subroutine f_kokkos_allocate_dv_r64_3d(c_A, v_A, n_A, e0, e1, e2) &
      & bind (c, name='c_kokkos_allocate_dv_r64_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
    end subroutine f_kokkos_allocate_dv_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 4D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_allocate_dv_l_4d(c_A, v_A, n_A, e0, e1, e2, e3) &
      & bind (c, name='c_kokkos_allocate_dv_l_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
    end subroutine f_kokkos_allocate_dv_l_4d

    subroutine f_kokkos_allocate_dv_i32_4d(c_A, v_A, n_A, e0, e1, e2, e3) &
      & bind (c, name='c_kokkos_allocate_dv_i32_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
    end subroutine f_kokkos_allocate_dv_i32_4d
  
    subroutine f_kokkos_allocate_dv_i64_4d(c_A, v_A, n_A, e0, e1, e2, e3) &
      & bind (c, name='c_kokkos_allocate_dv_i64_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
    end subroutine f_kokkos_allocate_dv_i64_4d

    subroutine f_kokkos_allocate_dv_r32_4d(c_A, v_A, n_A, e0, e1, e2, e3) &
      & bind (c, name='c_kokkos_allocate_dv_r32_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
    end subroutine f_kokkos_allocate_dv_r32_4d
  
    subroutine f_kokkos_allocate_dv_r64_4d(c_A, v_A, n_A, e0, e1, e2, e3) &
      & bind (c, name='c_kokkos_allocate_dv_r64_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
    end subroutine f_kokkos_allocate_dv_r64_4d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 5D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_allocate_dv_l_5d(c_A, v_A, n_A, e0, e1, e2, e3, e4) &
      & bind (c, name='c_kokkos_allocate_dv_l_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
    end subroutine f_kokkos_allocate_dv_l_5d

    subroutine f_kokkos_allocate_dv_i32_5d(c_A, v_A, n_A, e0, e1, e2, e3, e4) &
      & bind (c, name='c_kokkos_allocate_dv_i32_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
    end subroutine f_kokkos_allocate_dv_i32_5d
  
    subroutine f_kokkos_allocate_dv_i64_5d(c_A, v_A, n_A, e0, e1, e2, e3, e4) &
      & bind (c, name='c_kokkos_allocate_dv_i64_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
    end subroutine f_kokkos_allocate_dv_i64_5d

    subroutine f_kokkos_allocate_dv_r32_5d(c_A, v_A, n_A, e0, e1, e2, e3, e4) &
      & bind (c, name='c_kokkos_allocate_dv_r32_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
    end subroutine f_kokkos_allocate_dv_r32_5d
  
    subroutine f_kokkos_allocate_dv_r64_5d(c_A, v_A, n_A, e0, e1, e2, e3, e4) &
      & bind (c, name='c_kokkos_allocate_dv_r64_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
    end subroutine f_kokkos_allocate_dv_r64_5d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 6D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_allocate_dv_l_6d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5) &
      & bind (c, name='c_kokkos_allocate_dv_l_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
    end subroutine f_kokkos_allocate_dv_l_6d

    subroutine f_kokkos_allocate_dv_i32_6d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5) &
      & bind (c, name='c_kokkos_allocate_dv_i32_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
    end subroutine f_kokkos_allocate_dv_i32_6d
  
    subroutine f_kokkos_allocate_dv_i64_6d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5) &
      & bind (c, name='c_kokkos_allocate_dv_i64_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
    end subroutine f_kokkos_allocate_dv_i64_6d

    subroutine f_kokkos_allocate_dv_r32_6d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5) &
      & bind (c, name='c_kokkos_allocate_dv_r32_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
    end subroutine f_kokkos_allocate_dv_r32_6d
  
    subroutine f_kokkos_allocate_dv_r64_6d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5) &
      & bind (c, name='c_kokkos_allocate_dv_r64_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
    end subroutine f_kokkos_allocate_dv_r64_6d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_allocate_dualview 7D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_allocate_dv_l_7d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6) &
      & bind (c, name='c_kokkos_allocate_dv_l_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
    end subroutine f_kokkos_allocate_dv_l_7d

    subroutine f_kokkos_allocate_dv_i32_7d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6) &
      & bind (c, name='c_kokkos_allocate_dv_i32_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
    end subroutine f_kokkos_allocate_dv_i32_7d
  
    subroutine f_kokkos_allocate_dv_i64_7d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6) &
      & bind (c, name='c_kokkos_allocate_dv_i64_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
    end subroutine f_kokkos_allocate_dv_i64_7d

    subroutine f_kokkos_allocate_dv_r32_7d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6) &
      & bind (c, name='c_kokkos_allocate_dv_r32_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
    end subroutine f_kokkos_allocate_dv_r32_7d
  
    subroutine f_kokkos_allocate_dv_r64_7d(c_A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6) &
      & bind (c, name='c_kokkos_allocate_dv_r64_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: c_A
      type(c_ptr), intent(out) :: v_A
      character(kind=c_char), intent(in) :: n_A(*)
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
    end subroutine f_kokkos_allocate_dv_r64_7d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 1D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_deallocate_dv_l_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_1d

    subroutine f_kokkos_deallocate_dv_i32_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_1d

    subroutine f_kokkos_deallocate_dv_i64_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_1d

    subroutine f_kokkos_deallocate_dv_r32_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_1d

    subroutine f_kokkos_deallocate_dv_r64_1d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_1d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 2D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_deallocate_dv_l_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_2d

    subroutine f_kokkos_deallocate_dv_i32_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_2d

    subroutine f_kokkos_deallocate_dv_i64_2d(v_A) &
    & bind (c, name='c_kokkos_deallocate_dv_i64_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_2d

    subroutine f_kokkos_deallocate_dv_r32_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_2d

    subroutine f_kokkos_deallocate_dv_r64_2d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_2d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 3D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_deallocate_dv_l_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_3d

    subroutine f_kokkos_deallocate_dv_i32_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_3d

    subroutine f_kokkos_deallocate_dv_i64_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_3d

    subroutine f_kokkos_deallocate_dv_r32_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_3d

    subroutine f_kokkos_deallocate_dv_r64_3d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_3d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 4D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_deallocate_dv_l_4d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_4d

    subroutine f_kokkos_deallocate_dv_i32_4d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_4d

    subroutine f_kokkos_deallocate_dv_i64_4d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_4d

    subroutine f_kokkos_deallocate_dv_r32_4d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_4d

    subroutine f_kokkos_deallocate_dv_r64_4d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_4d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_4d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 5D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_deallocate_dv_l_5d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_5d

    subroutine f_kokkos_deallocate_dv_i32_5d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_5d

    subroutine f_kokkos_deallocate_dv_i64_5d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_5d

    subroutine f_kokkos_deallocate_dv_r32_5d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_5d

    subroutine f_kokkos_deallocate_dv_r64_5d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_5d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_5d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 6D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_deallocate_dv_l_6d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_6d

    subroutine f_kokkos_deallocate_dv_i32_6d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_6d

    subroutine f_kokkos_deallocate_dv_i64_6d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_6d

    subroutine f_kokkos_deallocate_dv_r32_6d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_6d

    subroutine f_kokkos_deallocate_dv_r64_6d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_6d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_6d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos_deallocate_dualview 7D interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_deallocate_dv_l_7d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_l_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_l_7d

    subroutine f_kokkos_deallocate_dv_i32_7d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i32_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i32_7d

    subroutine f_kokkos_deallocate_dv_i64_7d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_i64_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_i64_7d

    subroutine f_kokkos_deallocate_dv_r32_7d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r32_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r32_7d

    subroutine f_kokkos_deallocate_dv_r64_7d(v_A) &
      & bind (c, name='c_kokkos_deallocate_dv_r64_7d')
      import
      implicit none
      type(c_ptr), intent(out) :: v_A
    end subroutine f_kokkos_deallocate_dv_r64_7d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  end interface
  contains
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 1D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_1d(A, v_A, n_A, e0)
      logical(flcl_dualview_l_f_t), pointer, dimension(:), intent(inout) :: A
      type(dualview_l_1d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_1d(c_A, v_A%handle, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_l_1d
  
    subroutine kokkos_allocate_dv_i32_1d(A, v_A, n_A, e0)
      integer (flcl_dualview_i32_f_t), pointer, dimension(:), intent(inout) :: A
      type(dualview_i32_1d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_1d(c_A, v_A%handle, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_i32_1d
  
    subroutine kokkos_allocate_dv_i64_1d(A, v_A, n_A, e0)
      integer(flcl_dualview_i64_f_t), pointer, dimension(:), intent(inout) :: A
      type(dualview_i64_1d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      type(c_ptr) :: c_A
      
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_1d(c_A, v_A%handle, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_i64_1d
  
    subroutine kokkos_allocate_dv_r32_1d(A, v_A, n_A, e0)
      real(flcl_dualview_r32_f_t), pointer, dimension(:), intent(inout) :: A
      type(dualview_r32_1d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_1d(c_A, v_A%handle, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_r32_1d
  
    subroutine kokkos_allocate_dv_r64_1d(A, v_A, n_A, e0)
      real(flcl_dualview_r64_f_t), pointer, dimension(:), intent(inout) :: A
      type(dualview_r64_1d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_1d(c_A, v_A%handle, f_label, e0)
      call c_f_pointer(c_A, A, shape=[e0])
    end subroutine kokkos_allocate_dv_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 2D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_2d(A, v_A, n_A, e0, e1)
      logical(flcl_dualview_l_f_t), pointer, dimension(:,:), intent(inout) :: A
      type(dualview_l_2d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_2d(c_A, v_A%handle, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_l_2d
  
    subroutine kokkos_allocate_dv_i32_2d(A, v_A, n_A, e0, e1)
      integer(flcl_dualview_i32_f_t), pointer, dimension(:,:), intent(inout) :: A
      type(dualview_i32_2d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_2d(c_A, v_A%handle, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_i32_2d
  
    subroutine kokkos_allocate_dv_i64_2d(A, v_A, n_A, e0, e1)
      integer (flcl_dualview_i64_f_t), pointer, dimension(:,:), intent(inout) :: A
      type(dualview_i64_2d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_2d(c_A, v_A%handle, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_i64_2d
  
    subroutine kokkos_allocate_dv_r32_2d(A, v_A, n_A, e0, e1)
      real(flcl_dualview_r32_f_t), pointer, dimension(:,:), intent(inout) :: A
      type(dualview_r32_2d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_2d(c_A, v_A%handle, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_r32_2d
  
    subroutine kokkos_allocate_dv_r64_2d(A, v_A, n_A, e0, e1)
      real(flcl_dualview_r64_f_t), pointer, dimension(:,:), intent(inout) :: A
      type(dualview_r64_2d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_2d(c_A, v_A%handle, f_label, e0, e1)
      call c_f_pointer(c_A, A, shape=[e0,e1])
    end subroutine kokkos_allocate_dv_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 3D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_3d(A, v_A, n_A, e0, e1, e2)
      logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:), intent(inout) :: A
      type(dualview_l_3d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_3d(c_A, v_A%handle, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_l_3d
  
    subroutine kokkos_allocate_dv_i32_3d(A, v_A, n_A, e0, e1, e2)
      integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:), intent(inout) :: A
      type(dualview_i32_3d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_3d(c_A, v_A%handle, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_i32_3d
  
    subroutine kokkos_allocate_dv_i64_3d(A, v_A, n_A, e0, e1, e2)
      integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:), intent(inout) :: A
      type(dualview_i64_3d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_3d(c_A, v_A%handle, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_i64_3d
  
    subroutine kokkos_allocate_dv_r32_3d(A, v_A, n_A, e0, e1, e2)
      real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:), intent(inout) :: A
      type(dualview_r32_3d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
  
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_3d(c_A, v_A%handle, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_r32_3d
  
    subroutine kokkos_allocate_dv_r64_3d(A, v_A, n_A, e0, e1, e2)
      real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:), intent(inout) :: A
      type(dualview_r64_3d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label

      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_3d(c_A, v_A%handle, f_label, e0, e1, e2)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2])
    end subroutine kokkos_allocate_dv_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 4D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_4d(A, v_A, n_A, e0, e1, e2, e3)
      logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
      type(dualview_l_4d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_4d(c_A, v_A%handle, f_label, e0, e1, e2, e3)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3])
    end subroutine kokkos_allocate_dv_l_4d
  
    subroutine kokkos_allocate_dv_i32_4d(A, v_A, n_A, e0, e1, e2, e3)
      integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
      type(dualview_i32_4d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_4d(c_A, v_A%handle, f_label, e0, e1, e2, e3)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3])
    end subroutine kokkos_allocate_dv_i32_4d
  
    subroutine kokkos_allocate_dv_i64_4d(A, v_A, n_A, e0, e1, e2, e3)
      integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
      type(dualview_i64_4d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_4d(c_A, v_A%handle, f_label, e0, e1, e2, e3)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3])
    end subroutine kokkos_allocate_dv_i64_4d
  
    subroutine kokkos_allocate_dv_r32_4d(A, v_A, n_A, e0, e1, e2, e3)
      real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
      type(dualview_r32_4d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
  
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_4d(c_A, v_A%handle, f_label, e0, e1, e2, e3)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3])
    end subroutine kokkos_allocate_dv_r32_4d
  
    subroutine kokkos_allocate_dv_r64_4d(A, v_A, n_A, e0, e1, e2, e3)
      real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
      type(dualview_r64_4d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label

      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_4d(c_A, v_A%handle, f_label, e0, e1, e2, e3)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3])
    end subroutine kokkos_allocate_dv_r64_4d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 5D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_5d(A, v_A, n_A, e0, e1, e2, e3, e4)
      logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
      type(dualview_l_5d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_5d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4])
    end subroutine kokkos_allocate_dv_l_5d
  
    subroutine kokkos_allocate_dv_i32_5d(A, v_A, n_A, e0, e1, e2, e3, e4)
      integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
      type(dualview_i32_5d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_5d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4])
    end subroutine kokkos_allocate_dv_i32_5d
  
    subroutine kokkos_allocate_dv_i64_5d(A, v_A, n_A, e0, e1, e2, e3, e4)
      integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
      type(dualview_i64_5d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_5d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4])
    end subroutine kokkos_allocate_dv_i64_5d
  
    subroutine kokkos_allocate_dv_r32_5d(A, v_A, n_A, e0, e1, e2, e3, e4)
      real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
      type(dualview_r32_5d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
  
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_5d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4])
    end subroutine kokkos_allocate_dv_r32_5d
  
    subroutine kokkos_allocate_dv_r64_5d(A, v_A, n_A, e0, e1, e2, e3, e4)
      real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
      type(dualview_r64_5d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label

      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_5d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4])
    end subroutine kokkos_allocate_dv_r64_5d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 6D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_6d(A, v_A, n_A, e0, e1, e2, e3, e4, e5)
      logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
      type(dualview_l_6d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_6d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5])
    end subroutine kokkos_allocate_dv_l_6d
  
    subroutine kokkos_allocate_dv_i32_6d(A, v_A, n_A, e0, e1, e2, e3, e4, e5)
      integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
      type(dualview_i32_6d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_6d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5])
    end subroutine kokkos_allocate_dv_i32_6d
  
    subroutine kokkos_allocate_dv_i64_6d(A, v_A, n_A, e0, e1, e2, e3, e4, e5)
      integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
      type(dualview_i64_6d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_6d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5])
    end subroutine kokkos_allocate_dv_i64_6d
  
    subroutine kokkos_allocate_dv_r32_6d(A, v_A, n_A, e0, e1, e2, e3, e4, e5)
      real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
      type(dualview_r32_6d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
  
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_6d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5])
    end subroutine kokkos_allocate_dv_r32_6d
  
    subroutine kokkos_allocate_dv_r64_6d(A, v_A, n_A, e0, e1, e2, e3, e4, e5)
      real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
      type(dualview_r64_6d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label

      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_6d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5])
    end subroutine kokkos_allocate_dv_r64_6d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos allocate dualview 7D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine kokkos_allocate_dv_l_7d(A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6)
      logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
      type(dualview_l_7d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_l_7d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5, e6)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5,e6])
    end subroutine kokkos_allocate_dv_l_7d
  
    subroutine kokkos_allocate_dv_i32_7d(A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6)
      integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
      type(dualview_i32_7d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i32_7d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5, e6)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5,e6])
    end subroutine kokkos_allocate_dv_i32_7d
  
    subroutine kokkos_allocate_dv_i64_7d(A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6)
      integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
      type(dualview_i64_7d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
      
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_i64_7d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5, e6)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5,e6])
    end subroutine kokkos_allocate_dv_i64_7d
  
    subroutine kokkos_allocate_dv_r32_7d(A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6)
      real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
      type(dualview_r32_7d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
      type(c_ptr) :: c_A
  
      character(len=:, kind=c_char), allocatable, target :: f_label
  
      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r32_7d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5, e6)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5,e6])
    end subroutine kokkos_allocate_dv_r32_7d
  
    subroutine kokkos_allocate_dv_r64_7d(A, v_A, n_A, e0, e1, e2, e3, e4, e5, e6)
      real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
      type(dualview_r64_7d_t), intent(out) :: v_A
      character(len=*), intent(in) :: n_A
      integer(flcl_dualview_index_f_t), intent(in) :: e0
      integer(flcl_dualview_index_f_t), intent(in) :: e1
      integer(flcl_dualview_index_f_t), intent(in) :: e2
      integer(flcl_dualview_index_f_t), intent(in) :: e3
      integer(flcl_dualview_index_f_t), intent(in) :: e4
      integer(flcl_dualview_index_f_t), intent(in) :: e5
      integer(flcl_dualview_index_f_t), intent(in) :: e6
      type(c_ptr) :: c_A

      character(len=:, kind=c_char), allocatable, target :: f_label

      call char_add_null( n_A, f_label )
      call f_kokkos_allocate_dv_r64_7d(c_A, v_A%handle, f_label, e0, e1, e2, e3, e4, e5, e6)
      call c_f_pointer(c_A, A, shape=[e0,e1,e2,e3,e4,e5,e6])
    end subroutine kokkos_allocate_dv_r64_7d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 1D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_1d(A, v_A )
    logical(flcl_dualview_l_f_t), pointer, dimension(:), intent(inout) :: A
    type(dualview_l_1d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_1d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_1d

  subroutine kokkos_deallocate_dv_i32_1d(A, v_A )
    integer(flcl_dualview_i32_f_t), pointer, dimension(:), intent(inout) :: A
    type(dualview_i32_1d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_1d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_1d

  subroutine kokkos_deallocate_dv_i64_1d(A, v_A )
    integer(flcl_dualview_i64_f_t), pointer, dimension(:), intent(inout) :: A
    type(dualview_i64_1d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_1d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_1d

  subroutine kokkos_deallocate_dv_r32_1d(A, v_A )
    real(flcl_dualview_r32_f_t), pointer, dimension(:), intent(inout) :: A
    type(dualview_r32_1d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_1d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_1d

  subroutine kokkos_deallocate_dv_r64_1d(A, v_A )
    real(flcl_dualview_r64_f_t), pointer, dimension(:), intent(inout) :: A
    type(dualview_r64_1d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_1d(v_A%handle)
    v_A%handle = c_null_ptr

    ! TODO ADD DUALVIEW TESTS
    ! TODO ADD DUALVIEW METHODS 4D-7D
  end subroutine kokkos_deallocate_dv_r64_1d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 2D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_2d(A, v_A )
    logical(flcl_dualview_l_f_t), pointer, dimension(:,:), intent(inout) :: A
    type(dualview_l_2d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_2d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_2d

  subroutine kokkos_deallocate_dv_i32_2d(A, v_A )
    integer(flcl_dualview_i32_f_t), pointer, dimension(:,:), intent(inout) :: A
    type(dualview_i32_2d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_2d(v_A%handle)  
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_2d

  subroutine kokkos_deallocate_dv_i64_2d(A, v_A )
    integer(flcl_dualview_i64_f_t), pointer, dimension(:,:), intent(inout) :: A
    type(dualview_i64_2d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_2d(v_A%handle)  
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_2d

  subroutine kokkos_deallocate_dv_r32_2d(A, v_A )
    real(flcl_dualview_r32_f_t), pointer, dimension(:,:), intent(inout) :: A
    type(dualview_r32_2d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_2d(v_A%handle)  
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_2d

  subroutine kokkos_deallocate_dv_r64_2d(A, v_A )
    real(flcl_dualview_r64_f_t), pointer, dimension(:,:), intent(inout) :: A
    type(dualview_r64_2d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_2d(v_A%handle)  
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_2d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 3D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_3d(A, v_A )
    logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:), intent(inout) :: A
    type(dualview_l_3d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_3d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_3d

  subroutine kokkos_deallocate_dv_i32_3d(A, v_A )
    integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:), intent(inout) :: A
    type(dualview_i32_3d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_3d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_3d

  subroutine kokkos_deallocate_dv_i64_3d(A, v_A )
    integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:), intent(inout) :: A
    type(dualview_i64_3d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_3d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_3d

  subroutine kokkos_deallocate_dv_r32_3d(A, v_A )
    real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:), intent(inout) :: A
    type(dualview_r32_3d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_3d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_3d

  subroutine kokkos_deallocate_dv_r64_3d(A, v_A )
    real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:), intent(inout) :: A
    type(dualview_r64_3d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_3d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_3d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 4D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_4d(A, v_A )
    logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
    type(dualview_l_4d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_4d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_4d

  subroutine kokkos_deallocate_dv_i32_4d(A, v_A )
    integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
    type(dualview_i32_4d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_4d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_4d

  subroutine kokkos_deallocate_dv_i64_4d(A, v_A )
    integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
    type(dualview_i64_4d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_4d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_4d

  subroutine kokkos_deallocate_dv_r32_4d(A, v_A )
    real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
    type(dualview_r32_4d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_4d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_4d

  subroutine kokkos_deallocate_dv_r64_4d(A, v_A )
    real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:), intent(inout) :: A
    type(dualview_r64_4d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_4d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_4d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 5D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_5d(A, v_A )
    logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
    type(dualview_l_5d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_5d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_5d

  subroutine kokkos_deallocate_dv_i32_5d(A, v_A )
    integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
    type(dualview_i32_5d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_5d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_5d

  subroutine kokkos_deallocate_dv_i64_5d(A, v_A )
    integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
    type(dualview_i64_5d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_5d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_5d

  subroutine kokkos_deallocate_dv_r32_5d(A, v_A )
    real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
    type(dualview_r32_5d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_5d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_5d

  subroutine kokkos_deallocate_dv_r64_5d(A, v_A )
    real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:), intent(inout) :: A
    type(dualview_r64_5d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_5d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_5d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 6D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_6d(A, v_A )
    logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
    type(dualview_l_6d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_6d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_6d

  subroutine kokkos_deallocate_dv_i32_6d(A, v_A )
    integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
    type(dualview_i32_6d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_6d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_6d

  subroutine kokkos_deallocate_dv_i64_6d(A, v_A )
    integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
    type(dualview_i64_6d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_6d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_6d

  subroutine kokkos_deallocate_dv_r32_6d(A, v_A )
    real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
    type(dualview_r32_6d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_6d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_6d

  subroutine kokkos_deallocate_dv_r64_6d(A, v_A )
    real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: A
    type(dualview_r64_6d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_6d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_6d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos deallocate dualview 7D implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_deallocate_dv_l_7d(A, v_A )
    logical(flcl_dualview_l_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
    type(dualview_l_7d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_l_7d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_l_7d

  subroutine kokkos_deallocate_dv_i32_7d(A, v_A )
    integer(flcl_dualview_i32_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
    type(dualview_i32_7d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i32_7d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i32_7d

  subroutine kokkos_deallocate_dv_i64_7d(A, v_A )
    integer(flcl_dualview_i64_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
    type(dualview_i64_7d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_i64_7d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_i64_7d

  subroutine kokkos_deallocate_dv_r32_7d(A, v_A )
    real(flcl_dualview_r32_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
    type(dualview_r32_7d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r32_7d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r32_7d

  subroutine kokkos_deallocate_dv_r64_7d(A, v_A )
    real(flcl_dualview_r64_f_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: A
    type(dualview_r64_7d_t), intent(inout) :: v_A

    A => NULL()
    call f_kokkos_deallocate_dv_r64_7d(v_A%handle)
    v_A%handle = c_null_ptr

  end subroutine kokkos_deallocate_dv_r64_7d
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! view_ptr_dualview 1d implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type(c_ptr) function view_ptr_dualview_l_1d_t( self ) result( result_ptr )
    class( dualview_l_1d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_l_1d_t

  type(c_ptr) function view_ptr_dualview_i32_1d_t( self ) result( result_ptr )
    class( dualview_i32_1d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i32_1d_t

  type(c_ptr) function view_ptr_dualview_i64_1d_t( self ) result( result_ptr )
    class( dualview_i64_1d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i64_1d_t

  type(c_ptr) function view_ptr_dualview_r32_1d_t( self ) result( result_ptr )
    class( dualview_r32_1d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r32_1d_t

  type(c_ptr) function view_ptr_dualview_r64_1d_t( self ) result( result_ptr )
    class( dualview_r64_1d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r64_1d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! view_ptr_dualview 2d implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type(c_ptr) function view_ptr_dualview_l_2d_t( self ) result( result_ptr )
    class( dualview_l_2d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_l_2d_t

  type(c_ptr) function view_ptr_dualview_i32_2d_t( self ) result( result_ptr )
    class( dualview_i32_2d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i32_2d_t

  type(c_ptr) function view_ptr_dualview_i64_2d_t( self ) result( result_ptr )
    class( dualview_i64_2d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i64_2d_t

  type(c_ptr) function view_ptr_dualview_r32_2d_t( self ) result( result_ptr )
    class( dualview_r32_2d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r32_2d_t

  type(c_ptr) function view_ptr_dualview_r64_2d_t( self ) result( result_ptr )
    class( dualview_r64_2d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r64_2d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! view_ptr_dualview 3d implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type(c_ptr) function view_ptr_dualview_l_3d_t( self ) result( result_ptr )
    class( dualview_l_3d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_l_3d_t

  type(c_ptr) function view_ptr_dualview_i32_3d_t( self ) result( result_ptr )
    class( dualview_i32_3d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i32_3d_t

  type(c_ptr) function view_ptr_dualview_i64_3d_t( self ) result( result_ptr )
    class( dualview_i64_3d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i64_3d_t

  type(c_ptr) function view_ptr_dualview_r32_3d_t( self ) result( result_ptr )
    class( dualview_r32_3d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r32_3d_t

  type(c_ptr) function view_ptr_dualview_r64_3d_t( self ) result( result_ptr )
    class( dualview_r64_3d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r64_3d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! view_ptr_dualview 4d implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type(c_ptr) function view_ptr_dualview_l_4d_t( self ) result( result_ptr )
    class( dualview_l_4d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_l_4d_t

  type(c_ptr) function view_ptr_dualview_i32_4d_t( self ) result( result_ptr )
    class( dualview_i32_4d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i32_4d_t

  type(c_ptr) function view_ptr_dualview_i64_4d_t( self ) result( result_ptr )
    class( dualview_i64_4d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i64_4d_t

  type(c_ptr) function view_ptr_dualview_r32_4d_t( self ) result( result_ptr )
    class( dualview_r32_4d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r32_4d_t

  type(c_ptr) function view_ptr_dualview_r64_4d_t( self ) result( result_ptr )
    class( dualview_r64_4d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r64_4d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! view_ptr_dualview 5d implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type(c_ptr) function view_ptr_dualview_l_5d_t( self ) result( result_ptr )
    class( dualview_l_5d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_l_5d_t

  type(c_ptr) function view_ptr_dualview_i32_5d_t( self ) result( result_ptr )
    class( dualview_i32_5d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i32_5d_t

  type(c_ptr) function view_ptr_dualview_i64_5d_t( self ) result( result_ptr )
    class( dualview_i64_5d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i64_5d_t

  type(c_ptr) function view_ptr_dualview_r32_5d_t( self ) result( result_ptr )
    class( dualview_r32_5d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r32_5d_t

  type(c_ptr) function view_ptr_dualview_r64_5d_t( self ) result( result_ptr )
    class( dualview_r64_5d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r64_5d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! view_ptr_dualview 6d implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type(c_ptr) function view_ptr_dualview_l_6d_t( self ) result( result_ptr )
    class( dualview_l_6d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_l_6d_t

  type(c_ptr) function view_ptr_dualview_i32_6d_t( self ) result( result_ptr )
    class( dualview_i32_6d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i32_6d_t

  type(c_ptr) function view_ptr_dualview_i64_6d_t( self ) result( result_ptr )
    class( dualview_i64_6d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i64_6d_t

  type(c_ptr) function view_ptr_dualview_r32_6d_t( self ) result( result_ptr )
    class( dualview_r32_6d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r32_6d_t

  type(c_ptr) function view_ptr_dualview_r64_6d_t( self ) result( result_ptr )
    class( dualview_r64_6d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r64_6d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! view_ptr_dualview 7d implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  type(c_ptr) function view_ptr_dualview_l_7d_t( self ) result( result_ptr )
    class( dualview_l_7d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_l_7d_t

  type(c_ptr) function view_ptr_dualview_i32_7d_t( self ) result( result_ptr )
    class( dualview_i32_7d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i32_7d_t

  type(c_ptr) function view_ptr_dualview_i64_7d_t( self ) result( result_ptr )
    class( dualview_i64_7d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_i64_7d_t

  type(c_ptr) function view_ptr_dualview_r32_7d_t( self ) result( result_ptr )
    class( dualview_r32_7d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r32_7d_t

  type(c_ptr) function view_ptr_dualview_r64_7d_t( self ) result( result_ptr )
    class( dualview_r64_7d_t ), intent(in) :: self
    result_ptr = self%handle
  end function view_ptr_dualview_r64_7d_t
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! fin
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end module flcl_dualview_mod
