CMAKE_MINIMUM_REQUIRED(VERSION 3.13)

project(my_cpp_starter CXX)

find_package(Catch2 REQUIRED)

add_executable(test_target
    tests/test-main.cpp
    tests/test1.cpp
    tests/test2.cpp
    )

set_target_properties(test_target PROPERTIES
    CXX_STANDARD_REQUIRED ON
    CXX_STANDARD 17
    )

target_include_directories(test_target PUBLIC
    "include/"
    )

target_compile_options(test_target PUBLIC
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -fprofile-arcs
    -ftest-coverage
    -fPIC
    )

target_link_options(test_target PUBLIC
    -lgcov
    --coverage
    )

target_link_libraries(test_target Catch2::Catch2)

include(CTest)
include(Catch)
catch_discover_tests(test_target)
