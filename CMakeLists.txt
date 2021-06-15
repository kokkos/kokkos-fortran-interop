cmake_minimum_required(VERSION 3.19)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
project(flcl VERSION 0.5.0 LANGUAGES Fortran C CXX)

set(default_build_type "RelWithDebInfo")
set(BUILD_SHARED_LIBS OFF)

include(CMakeDetermineFortranCompiler)
include(CMakeDetermineCCompiler)
include(CMakeDetermineCXXCompiler)

find_package(Kokkos REQUIRED)

include(CheckFortranCompilerFlag)
include(CheckCXXCompilerFlag)
include(CheckCCompilerFlag)

include(GNUInstallDirs)

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
#standards compliance section
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
if(BUILD_TESTING)
  add_subdirectory(test)
endif()

if(BUILD_EXAMPLES)
  add_subdirectory(examples)
endif()
