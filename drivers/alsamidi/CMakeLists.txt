set(ALSAMIDI_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/alsamidi)
set(ALSAMIDI_DRIVER_SOURCE
    ${ALSAMIDI_DRIVER_SOURCE_DIR}/midi_driver_alsamidi.cpp
    ${ALSAMIDI_DRIVER_SOURCE_DIR}/midi_driver_alsamidi.h
)

if(${WANT_ALSA} AND ${ALSA_FOUND})
    godot_add_library(driver-alsa-midi drivers STATIC ${ALSAMIDI_DRIVER_SOURCE})
    target_link_libraries(driver-alsa-midi  PUBLIC linuxbsd-headers ${ALSA_LIBRARIES} godot-error)
    target_compile_definitions(driver-alsa-midi PUBLIC ALSAMIDI_ENABLED=1)
endif()