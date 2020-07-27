CMAKE_MINIMUM_REQUIRED(VERSION 3.13)

PROJECT(tests)

set(CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE DEBUG)

find_package(Catch2 REQUIRED)

add_compile_options(-Wall -Wextra -Wpedantic -Wshadow
    -fprofile-arcs -ftest-coverage -fPIC -fno-inline -fno-inline-small-functions -fno-default-inline)
add_link_options(-lgcov --coverage)

include_directories(${CMAKE_SOURCE_DIR}/../include/)

add_executable(tests
		${CMAKE_SOURCE_DIR}/src/test-main.cpp
		${CMAKE_SOURCE_DIR}/src/test1.cpp
		${CMAKE_SOURCE_DIR}/src/test2.cpp
	)

target_link_libraries(tests Catch2::Catch2)
