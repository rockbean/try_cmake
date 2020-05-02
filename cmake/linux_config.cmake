message(STATUS "Setting Linux configurations")

macro(os_config)
	add_definitions(-D_GNU_SOURCE)

	# GCC flags
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -funroll-loops")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fgnu89-inline")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstrict-aliasing")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")

	# Warning flags for GCC
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pedantic")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wextra")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-missing-field-initializers")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-parameter")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-variable")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-result")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-function")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-array-bounds")

	# System Libraries
	set(MYC_LIBS ${MYC_LIBS} rt)
	set(MYC_LIBS ${MYC_LIBS} pthread)
endmacro()