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

add_subdirectory(src)

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
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/src/mod/" DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

#unit testing section and toggle
if(FLCL_BUILD_TESTS)
  include(CTest)
  add_subdirectory(test)
endif()

if(FLCL_BUILD_EXAMPLES)
  add_subdirectory(examples)
endif()
