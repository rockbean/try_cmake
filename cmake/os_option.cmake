# Read MYC_HOST from system environment
if (DEFINED ENV{MYC_HOST})
	if ($ENV{MYC_HOST} MATCHES "rpi")
		SET(CMAKE_SYSTEM_NAME Linux)
		set(CMAKE_C_COMPILER /mnt/e/MyPrjs/toolchain/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-gcc)
		SET(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} /mnt/e/MyPrjs/toolchain/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/)
	elseif ($ENV{MYC_HOST} MATCHES "m11g")
		SET(CMAKE_SYSTEM_NAME Windows)
		set(CMAKE_C_COMPILER /mnt/e/MyPrjs/toolchain/mingw-w64/bin/mingw-w64-gcc)
		SET(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} /mnt/e/MyPrjs/toolchain/mingw-w64)
	endif()
else()
	SET(CMAKE_SYSTEM_NAME Linux)
endif()


if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	include(cmake/linux_config.cmake)
elseif (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	include(cmake/windows_config.cmake)
else()
	include(cmake/linux_config.cmake)
endif()