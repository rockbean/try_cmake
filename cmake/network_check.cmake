set(CHECK_FILE_URL "https://bootstrap.pypa.io/ez_setup.py")
set(CHECK_FILE_LOCAL "${CMAKE_CURRENT_SOURCE_DIR}/connection_check")
file(DOWNLOAD ${CHECK_FILE_URL} "${CHECK_FILE_LOCAL}" 
		SHOW_PROGRESS 
		TIMEOUT 60 
		STATUS status)
list (GET status 0 rc)
if (${rc} EQUAL 0)
	set(NETWORK_CONNECTION ON)
else()
	set(NETWORK_CONNECTION OFF)
endif()