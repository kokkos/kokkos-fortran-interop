cmake_minimum_required(VERSION 3.17)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
project(flcl VERSION 0.4.0 LANGUAGES Fortran C CXX)

set(default_build_type "RelWithDebInfo")
set(BUILD_SHARED_LIBS OFF)

include(CMakeDetermineFortranCompiler)
include(CMakeDetermineCCompiler)
include(CMakeDetermineCXXCompiler)

find_package(Kokkos REQUIRED)

include(CheckFortranCompilerFlag)
include(CheckCXXCompilerFlag)
include(CheckCCompilerFlag)

include(CTest)

add_link_options(LINKER:--disable-new-dtags)

#flcl-fortran library
add_library(flcl-fortran
    OBJECT
        src/flcl-ndarray-f.f90
        src/flcl-view-f.f90
        src/flcl-dualview-f.f90
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

#flcl-cxx library
add_library(flcl-cxx
    OBJECT
        src/flcl-cxx.cpp
        src/flcl-util-cxx.cpp
)
set(flcl-cxx-public-headers
    ${PROJECT_SOURCE_DIR}/src/flcl-cxx.hpp
    ${PROJECT_SOURCE_DIR}/src/flcl-util-cxx.h
)
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
    PUBLIC
        $<INSTALL_INTERFACE:"${CMAKE_INSTALL_INCLUDEDIR}">
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        #$<INSTALL_INTERFACE:mod>
)
target_link_libraries(flcl
    INTERFACE
    Kokkos::kokkos
)
add_library(flcl::flcl ALIAS flcl)

#installation section
include(CMakePackageConfigHelpers)
include(GNUInstallDirs)
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
if(BUILD_TESTING)
  add_subdirectory(test)
endif()

add_subdirectory(examples)


