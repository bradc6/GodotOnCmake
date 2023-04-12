#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_DRIVERS_BASE_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/drivers)

#Include generator tools
# include(${GODOT_GENERATORS_CMAKE_FILE})

#####################################
#ALSA
####################################
#Find the package to link and enable/disable
if(WANT_ALSA)
    find_package(ALSA)
endif()
if(WANT_PULSEAUDIO)
    find_package(PulseAudio)
endif()

add_subdirectory(alsa)
add_subdirectory(alsamidi)
add_subdirectory(gles3)
add_subdirectory(gl_context)
add_subdirectory(png)
add_subdirectory(pulseaudio)
add_subdirectory(unix)
add_subdirectory(windows)
add_subdirectory(vulkan)
add_subdirectory(winmidi)
add_subdirectory(wasapi)

####################################
#driver
####################################
set(GODOT_DRIVER_BASE_SOURCE
    ${GODOT_DRIVERS_BASE_DIR}/register_driver_types.h
    ${GODOT_DRIVERS_BASE_DIR}/register_driver_types.cpp
    )
godot_add_library(godot-driver drivers STATIC ${GODOT_DRIVER_BASE_SOURCE})
target_link_libraries(godot-driver PUBLIC godot-extension driver-png)
