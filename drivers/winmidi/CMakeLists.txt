cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

if(${WANT_WINMIDI})
    set(WINMIDI_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/winmidi)
    set(WINMIDI_DRIVER_SOURCE
        ${WINMIDI_DRIVER_SOURCE_DIR}/midi_driver_winmidi.cpp
        ${WINMIDI_DRIVER_SOURCE_DIR}/midi_driver_winmidi.h
        ${WINMIDI_DRIVER_SOURCE_DIR}/SCsub
        )

    godot_add_library(driver-winmidi drivers STATIC ${WINMIDI_DRIVER_SOURCE})
    target_link_libraries(driver-winmidi PUBLIC godot-core)
    target_include_directories(driver-winmidi PRIVATE ${GODOT_ENGINE_ROOT_DIRECTORY})
endif()