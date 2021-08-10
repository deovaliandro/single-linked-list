# cmake_minimum_required(VERSION <specify CMake version here>)
project(ll C)

set(CMAKE_C_STANDARD 11)

add_executable(ll
        dll.c
        sll.c)
