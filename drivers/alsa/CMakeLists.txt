cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

if(${WANT_ALSA} AND ${ALSA_FOUND})
    set(ALSA_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/alsa)
    set(ALSA_DRIVER_SOURCE
        ${ALSA_DRIVER_SOURCE_DIR}/asound-so_wrap.c
        ${ALSA_DRIVER_SOURCE_DIR}/asound-so_wrap.h
        ${ALSA_DRIVER_SOURCE_DIR}/audio_driver_alsa.cpp
        ${ALSA_DRIVER_SOURCE_DIR}/audio_driver_alsa.h
        )

    godot_add_library(driver-alsa drivers STATIC ${ALSA_DRIVER_SOURCE})
    target_compile_definitions(driver-alsa PUBLIC ALSA_ENABLED=1 PULSEAUDIO_ENABLED=1)
    target_link_libraries(driver-alsa PUBLIC linuxbsd-headers ${ALSA_LIBRARIES} godot-error)
    target_include_directories(driver-alsa PRIVATE ${GODOT_ENGINE_ROOT_DIRECTORY})

    #Inform that pulse audio is available
    if(${WANT_PULSEAUDIO} AND ${PULSEAUDIO_FOUND})
        message(STATUS, "Found PulseAudio library")
        target_compile_definitions(driver-alsa PRIVATE "-DPULSEAUDIO_ENABLED=1")
    else()
        message(STATUS, "Found PulseAudio missing.... disabling")
    endif()
endif()