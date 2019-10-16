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

module flcl_util_mod
    use, intrinsic :: iso_c_binding
    use, intrinsic :: iso_fortran_env
    
    implicit none
    private

    public :: &
      & kokkos_initialize, &
      & kokkos_initialize_without_args, &
      & kokkos_finalize

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos library initialization interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  interface
    subroutine f_kokkos_initialize(argc, argv) &
      & bind(c, name="c_kokkos_initialize")
        use, intrinsic :: iso_c_binding, only : c_int, c_ptr
        integer(c_int), intent(inout) :: argc
        type(c_ptr), value :: argv
    end subroutine f_kokkos_initialize
  end interface

  interface
    subroutine f_kokkos_initialize_without_args() &
      bind(c, name='c_kokkos_initialize_without_args')
      use, intrinsic :: iso_c_binding
      implicit none
    end subroutine f_kokkos_initialize_without_args
  end interface

  interface
    subroutine f_kokkos_finalize() &
      & bind(c, name="c_kokkos_finalize")  
    end subroutine f_kokkos_finalize
  end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  contains
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos initialize implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_initialize()
    use, intrinsic :: iso_c_binding
    implicit none
    integer :: arg_count, max_length = 0, str_length, n, cli_count
    character(kind=c_char, len=:), allocatable, target :: strs(:)
    type(c_ptr), allocatable, target :: c_strs(:)

    arg_count = command_argument_count()
    ! include command name
    do n = 0, arg_count
      call get_command_argument(n, length=str_length)
      max_length = max(max_length, str_length)
    end do

    allocate(character(max_length + 1) :: strs(arg_count + 1))
    allocate(c_strs(arg_count + 1))

    do n = 0, arg_count
      call get_command_argument(n, length=str_length)
      call get_command_argument(n, value=strs(n), length=str_length)
      strs(n)(str_length + 1:str_length + 1) = c_null_char
      c_strs(n) = c_loc(strs(n))
    end do

    cli_count = arg_count + 1
    call f_kokkos_initialize(cli_count, c_loc(c_strs(0)))
  end subroutine kokkos_initialize

  subroutine kokkos_initialize_without_args()
    use, intrinsic :: iso_c_binding
    implicit none
    call f_kokkos_initialize_without_args()
  end subroutine kokkos_initialize_without_args

  subroutine kokkos_finalize()
    use, intrinsic :: iso_c_binding
    implicit none
    call f_kokkos_finalize
  end subroutine kokkos_finalize

end module flcl_util_mod