CMAKE_MINIMUM_REQUIRED(VERSION 3.13)

project(my_cpp_starter CXX)

find_package(Catch2 REQUIRED)
find_package(TBB REQUIRED)

add_library(my_library INTERFACE)
target_include_directories(my_library INTERFACE include/)
set_target_properties(my_library PROPERTIES
    INTERFACE_COMPILE_FEATURES cxx_std_17
)
target_link_libraries(my_library INTERFACE
    tbb
)

add_executable(test_target
    tests/test-main.cpp
    tests/test1.cpp
    tests/test2.cpp
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
target_link_libraries(test_target
    Catch2::Catch2
    my_library
)

include(CTest)
include(Catch)
catch_discover_tests(test_target)
