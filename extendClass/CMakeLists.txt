cmake_minimum_required(VERSION 2.8)

project(example)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wextra -Wno-unused-parameter")

find_package(SWIG REQUIRED)
include(${SWIG_USE_FILE})

find_package(PythonLibs 3 REQUIRED)
include_directories(${PYTHON_INCLUDE_PATH})

set(CMAKE_SWIG_FLAGS "")
set_source_files_properties(${CMAKE_SOURCE_DIR}/example.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_SOURCE_DIR})

swig_add_module(example python ${CMAKE_SOURCE_DIR}/example.i 
                                ${CMAKE_SOURCE_DIR}/example.cpp)
swig_link_libraries(example  ${PYTHON_LIBRARIES})

# execute_process(COMMAND cp ${CMAKE_SOURCE_DIR}/test.py ${CMAKE_BINARY_DIR}
#                 COMMAND python3 ${CMAKE_BINARY_DIR}/test.py)

add_custom_target(test
        DEPENDS _example
        COMMAND cp ${CMAKE_SOURCE_DIR}/test.py ${CMAKE_BINARY_DIR}
        COMMAND python3 ${CMAKE_BINARY_DIR}/test.py)
