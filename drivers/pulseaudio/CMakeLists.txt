set(PULSEAUDIO_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/pulseaudio)
set(PULSEAUDIO_SOURCE
    ${PULSEAUDIO_SOURCE_DIR}/audio_driver_pulseaudio.cpp
    ${PULSEAUDIO_SOURCE_DIR}/audio_driver_pulseaudio.h
    ${PULSEAUDIO_SOURCE_DIR}/pulse-so_wrap.c
    ${PULSEAUDIO_SOURCE_DIR}/pulse-so_wrap.h
    )

if(${WANT_PULSEAUDIO} AND ${PULSEAUDIO_FOUND})
    godot_add_library(driver-pulseaudio drivers STATIC ${PULSEAUDIO_SOURCE})
    target_link_libraries(driver-pulseaudio PUBLIC godot-os)
    target_compile_definitions(driver-pulseaudio PUBLIC PULSEAUDIO_ENABLED=1)
endif()
