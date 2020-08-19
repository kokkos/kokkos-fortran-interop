cmake_minimum_required(VERSION 3.12)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

project(FLCL VERSION 0.1.0 LANGUAGES Fortran C CXX)

set(default_build_type "RelWithDebInfo")
set(BUILD_SHARED_LIBS OFF)

include(CMakeDetermineFortranCompiler)
include(CMakeDetermineCCompiler)
include(CMakeDetermineCXXCompiler)

find_package(Kokkos REQUIRED)

include(CheckFortranCompilerFlag)
include(CheckCXXCompilerFlag)
include(CheckCCompilerFlag)

# use, i.e. don't skip the full RPATH for the build tree
#set(CMAKE_SKIP_BUILD_RPATH FALSE)

# when building, don't use the install RPATH already
# (but later on when installing)
#set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)

#set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

# add the automatically determined parts of the RPATH
# which point to directories outside the build tree to the install RPATH
#set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

# the RPATH to be used when installing, but only if it's not a system directory
#list(FIND CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES "${CMAKE_INSTALL_PREFIX}/lib" isSystemDir)
#if("${isSystemDir}" STREQUAL "-1")
#    set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
#endif("${isSystemDir}" STREQUAL "-1")

add_link_options(LINKER:--disable-new-dtags)


add_library(flcl-fortran
    OBJECT
        src/flcl-util-strings-f.f90
        src/flcl-f.f90
        src/flcl-util-kokkos-f.f90
)
target_include_directories(flcl-fortran
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
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
        Kokkos::kokkos
)

add_library(FLCL
    STATIC
        $<TARGET_OBJECTS:flcl-fortran>
        $<TARGET_OBJECTS:flcl-cxx>
)
target_include_directories(FLCL
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_link_libraries(FLCL
    INTERFACE
    Kokkos::kokkos
)
add_library(FLCL::flcl ALIAS FLCL)

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

install(TARGETS FLCL EXPORT flclTargets)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod DESTINATION .)
install(
    EXPORT flclTargets
    DESTINATION lib/cmake/flcl
    NAMESPACE FLCL::)

include(CTest)
add_subdirectory(test)
add_subdirectory(examples)


