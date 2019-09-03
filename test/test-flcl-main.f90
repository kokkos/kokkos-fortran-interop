program test_flcl_main
  use, intrinsic :: iso_c_binding
  use, intrinsic :: iso_fortran_env

  use :: flcl_mod
  use :: test_flcl_f_mod

  implicit none

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

  call test_ndarray_l_3d()
  call test_ndarray_i32_3d()
  call test_ndarray_i64_3d()
  call test_ndarray_r32_3d()
  call test_ndarray_r64_3d()

  call kokkos_finalize()


end program test_flcl_main