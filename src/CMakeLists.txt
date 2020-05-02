include_directories(include)
file(GLOB MYC_SOURCES *.c)
add_executable(myc_bin ${MYC_SOURCES})
set_target_properties(myc_bin PROPERTIES OUTPUT_NAME myc)

# Link the libraries
target_link_libraries(myc_bin ${MYC_LIBS})