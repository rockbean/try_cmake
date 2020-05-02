set(MYC_VER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/include/version.h")

function(assign_version VER)
	file(STRINGS ${MYC_VER_PATH} MYC_RELEASE_VERSION_${VER} REGEX "#define MYC_${VER}_VERSION")
	separate_arguments(MYC_RELEASE_VERSION_${VER})
	list(GET MYC_RELEASE_VERSION_${VER} -1 tmp)
	if (tmp LESS 0)
		message( FATAL_ERROR "Could not obtain valid MYC_RELEASE version ${VER} - actual value is ${tmp}" )
	endif()
	set(MYC_RELEASE_VERSION_${VER} ${tmp} PARENT_SCOPE)
endfunction()


set(MYC_RELEASE_VERSION_MAJOR -1)
set(MYC_RELEASE_VERSION_MINOR -1)
set(MYC_RELEASE_VERSION_BUILD -1)
assign_version(MAJOR)
assign_version(MINOR)
assign_version(BUILD)

set(MYC_RELEASE_VERSION_STRING ${MYC_RELEASE_VERSION_MAJOR}.${MYC_RELEASE_VERSION_MINOR}.${MYC_RELEASE_VERSION_BUILD})
message(STATUS "RELEASE VERSION: ${MYC_RELEASE_VERSION_STRING}")