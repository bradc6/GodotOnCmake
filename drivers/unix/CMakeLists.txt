cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(UNIX_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/unix)
set(UNIX_DRIVER_SOURCE
    ${UNIX_DRIVER_SOURCE_DIR}/dir_access_unix.cpp
    ${UNIX_DRIVER_SOURCE_DIR}/dir_access_unix.h
    ${UNIX_DRIVER_SOURCE_DIR}/file_access_unix.cpp
    ${UNIX_DRIVER_SOURCE_DIR}/file_access_unix.h
    ${UNIX_DRIVER_SOURCE_DIR}/ip_unix.cpp
    ${UNIX_DRIVER_SOURCE_DIR}/ip_unix.h
    ${UNIX_DRIVER_SOURCE_DIR}/net_socket_posix.cpp
    ${UNIX_DRIVER_SOURCE_DIR}/net_socket_posix.h
    ${UNIX_DRIVER_SOURCE_DIR}/os_unix.cpp
    ${UNIX_DRIVER_SOURCE_DIR}/os_unix.h
    ${UNIX_DRIVER_SOURCE_DIR}/syslog_logger.cpp
    ${UNIX_DRIVER_SOURCE_DIR}/syslog_logger.h
    ${UNIX_DRIVER_SOURCE_DIR}/thread_posix.cpp
    ${UNIX_DRIVER_SOURCE_DIR}/thread_posix.h
    )
godot_add_library(driver-unix drivers STATIC ${UNIX_DRIVER_SOURCE})
target_link_libraries(driver-unix PUBLIC godot-io)
