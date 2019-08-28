module test_flcl_f_mod
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env

  use :: flcl_mod

  implicit none
  
  integer(c_size_t), parameter :: e0_length = 10
  integer(c_size_t), parameter :: e1_length = 11
  logical(c_bool), parameter :: logical_pre = .true.
  logical(c_bool), parameter :: logical_post = .false.

  public

    interface
      subroutine f_kokkos_initialize() &
        bind(c, name='c_kokkos_initialize')
        use, intrinsic :: iso_c_binding
        implicit none
      end subroutine f_kokkos_initialize
    end interface

    interface
      subroutine f_kokkos_finalize() &
        bind(c, name='c_kokkos_finalize')
        use, intrinsic :: iso_c_binding
        implicit none
      end subroutine f_kokkos_finalize
    end interface

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

    contains

      subroutine kokkos_initialize()
        use, intrinsic :: iso_c_binding
        implicit none
        call f_kokkos_initialize()
      end subroutine kokkos_initialize
      
      subroutine kokkos_finalize()
        use, intrinsic :: iso_c_binding
        implicit none
        call f_kokkos_finalize()
      end subroutine kokkos_finalize

      subroutine test_ndarray_l_1d()
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
        else
          write(*,*)'FAILED ndarry_l_1d'
        end if
      end subroutine test_ndarray_l_1d

      subroutine test_ndarray_i32_1d()
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
        else
          write(*,*)'FAILED ndarray_i32_1d'
        end if
      end subroutine test_ndarray_i32_1d

      subroutine test_ndarray_i64_1d()
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
        else
          write(*,*)'FAILED ndarray_i64_1d'
        end if
      end subroutine test_ndarray_i64_1d

      subroutine test_ndarray_r32_1d()
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
        else
          write(*,*)'FAILED ndarray_r32_1d'
        end if
      end subroutine test_ndarray_r32_1d
  
      subroutine test_ndarray_r64_1d()
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
        else
          write(*,*)'FAILED ndarray_r64_1d'
        end if
      end subroutine test_ndarray_r64_1d

      subroutine test_ndarray_l_2d()
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
        else
          write(*,*)'FAILED ndarry_l_2d'
        end if
      end subroutine test_ndarray_l_2d
  
      subroutine test_ndarray_i32_2d()
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
        else
          write(*,*)'FAILED ndarray_i32_2d'
        end if
      end subroutine test_ndarray_i32_2d

      subroutine test_ndarray_i64_2d()
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
        else
          write(*,*)'FAILED ndarray_i64_2d'
        end if
      end subroutine test_ndarray_i64_2d

      subroutine test_ndarray_r32_2d()
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
        else
          write(*,*)'FAILED ndarray_r32_2d'
        end if
      end subroutine test_ndarray_r32_2d
  
      subroutine test_ndarray_r64_2d()
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
        else
          write(*,*)'FAILED ndarray_r64_2d'
        end if
      end subroutine test_ndarray_r64_2d

end module test_flcl_f_mod