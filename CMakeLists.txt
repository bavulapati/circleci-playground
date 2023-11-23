cmake_minimum_required(VERSION 3.14)

if(DEFINED ENV{VCPKG_ROOT})
  set(VCPKG_CMAKE_TOOLCHAIN $ENV{VCPKG_ROOT})
  cmake_path(APPEND VCPKG_CMAKE_TOOLCHAIN scripts buildsystems vcpkg.cmake)
endif()
if(EXISTS "${VCPKG_CMAKE_TOOLCHAIN}")
  message(STATUS "Using VCPKG toolchain: ${VCPKG_CMAKE_TOOLCHAIN}")
  set(CMAKE_TOOLCHAIN_FILE "${VCPKG_CMAKE_TOOLCHAIN}" CACHE STRING "VCPKG toolchain file")
else()
  message(FATAL_ERROR "Could NOT find VCPKG. It is recommended to install it through Visual Studio")
endif()

project(my_project)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

enable_testing()

find_package(GTest CONFIG REQUIRED)

add_executable(
  hello_test
  hello_test.cc
)
target_link_libraries(
  hello_test
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(hello_test)
