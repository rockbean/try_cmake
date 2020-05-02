cmake_minimum_required(VERSION 3.1.0)

project(hello-cmake)

# check network connectivity
include(CMake/network_check.cmake)

if (NETWORK_CONNECTION)
	# message([<mode>] "message text" ...)
	# mode: FATAL_ERROR, SEND_ERROR, WARNING, AUTHOR_WARNING, DEPRECATION, (none), STATUS, VERBOSE, DEBUG, TRACE
	message(STATUS "Internet connectivity test successfully")
else()
	message(WARNING "Internet connectivity test failed")
endif()

# include global configuration
include(CMake/myc_options.cmake)
include(CMake/global_config.cmake)

# set global configuration flags
# macro definition located at "CMake/global_config.cmake"
global_set_flags()

# OS related configuration
include(CMake/os_option.cmake)
os_config()

include_directories(include)

# Generate libraries
add_subdirectory(lib)
config_libs()

# Compile main
add_subdirectory(src)