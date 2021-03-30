add_executable(example-axpy-dualview axpy-dualview-main.F90 axpy-dualview-f.f90 axpy-dualview-cxx.cc)
set_target_properties(
    example-axpy-dualview
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod"
)
target_include_directories(example-axpy-dualview
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_include_directories(example-axpy-dualview
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../../src
)
target_link_libraries(example-axpy-dualview ${PROJECT_LIBS} flcl::flcl)
if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
    target_link_options(example-axpy-dualview PRIVATE LINKER:-lxlf90_r)
endif()
if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel" OR CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    set_target_properties(example-axpy-dualview PROPERTIES LINKER_LANGUAGE Fortran)
endif()
set(RPATHS "$ENV{LD_LIBRARY_PATH}")
set_target_properties(example-axpy-dualview PROPERTIES 
                      BUILD_WITH_INSTALL_RPATH True
                      INSTALL_RPATH "${RPATHS}")
