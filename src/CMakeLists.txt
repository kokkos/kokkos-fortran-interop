#flcl-fortran library
add_library(flcl-fortran
    OBJECT
        flcl-types-f.f90
        flcl-ndarray-f.f90
        flcl-view-f.f90
        flcl-dualview-f.f90
        flcl-util-strings-f.f90
        flcl-f.f90
        flcl-util-kokkos-f.f90
)
# standards compliance section
# There is no CMake function to enforce the language standard in Fortran.
# See https://gitlab.kitware.com/cmake/cmake/-/issues/22235
if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
    # fully enable F2008, per IBM article: https://www.ibm.com/docs/en/xl-fortran-linux/16.1.1?topic=scenarios-compiling-fortran-2008-programs
    # also enable polymorphic feature (-qxlf2003=polymorphic) to support the view/dualview types to enable type disambiguation in generic interfaces
    target_compile_options(flcl-fortran PRIVATE -qxlf2003=polymorphic -qlanglvl=2008std -qnodirective -qnoescape -qfloat=nomaf:rndsngl:nofold -qnoswapomp -qstrictieeemod -qsuppress=1501-510 )
endif()
if (CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    target_compile_options(flcl-fortran PRIVATE -std=f2008)
endif()
if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
    target_compile_options(flcl-fortran PRIVATE -std08)
endif()
target_include_directories(flcl-fortran
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
)
set_target_properties(
    flcl-fortran
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod"
)

#flcl-cxx library
add_library(flcl-cxx
    OBJECT
        flcl-cxx.cpp
        flcl-util-cxx.cpp
)
set(flcl-cxx-public-headers
    ${PROJECT_SOURCE_DIR}/src/flcl-cxx.hpp
    ${PROJECT_SOURCE_DIR}/src/flcl-types-cxx.hpp
    ${PROJECT_SOURCE_DIR}/src/flcl-util-cxx.h
)
set_property(TARGET flcl-cxx PROPERTY CXX_STANDARD 17)
set_target_properties(flcl-cxx PROPERTIES PUBLIC_HEADER "${flcl-cxx-public-headers}")
target_link_libraries(flcl-cxx
    PRIVATE
        Kokkos::kokkos
)

add_library(flcl
        $<TARGET_OBJECTS:flcl-fortran>
        $<TARGET_OBJECTS:flcl-cxx>
)
set_target_properties(flcl PROPERTIES PUBLIC_HEADER "${flcl-cxx-public-headers}")
target_include_directories(flcl
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)
target_link_libraries(flcl
    INTERFACE
    Kokkos::kokkos
)

#add flcl library
add_library(flcl::flcl ALIAS flcl)
