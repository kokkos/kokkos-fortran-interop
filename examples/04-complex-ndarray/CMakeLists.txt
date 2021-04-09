add_executable(example-complex-ndarray complex-ndarray-main.F90 complex-ndarray-f.f90 complex-ndarray-cxx.cc)
set_target_properties(
    example-complex-ndarray
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod"
)
target_include_directories(example-complex-ndarray
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_include_directories(example-complex-ndarray
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../../src
)
target_link_libraries(example-complex-ndarray ${PROJECT_LIBS} flcl::flcl)
if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
    target_link_options(example-complex-ndarray PRIVATE LINKER:-lxlf90_r)
endif()
if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel" OR CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    set_target_properties(example-complex-ndarray PROPERTIES LINKER_LANGUAGE Fortran)
endif()
set(RPATHS "$ENV{LD_LIBRARY_PATH}")
set_target_properties(example-complex-ndarray PROPERTIES 
                      BUILD_WITH_INSTALL_RPATH True
                      INSTALL_RPATH "${RPATHS}")
