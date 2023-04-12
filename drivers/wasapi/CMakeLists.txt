cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

if(${WANT_WASAPI})
    set(WASAPI_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/wasapi)
    set(WASAPI_DRIVER_SOURCE
        ${WASAPI_DRIVER_SOURCE_DIR}/audio_driver_wasapi.cpp
        ${WASAPI_DRIVER_SOURCE_DIR}/audio_driver_wasapi.h
        ${WASAPI_DRIVER_SOURCE_DIR}/SCsub
        )

    godot_add_library(driver-wasapi drivers STATIC ${WASAPI_DRIVER_SOURCE})
    target_link_libraries(driver-wasapi PUBLIC godot-core)
    target_include_directories(driver-wasapi PRIVATE ${GODOT_ENGINE_ROOT_DIRECTORY})
endif()