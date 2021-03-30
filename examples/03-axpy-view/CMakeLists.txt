add_executable(example-axpy-view axpy-view-main.F90 axpy-view-f.f90 axpy-view-cxx.cc)
set_target_properties(
    example-axpy-view
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod"
)
target_include_directories(example-axpy-view
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_include_directories(example-axpy-view
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../../src
)
target_link_libraries(example-axpy-view ${PROJECT_LIBS} flcl::flcl)
if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
    target_link_options(example-axpy-view PRIVATE LINKER:-lxlf90_r)
endif()
if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel" OR CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    set_target_properties(example-axpy-view PROPERTIES LINKER_LANGUAGE Fortran)
endif()
set(RPATHS "$ENV{LD_LIBRARY_PATH}")
set_target_properties(example-axpy-view PROPERTIES 
                      BUILD_WITH_INSTALL_RPATH True
                      INSTALL_RPATH "${RPATHS}")
