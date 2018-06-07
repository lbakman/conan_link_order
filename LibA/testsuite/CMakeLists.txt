project(testsuite)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} LibA_static)
conan_target_link_libraries(${PROJECT_NAME})
