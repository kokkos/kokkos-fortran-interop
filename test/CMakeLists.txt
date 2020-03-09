add_library(flcl-testlib-fortran
    OBJECT
        flcl-test-f.f90
)
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
    FLCL::flcl
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
    FLCL::flcl
)

add_library(flcl-testlib
    STATIC
        $<TARGET_OBJECTS:flcl-testlib-fortran>
        $<TARGET_OBJECTS:flcl-testlib-cxx>
)
target_include_directories(flcl-testlib
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
        $<INSTALL_INTERFACE:mod>
)
target_link_libraries(flcl-testlib
    FLCL::flcl
)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/test)
set(CTEST_BINARY_DIRECTORY ${PROJECT_BINARY_DIR}/test)

file(GLOB files "test_*.f90")

foreach(file ${files})
	string(REGEX REPLACE "(^.*/|\\.[^.]*$)" "" file_without_ext ${file})
	add_executable(${file_without_ext} ${file})
	target_link_libraries(${file_without_ext} ${PROJECT_LIBS} FLCL::flcl flcl-testlib)
	add_test(${file_without_ext} ${file_without_ext})
	set_tests_properties(${file_without_ext}
		PROPERTIES
		PASS_REGULAR_EXPRESSION "Test passed")
	set_tests_properties(${file_without_ext}
		PROPERTIES
		FAIL_REGULAR_EXPRESSION "(Exception|Test failed)")
	set_tests_properties(${file_without_ext}
		PROPERTIES
		TIMEOUT 120)
endforeach()