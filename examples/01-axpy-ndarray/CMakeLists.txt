add_executable(example-axpy-ndarray axpy-ndarray-main.F90 axpy-ndarray-f.f90 axpy-ndarray-cxx.cc)
set_target_properties(
    example-axpy-ndarray
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod"
)
target_include_directories(example-axpy-ndarray
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_include_directories(example-axpy-ndarray
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../../src
)
target_link_libraries(example-axpy-ndarray ${PROJECT_LIBS} flcl::flcl)
if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
    target_link_options(example-axpy-ndarray PRIVATE LINKER:-lxlf90_r)
endif()
if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel" OR CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    set_target_properties(example-axpy-ndarray PROPERTIES LINKER_LANGUAGE Fortran)
endif()
set(RPATHS "$ENV{LD_LIBRARY_PATH}")
set_target_properties(example-axpy-ndarray PROPERTIES 
                      BUILD_WITH_INSTALL_RPATH True
                      INSTALL_RPATH "${RPATHS}")
