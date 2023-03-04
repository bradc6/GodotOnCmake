#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_SOURCE_ROOT_THIRDPARTY_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/thirdparty)
set(GODOT_DRIVERS_BASE_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/drivers)

#This variable holds all the targets of this subdirectory
set(GODOT_DRIVER_LIBRARIES_INTERNAL)

#####################################
#ALSA
####################################
set(ALSA_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/alsa)
set(ALSA_DRIVER_SOURCE
    ${ALSA_DRIVER_SOURCE_DIR}/asound-so_wrap.c
    ${ALSA_DRIVER_SOURCE_DIR}/asound-so_wrap.h
    ${ALSA_DRIVER_SOURCE_DIR}/audio_driver_alsa.cpp
    ${ALSA_DRIVER_SOURCE_DIR}/audio_driver_alsa.h
    )

# #Find the package to link and enable/disable
find_package(ALSA)
find_package(PulseAudio)

if(${ALSA_FOUND})
    add_library(driver-alsa STATIC ${ALSA_DRIVER_SOURCE})
    target_compile_definitions(driver-alsa PUBLIC ALSA_ENABLED=1 PULSEAUDIO_ENABLED=1)
    target_link_libraries(driver-alsa PUBLIC linuxbsd-headers ${ALSA_LIBRARIES} godot-error)
    target_include_directories(driver-alsa PRIVATE ${GODOT_ENGINE_ROOT_DIRECTORY})
    list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-alsa)

    #Inform that pulse audio is available
    if(${PULSEAUDIO_FOUND})
        message(STATUS, "Found PulseAudio library")
        target_compile_definitions(driver-alsa PRIVATE "-DPULSEAUDIO_ENABLED=1")
    else()
        message(STATUS, "Found PulseAudio missing.... disabling")
    endif()
endif()

#####################################
#ALSA-MIDI
####################################
set(ALSAMIDI_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/alsamidi)
set(ALSAMIDI_DRIVER_SOURCE
    ${ALSAMIDI_DRIVER_SOURCE_DIR}/midi_driver_alsamidi.cpp
    ${ALSAMIDI_DRIVER_SOURCE_DIR}/midi_driver_alsamidi.h
)

#if(${ALSA_FOUND})
    add_library(driver-alsa-midi STATIC ${ALSAMIDI_DRIVER_SOURCE})
    target_link_libraries(driver-alsa-midi  PUBLIC linuxbsd-headers ${ALSA_LIBRARIES} godot-error)
    target_compile_definitions(driver-alsa-midi PUBLIC ALSAMIDI_ENABLED=1)
    list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-alsa-midi)
#endif()

####################################
#GLContext
####################################
set(GLCONTEXT_DRIVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/glad)
set(GLCONTEXT_DRIVER_SOURCE
    ${GLCONTEXT_DRIVER_SOURCE_DIR}/gl.c
    )

add_library(driver-glcontext STATIC ${GLCONTEXT_DRIVER_SOURCE})
target_include_directories(driver-glcontext PUBLIC ${GLCONTEXT_DRIVER_SOURCE_DIR})
list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-glcontext)

####################################
#GLES
####################################
set(GLES3_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/gles3)
set(GLES3_DRIVER_SOURCE
    ${GLES3_DRIVER_SOURCE_DIR}/effects/copy_effects.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/effects/copy_effects.h
    ${GLES3_DRIVER_SOURCE_DIR}/environment/gi.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/environment/fog.h
    ${GLES3_DRIVER_SOURCE_DIR}/environment/fog.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/environment/gi.h
    ${GLES3_DRIVER_SOURCE_DIR}/environment/SCsub
    ${GLES3_DRIVER_SOURCE_DIR}/rasterizer_canvas_gles3.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/rasterizer_canvas_gles3.h
    ${GLES3_DRIVER_SOURCE_DIR}/rasterizer_gles3.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/rasterizer_gles3.h
    ${GLES3_DRIVER_SOURCE_DIR}/rasterizer_scene_gles3.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/rasterizer_scene_gles3.h
    ${GLES3_DRIVER_SOURCE_DIR}/shader_gles3.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/shader_gles3.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/light_storage.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/storage/render_scene_buffers_gles3.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/storage/texture_storage.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/storage/utilities.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/storage/config.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/storage/light_storage.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/render_scene_buffers_gles3.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/particles_storage.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/config.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/utilities.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/texture_storage.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/mesh_storage.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/storage/mesh_storage.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/material_storage.cpp
    ${GLES3_DRIVER_SOURCE_DIR}/storage/material_storage.h
    ${GLES3_DRIVER_SOURCE_DIR}/storage/particles_storage.cpp
    )

#BROKEN -> I'm sure something is supposed to happen with these
set(GLES3_GLSL_SHADERS
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/tonemap_inc.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/canvas_uniforms_inc.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/lens_distorted.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/canvas.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/tonemap.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/effect_blur.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/cube_to_dp.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/cubemap_filter.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/copy.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/skeleton.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/particles.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/particles_copy.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/sky.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/scene.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/canvas_sdf.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/stdlib_inc.glsl
    ${GLES3_DRIVER_SOURCE_DIR}/shaders/canvas_occlusion.glsl
    )

add_library(driver-gles3 STATIC ${GLES3_DRIVER_SOURCE})
target_link_libraries(driver-gles3 PUBLIC godot-core)
target_compile_definitions(driver-gles3 PUBLIC GLES3_ENABLED=1 GLES_OVER_GL=1 GLAD_ENABLED=1)
list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-gles3)

####################################
#PNG
####################################
set(PNG_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/png)
set(PNG_DRIVER_SOURCE
    ${PNG_DRIVER_SOURCE_DIR}/image_loader_png.cpp
    ${PNG_DRIVER_SOURCE_DIR}/image_loader_png.h
    ${PNG_DRIVER_SOURCE_DIR}/png_driver_common.cpp
    ${PNG_DRIVER_SOURCE_DIR}/png_driver_common.h
    ${PNG_DRIVER_SOURCE_DIR}/resource_saver_png.cpp
    ${PNG_DRIVER_SOURCE_DIR}/resource_saver_png.h
    )
add_library(driver-png STATIC ${PNG_DRIVER_SOURCE})
target_link_libraries(driver-png PUBLIC godot-io)
list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-png)

####################################
#PulseAudio
####################################
set(PULSEAUDIO_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/pulseaudio)
set(PULSEAUDIO_SOURCE
    ${PULSEAUDIO_SOURCE_DIR}/audio_driver_pulseaudio.cpp
    ${PULSEAUDIO_SOURCE_DIR}/audio_driver_pulseaudio.h
    ${PULSEAUDIO_SOURCE_DIR}/pulse-so_wrap.c
    ${PULSEAUDIO_SOURCE_DIR}/pulse-so_wrap.h
    )
add_library(driver-pulseaudio STATIC ${PULSEAUDIO_SOURCE})
target_link_libraries(driver-pulseaudio PUBLIC godot-os)
list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-pulseaudio)
#If pulseaudio is avail use it
#if(${PULSEAUDIO_FOUND})
    target_compile_definitions(driver-pulseaudio PUBLIC PULSEAUDIO_ENABLED=1)
#endif()

####################################
#Unix
####################################
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
add_library(driver-unix STATIC ${UNIX_DRIVER_SOURCE})
target_link_libraries(driver-unix PUBLIC godot-io volk vulkan)
target_compile_definitions(driver-unix PUBLIC UNIX_ENABLED=1)
list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-unix)

####################################
#Vulkan
####################################
set(VULKAN_DRIVER_SOURCE_DIR ${GODOT_DRIVERS_BASE_DIR}/vulkan)
set(VULKAN_DRIVER_SOURCE
    ${VULKAN_DRIVER_SOURCE_DIR}/rendering_device_vulkan.cpp
    ${VULKAN_DRIVER_SOURCE_DIR}/rendering_device_vulkan.h
    ${VULKAN_DRIVER_SOURCE_DIR}/vulkan_context.cpp
    ${VULKAN_DRIVER_SOURCE_DIR}/vulkan_context.h
    ${VULKAN_DRIVER_SOURCE_DIR}/vulkan_hooks.h
    )
add_library(driver-vulkan STATIC ${VULKAN_DRIVER_SOURCE})
target_link_libraries(driver-vulkan PUBLIC godot-error godot-os vulkan)
target_compile_definitions(driver-vulkan PUBLIC VULKAN_ENABLED=1 USE_VOLK=1)
list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL driver-vulkan)

####################################
#driver
####################################
set(GODOT_DRIVER_BASE_SOURCE
    ${GODOT_DRIVERS_BASE_DIR}/register_driver_types.h
    ${GODOT_DRIVERS_BASE_DIR}/register_driver_types.cpp
    )
add_library(godot-driver STATIC ${GODOT_DRIVER_BASE_SOURCE})
target_link_libraries(godot-driver PUBLIC godot-extension driver-png)
list(APPEND GODOT_DRIVER_LIBRARIES_INTERNAL godot-driver)

set(GODOT_DRIVER_LIBRARIES ${GODOT_DRIVER_LIBRARIES_INTERNAL} PARENT_SCOPE)
