cmake_minimum_required(VERSION 3.1)
project(LibB)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake")
include(ProjectSettings)

conan_cmake_run(CONANFILE conanfile.py
        BASIC_SETUP #CMAKE_TARGETS (does not currently work)
        OPTIONS ${CONAN_RUN_OPTIONS} UPDATE
        BUILD missing)
# The library dirs are not current set correctly by conan.io - it will be later
conan_library_dirs_setup()

add_library(${PROJECT_NAME} STATIC src/ClassB.cpp include/LibB/ClassB.h)
conan_target_link_libraries(${PROJECT_NAME})
target_include_directories(${PROJECT_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
        )

