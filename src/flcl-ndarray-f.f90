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

module flcl_ndarray_mod
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env
  
  implicit none
  private
  
  public nd_array_t
  public to_nd_array
  public ND_ARRAY_MAX_RANK

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
  contains
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
end module flcl_ndarray_mod