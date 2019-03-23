cmake_minimum_required(VERSION 3.13)
project(AssemblyPRo C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS -m32) # Change to 32bit


add_executable(AssemblyPRo main.c HashRunner.obj)

