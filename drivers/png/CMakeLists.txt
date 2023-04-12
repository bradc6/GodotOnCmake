cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(PNG_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/png)
set(PNG_DRIVER_SOURCE
    ${PNG_DRIVER_SOURCE_DIR}/image_loader_png.cpp
    ${PNG_DRIVER_SOURCE_DIR}/image_loader_png.h
    ${PNG_DRIVER_SOURCE_DIR}/png_driver_common.cpp
    ${PNG_DRIVER_SOURCE_DIR}/png_driver_common.h
    ${PNG_DRIVER_SOURCE_DIR}/resource_saver_png.cpp
    ${PNG_DRIVER_SOURCE_DIR}/resource_saver_png.h
    )
godot_add_library(driver-png drivers STATIC ${PNG_DRIVER_SOURCE})
target_link_libraries(driver-png PUBLIC godot-io png)
