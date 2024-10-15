cmake_minimum_required(VERSION 3.19)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
project(flcl VERSION 0.99.99 LANGUAGES Fortran C CXX)

if (NOT CMAKE_BUILD_TYPE)
  set(DEFAULT_BUILD_TYPE "RelWithDebInfo")
  message(STATUS "Setting build type to '${DEFAULT_BUILD_TYPE}' as none was specified.")
  set(CMAKE_BUILD_TYPE "${DEFAULT_BUILD_TYPE}" CACHE STRING
    "Choose the type of build, options are: Debug, Release, RelWithDebInfo and MinSizeRel."
    FORCE)
endif()


# FIXME This was set in a XL-related commit:
# https://github.com/kokkos/kokkos-fortran-interop/commit/f232302284400a90410a36edb14f538c20b8a71b
# We need to check if it is still necessary
set(BUILD_SHARED_LIBS OFF)
option(FLCL_BUILD_EXAMPLES "Build examples" ON)
option(FLCL_BUILD_TESTS "Build tests" ON)

# The tests and the examples need to be built with PIE because they link against GLICXX
if (FLCL_BUILD_EXAMPLES OR FLCL_BUILD_TESTS)
  if (NOT CMAKE_POSITION_INDEPENDENT_CODE)
    message(FATAL_ERROR "Enabling the tests or the examples require configuring with -DCMAKE_POSITION_INDEPENDENT_CODE=ON")
  endif()
endif()

find_package(Kokkos REQUIRED)

include(GNUInstallDirs)

add_link_options(LINKER:--disable-new-dtags)

#flcl-fortran library
add_library(flcl-fortran
    OBJECT
        src/flcl-types-f.f90
        src/flcl-ndarray-f.f90
        src/flcl-view-f.f90
        src/flcl-dualview-f.f90
        src/flcl-util-strings-f.f90
        src/flcl-f.f90
        src/flcl-util-kokkos-f.f90
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
        src/flcl-cxx.cpp
        src/flcl-util-cxx.cpp
)
set(flcl-cxx-public-headers
    ${PROJECT_SOURCE_DIR}/src/flcl-cxx.hpp
    ${PROJECT_SOURCE_DIR}/src/flcl-types-cxx.hpp
    ${PROJECT_SOURCE_DIR}/src/flcl-util-cxx.h
)
set_property(TARGET flcl-cxx PROPERTY CXX_STANDARD 14)
set_target_properties(flcl-cxx PROPERTIES PUBLIC_HEADER "${flcl-cxx-public-headers}")
target_link_libraries(flcl-cxx
    PRIVATE
        Kokkos::kokkos
)

add_library(flcl
    STATIC
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

# add parallelism library link flags in kokkos > 3.1
if (Kokkos_VERSION VERSION_GREATER 3.1)
    if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
        target_link_options(flcl INTERFACE -qopenmp PUBLIC -qopenmp)
    endif()
    if (CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
        target_link_options(flcl INTERFACE -fopenmp PUBLIC -fopenmp)
    endif()
    if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
        target_link_options(flcl INTERFACE -qopenmp PUBLIC -qopenmp)
    endif()
endif()

#add flcl library
add_library(flcl::flcl ALIAS flcl)

#installation section
include(CMakePackageConfigHelpers)
configure_package_config_file(
    "cmake/flclConfig.cmake.in"
    "${PROJECT_BINARY_DIR}/flclConfig.cmake"
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake"
)

write_basic_package_version_file(
    "${PROJECT_BINARY_DIR}/flclConfigVersion.cmake"
    VERSION "${PROJECT_VERSION}"
    COMPATIBILITY SameMinorVersion
)

# install flcl cmake config files
install(
    FILES
        "${PROJECT_BINARY_DIR}/flclConfigVersion.cmake"
        "${PROJECT_BINARY_DIR}/flclConfig.cmake"
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
)
install(TARGETS flcl EXPORT flclTargets)
install(
    EXPORT flclTargets
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
    NAMESPACE flcl::
)

# install flcl library and headers
install(
    TARGETS flcl
    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

# install flcl module files in include directory
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod/" DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

#unit testing section and toggle
if(FLCL_BUILD_TESTS)
  include(CTest)
  add_subdirectory(test)
endif()

if(FLCL_BUILD_EXAMPLES)
  add_subdirectory(examples)
endif()
