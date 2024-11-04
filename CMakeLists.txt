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


option(FLCL_BUILD_EXAMPLES "Build examples" ON)
option(FLCL_BUILD_TESTS "Build tests" ON)

# We need to set CMAKE_POSITION_INDEPENDENT_CODE. Otherwise there is an issue
# when linking flcl.cxx.cpp.o into libflcl. This is necessary even when
# building a shared library
set(CMAKE_POSITION_INDEPENDENT_CODE ON)


find_package(Kokkos 4.0 REQUIRED)

include(GNUInstallDirs)

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
