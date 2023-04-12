cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(WINDOWS_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/windows)
set(WINDOWS_DRIVER_SOURCE
    ${WINDOWS_DRIVER_SOURCE_DIR}/dir_access_windows.cpp
    ${WINDOWS_DRIVER_SOURCE_DIR}/dir_access_windows.h
    ${WINDOWS_DRIVER_SOURCE_DIR}/file_access_windows.cpp
    ${WINDOWS_DRIVER_SOURCE_DIR}/file_access_windows.h
    ${WINDOWS_DRIVER_SOURCE_DIR}/SCsub
    )
godot_add_library(driver-windows drivers STATIC ${WINDOWS_DRIVER_SOURCE})
target_link_libraries(driver-windows PUBLIC godot-core)
