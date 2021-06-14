macro(remove_link_flag_from_target _target _flag)
    get_target_property(_target_link_flags ${_target} LINK_OPTIONS)
    if(_target_link_flags)
        list(REMOVE_ITEM _target_link_flags ${_flag})
        set_target_properties(${_target} PROPERTIES LINK_OPTIONS "${_target_link_flags}")
    endif()
endmacro()

add_library(flcl-testlib-fortran
    OBJECT
        flcl-test-f.F90
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
target_include_directories(flcl-testlib-fortran
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
set_target_properties(
    flcl-testlib-fortran
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod"
)
target_link_libraries(flcl-testlib-fortran
    flcl::flcl
)

add_library(flcl-testlib-cxx
    OBJECT
        flcl-test-cxx.cpp
)
target_include_directories(flcl-testlib-cxx
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/../src
)
target_link_libraries(flcl-testlib-cxx
    flcl::flcl
)

add_library(flcl-testlib
    #STATIC
        $<TARGET_OBJECTS:flcl-testlib-fortran>
        $<TARGET_OBJECTS:flcl-testlib-cxx>
)
target_include_directories(flcl-testlib
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_link_libraries(flcl-testlib
    flcl::flcl
)

#set_target_properties(flcl-testlib PROPERTIES INSTALL_RPATH ${RPATHS})


set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/test)
set(CTEST_BINARY_DIRECTORY ${PROJECT_BINARY_DIR}/test)

file(GLOB files "test_*.f90")

# if cmake 3.17 is supported everywhere
list(APPEND CMAKE_CTEST_ARGUMENTS "--output-on-failure")

foreach(file ${files})
 	string(REGEX REPLACE "(^.*/|\\.[^.]*$)" "" file_without_ext ${file})
    add_executable(${file_without_ext} ${file})
    if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
        # fully enable F2008, per IBM article: https://www.ibm.com/docs/en/xl-fortran-linux/16.1.1?topic=scenarios-compiling-fortran-2008-programs
        # also enable polymorphic feature (-qxlf2003=polymorphic) to support the view/dualview types to enable type disambiguation in generic interfaces
        target_compile_options(${file_without_ext} PRIVATE -qxlf2003=polymorphic -qlanglvl=2008std -qnodirective -qnoescape -qfloat=nomaf:rndsngl:nofold -qnoswapomp -qstrictieeemod -qsuppress=1501-510 )
    endif()
    if (CMAKE_Fortran_COMPILER_ID STREQUAL "XL")
        target_link_options(${file_without_ext} PRIVATE LINKER:-lxlf90_r)
    endif()
    if (CMAKE_Fortran_COMPILER_ID STREQUAL "Intel" OR CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
        set_target_properties(${file_without_ext} PROPERTIES LINKER_LANGUAGE Fortran)
    endif()
    set(RPATHS "$ENV{LD_LIBRARY_PATH}")
	set_target_properties(${file_without_ext} PROPERTIES 
						  BUILD_WITH_INSTALL_RPATH True
						  INSTALL_RPATH "${RPATHS}")
 	target_link_libraries(${file_without_ext} ${PROJECT_LIBS} flcl::flcl flcl-testlib)
    add_test(${file_without_ext} ${file_without_ext})
	# set_target_properties(${file_without_ext} PROPERTIES LINKER_LANGUAGE Fortran) 
 	set_tests_properties(${file_without_ext}
 		PROPERTIES
 		PASS_REGULAR_EXPRESSION "PASSED")
 	set_tests_properties(${file_without_ext}
 		PROPERTIES
 		FAIL_REGULAR_EXPRESSION "FAILED")
 	set_tests_properties(${file_without_ext}
 		PROPERTIES
        TIMEOUT 120)

    remove_link_flag_from_target(${file_without_ext} -arch=sm_70)
endforeach()
