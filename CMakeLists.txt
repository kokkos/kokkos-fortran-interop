cmake_minimum_required(VERSION 3.11)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

project(flcl VERSION 0.1.0 LANGUAGES Fortran C CXX)

set(default_build_type "RelWithDebInfo")

include(CMakeDetermineFortranCompiler)
include(CMakeDetermineCCompiler)
include(CMakeDetermineCXXCompiler)

find_package(Kokkos REQUIRED)

include(CheckFortranCompilerFlag)
include(CheckCXXCompilerFlag)
include(CheckCCompilerFlag)

add_library(flcl-fortran
    OBJECT
        src/flcl-f.f90
        src/flcl-util-f.f90
)
set_target_properties(
    flcl-fortran
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod"
)

add_library(flcl-cxx
    OBJECT
        src/flcl-cxx.cpp
        src/flcl-util-cxx.cpp
)
target_link_libraries(flcl-cxx
    PRIVATE
        Kokkos::Kokkos
)

add_library(flcl
    STATIC
        $<TARGET_OBJECTS:flcl-fortran>
        $<TARGET_OBJECTS:flcl-cxx>
)
target_include_directories(flcl
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_link_libraries(flcl
    INTERFACE
    Kokkos::Kokkos
)
add_library(flcl::flcl ALIAS flcl)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
    "${PROJECT_BINARY_DIR}/flclConfigVersion.cmake"
    COMPATIBILITY SameMinorVersion
)

configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/flclConfig.cmake.in"
    "${PROJECT_BINARY_DIR}/flclConfig.cmake"
    INSTALL_DESTINATION lib/cmake/flcl
)

install(
    FILES
        "${PROJECT_BINARY_DIR}/flclConfigVersion.cmake"
        "${PROJECT_BINARY_DIR}/flclConfig.cmake"
        DESTINATION lib/cmake/flcl
)

install(TARGETS flcl EXPORT flclTargets)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod DESTINATION .)
install(
    EXPORT flclTargets
    DESTINATION lib/cmake/flcl
    NAMESPACE flcl::)





