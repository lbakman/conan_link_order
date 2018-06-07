set(CMAKE_CXX_STANDARD 11)
set(CMAKE_DEBUG_POSTFIX "_d")
set(CMAKE_RELWITHDEBINFO_POSTFIX "_rd")
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

option(CMAKE_ENABLE_CONAN  "Enable support for Conan within CMake" ON)

if(CMAKE_ENABLE_CONAN)
    # Download automatically, you can also just copy the conan.cmake file
    if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
        message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
        file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/v0.9/conan.cmake"
                "${CMAKE_BINARY_DIR}/conan.cmake")
    endif()
    include(${CMAKE_BINARY_DIR}/conan.cmake)

    # Do not download conan.cmake right now. The local version includes a few modifications.
    #include(${CMAKE_SOURCE_DIR}/cmake/conan.cmake)
    macro(conan_library_dirs_setup)
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    endmacro(conan_library_dirs_setup)

    macro(conan_include)
        set(_OPTIONS_ARGS)
        set(_ONE_VALUE_ARGS)
        set(_MULTI_VALUE_ARGS TARGETS)

        cmake_parse_arguments(_CONANINCLUDE "${_OPTIONS_ARGS}" "${_ONE_VALUE_ARGS}" "${_MULTI_VALUE_ARGS}" ${ARGN} )

        # Mandatory
        if( _CONANINCLUDE_TARGETS )
            message( STATUS "inside TARGETS=${_CONANINCLUDE_TARGETS}" )
            foreach(_target ${_CONANINCLUDE_TARGETS})
                get_property(_dir TARGET ${_target} PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
                message(STATUS "Target: ${_target} => ${_dir}")

                include_directories(${_dir})
            endforeach(_target)
        else()
            message( FATAL_ERROR "conan_include: 'TARGETS' argument required." )
        endif()
    endmacro(conan_include)

    # This is not defined for cmake multi target generator, so we write it here
    macro(conan_multi_set_find_library_paths)
        if(CONAN_CMAKE_MULTI)
            # For find_library
            set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS_RELEASE} ${CONAN_INCLUDE_DIRS_DEBUG} ${CMAKE_INCLUDE_PATH})
            set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS_RELEASE} ${CONAN_LIB_DIRS_DEBUG} ${CMAKE_LIBRARY_PATH})
        endif(CONAN_CMAKE_MULTI)
    endmacro(conan_multi_set_find_library_paths)

endif(CMAKE_ENABLE_CONAN)
