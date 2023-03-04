cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_SOURCE_ROOT_PLATFORM_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/platform)

#This variable holds all the targets of this subdirectory
set(GODOT_PLATFORM_LIBRARIES_INTERNAL)


set(PLATFORM_LINUXBSD_SOURCE_DIR ${GODOT_SOURCE_ROOT_PLATFORM_DIR}/linuxbsd)
set(PLATFORM_LINUXBSD_SOURCE
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/crash_handler_linuxbsd.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/crash_handler_linuxbsd.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/dbus-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/dbus-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/detect.py
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/export/export_plugin.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/export/export.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/export/export.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/export/export_plugin.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/fontconfig-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/fontconfig-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/freedesktop_portal_desktop.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/freedesktop_portal_desktop.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/freedesktop_screensaver.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/freedesktop_screensaver.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/godot_linuxbsd.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/joypad_linux.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/joypad_linux.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/libudev-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/libudev-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/logo.svg
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/os_linuxbsd.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/os_linuxbsd.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/pck_embed.ld
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/pck_embed.legacy.ld
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/platform_config.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/platform_linuxbsd_builders.py
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/README.md
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/run_icon.svg
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/SCsub
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/speechd-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/speechd-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/tts_linux.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/tts_linux.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/key_mapping_x11.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xrandr-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xlib-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xrandr-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xrender-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xext-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xrender-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xinput2-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xcursor-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xext-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xinput2-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xlib-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xinerama-so_wrap.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xcursor-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/dynwrappers/xinerama-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/key_mapping_x11.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/gl_manager_x11.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/display_server_x11.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/gl_manager_x11.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/display_server_x11.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/detect_prime_x11.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/vulkan_context_x11.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/SCsub
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/detect_prime_x11.cpp
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/x11/vulkan_context_x11.h
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/xkbcommon-so_wrap.c
    ${PLATFORM_LINUXBSD_SOURCE_DIR}/xkbcommon-so_wrap.h
    )


#Find the package to link and enable/disable
add_library(platform-linuxbsd STATIC ${PLATFORM_LINUXBSD_SOURCE})
target_include_directories(platform-linuxbsd PRIVATE
                                             ${GODOT_ENGINE_ROOT_DIRECTORY}
                                             ${DBUS_INCLUDE_DIRS}
                                             ${GODOT_FAKEGEN_ROOT_DIR}
                                             ${GODOT_FAKEGEN_ROOT_DIR}/platform/linuxbsd)
target_include_directories(platform-linuxbsd PUBLIC ${PLATFORM_LINUXBSD_SOURCE_DIR})
target_link_libraries(platform-linuxbsd PUBLIC ${DBUS_LIBRARIES} driver-unix driver-alsa driver-vulkan driver-alsa-midi driver-gles3 driver-pulseaudio)

#Required to always be enabled on linux 
target_compile_definitions(platform-linuxbsd PUBLIC JOYDEV_ENABLED=1 ALSAMIDI_ENABLED=1)

if(${ALSA_FOUND})
    target_compile_definitions(platform-linuxbsd PUBLIC ALSA_ENABLED=1)
endif()

if(${PULSEAUDIO_FOUND})
    target_compile_definitions(platform-linuxbsd PUBLIC PULSEAUDIO_ENABLED=1)
endif()


if(${X11_FOUND})
    target_compile_definitions(platform-linuxbsd PUBLIC X11_ENABLED=1)
endif()

if(${FOUND_MNTENT})
    target_compile_definitions(platform-linuxbsd PUBLIC HAVE_MNTENT=1)
endif()

if(${Fontconfig_FOUND})
    target_compile_definitions(platform-linuxbsd PUBLIC FONTCONFIG_ENABLED=1)
endif()

if(${Vulkan_FOUND})
    target_compile_definitions(platform-linuxbsd PUBLIC VULKAN_ENABLED=1 USE_VOLK=1)
    target_link_libraries(platform-linuxbsd PUBLIC vulkan glad volk)
    target_link_libraries (platform-linuxbsd PUBLIC ${Vulkan_LIBRARY})
endif()

if(${OPENGL_FOUND})
    target_compile_definitions(platform-linuxbsd PUBLIC GLES3_ENABLED=1)
    target_link_libraries(platform-linuxbsd PUBLIC OpenGL::GL)
endif()

if(${X11_FOUND})
    target_link_libraries(platform-linuxbsd PUBLIC ${X11_LIBRARIES})
endif()

if(${DBUS_FOUND})
    target_compile_definitions(platform-linuxbsd PUBLIC DBUS_ENABLED=1)
endif()

list(APPEND GODOT_PLATFORM_LIBRARIES_INTERNAL platform-linuxbsd)
set(GODOT_PLATFORM_LIBRARIES ${GODOT_PLATFORM_LIBRARIES_INTERNAL} PARENT_SCOPE)