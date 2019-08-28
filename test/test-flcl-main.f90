program test_flcl_main
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env

  use :: flcl_mod
  use :: test_flcl_f_mod

  implicit none

  integer :: m
  integer :: ii
  integer :: refine_count
  integer :: refine_steps
  real(c_double) :: percentage
  integer(c_int32_t) ::dimension
  integer :: block_size
  integer(c_int32_t) :: ntop
  integer(c_int32_t) :: nchunks
  integer(c_int32_t), dimension(:), pointer :: mesh_ids
  integer(c_int32_t), dimension(:), allocatable, target :: mesh_status
  integer(c_int32_t), dimension(:), allocatable, target :: new_mesh_status
  integer(c_int32_t), dimension(:), pointer :: p_mesh_status
  integer(c_int32_t), dimension(:), pointer :: p_new_mesh_status
  integer(c_int32_t), dimension(:), pointer :: p_ltop
  real(c_double), dimension(:), pointer :: array_x
  real(c_double), dimension(:), pointer :: array_y
  real(c_double) :: s_val
  type(c_ptr) :: v_x
  type(c_ptr) :: v_y

  call kokkos_initialize()

  call test_ndarray_l_1d()
  call test_ndarray_i32_1d()
  call test_ndarray_i64_1d()
  call test_ndarray_r32_1d()
  call test_ndarray_r64_1d()

  call test_ndarray_l_2d()
  call test_ndarray_i32_2d()
  call test_ndarray_i64_2d()
  call test_ndarray_r32_2d()
  call test_ndarray_r64_2d()

  call kokkos_finalize()


end program test_flcl_main