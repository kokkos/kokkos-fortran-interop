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

module flcl_util_kokkos_mod
    use, intrinsic :: iso_c_binding
    use, intrinsic :: iso_fortran_env

    implicit none
    private

    public :: &
      & kokkos_initialize, &
      & kokkos_initialize_without_args, &
      & kokkos_finalize, &
      & kokkos_print_configuration, &
      & kokkos_is_initialized

  interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos library initialization interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_initialize(argc, argv) &
      & bind(c, name="c_kokkos_initialize")
        import
        implicit none
        integer(c_int), intent(inout) :: argc
        type(c_ptr), value :: argv
    end subroutine f_kokkos_initialize

    subroutine f_kokkos_initialize_without_args() &
      bind(c, name='c_kokkos_initialize_without_args')
      implicit none
    end subroutine f_kokkos_initialize_without_args
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos library finalization interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_finalize() &
      & bind(c, name="c_kokkos_finalize")
    end subroutine f_kokkos_finalize
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos library helper routine interfaces
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    subroutine f_kokkos_print_configuration( file_name_in ) &
      & bind(c, name='c_kokkos_print_configuration')
      import
      implicit none
      character(kind=c_char), intent(in) :: file_name_in(*)
    end subroutine f_kokkos_print_configuration

    function f_kokkos_is_initialized() result(is_init) &
      & bind(c, name='c_kokkos_is_initialized')
      import
      implicit none
      logical(c_bool) :: is_init
    end function f_kokkos_is_initialized
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  end interface
  contains
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos library initialization implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_initialize()
    integer :: arg_count, max_length = 0, str_length, n, cli_count
    character(kind=c_char, len=:), allocatable :: str
    character(kind=c_char), allocatable, target :: strs_array(:,:)
    type(c_ptr), allocatable, target :: c_strs(:)

    arg_count = command_argument_count()
    ! include command name
    do n = 0, arg_count
      call get_command_argument(n, length=str_length)
      max_length = max(max_length, str_length)
    end do

    allocate(strs_array(1:max_length + 1, 0:arg_count))
    allocate(c_strs(0:arg_count))
    allocate(character(max_length) :: str)

    do n = 0, arg_count
      call get_command_argument(n, value=str, length=str_length)
      strs_array(1:str_length, n) = transfer(str, ' ', size=str_length)
      strs_array(str_length+1, n) = c_null_char
      c_strs(n) = c_loc(strs_array(:,n))
    end do

    cli_count = arg_count + 1
    if( cli_count .le. 0 ) then
       ! must call the without_args variant or get array-oob error
       call f_kokkos_initialize_without_args()
    else
       call f_kokkos_initialize(cli_count, c_loc(c_strs(0)))
    endif

    deallocate(strs_array)
    deallocate(c_strs)
    deallocate(str)

  end subroutine kokkos_initialize
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_initialize_without_args()
    call f_kokkos_initialize_without_args()
  end subroutine kokkos_initialize_without_args
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos library finalization implementation
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_finalize()
    call f_kokkos_finalize
  end subroutine kokkos_finalize
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! kokkos library helper routine implementations
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  subroutine kokkos_print_configuration( file_name_in )
    use flcl_util_strings_mod, only: char_add_null
    implicit none

    character(len=*), intent(in) :: file_name_in
    character(len=:, kind=c_char), allocatable, target :: file_name_out

    call char_add_null( file_name_in, file_name_out )

    call f_kokkos_print_configuration( file_name_out )

  end subroutine kokkos_print_configuration
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  function kokkos_is_initialized() result(is_init)
    logical :: is_init
    logical(c_bool) :: c_is_init
    c_is_init = f_kokkos_is_initialized()
    is_init = logical(c_is_init)
  end function kokkos_is_initialized
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end module flcl_util_kokkos_mod
