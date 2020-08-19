add_executable(example-axpy axpy-main.F90 axpy-f.f90 axpy-cxx.cc)
target_include_directories(example-axpy
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_include_directories(example-axpy
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../../src
)
target_link_libraries(example-axpy ${PROJECT_LIBS} FLCL::flcl)
if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
    target_link_options(example-axpy PRIVATE LINKER:-lxlf90_r)
endif()
if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel" OR CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    set_target_properties(example-axpy PROPERTIES LINKER_LANGUAGE Fortran)
endif()
set(RPATHS "$ENV{LD_LIBRARY_PATH}")
set_target_properties(example-axpy PROPERTIES 
                      BUILD_WITH_INSTALL_RPATH True
                      INSTALL_RPATH ${RPATHS})
set_target_properties(example-axpy PROPERTIES INSTALL_RPATH ${RPATHS} BUILD_WITH_INSTALL_RPATH True)
