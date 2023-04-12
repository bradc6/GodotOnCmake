#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

if(${WANT_VULKAN} AND ${VULKAN_FOUND})
    set(VOLK_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/volk)
    set(VOLK_SOURCE
        ${VOLK_SOURCE_DIR}/volk.c
        ${VOLK_SOURCE_DIR}/volk.h
        )
    godot_add_library(volk thirdparty STATIC ${VOLK_SOURCE})
    target_include_directories(volk PUBLIC ${VOLK_SOURCE_DIR})
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        target_compile_definitions(volk PUBLIC VK_KHR_video_decode_queue=1 VK_ENABLE_BETA_EXTENSIONS=1 VK_KHR_video_queue=1 VK_KHR_xlib_surface=1)
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        target_compile_definitions(volk PUBLIC VK_KHR_video_decode_queue=1 VK_ENABLE_BETA_EXTENSIONS=1 VK_KHR_video_queue=1 VK_KHR_win32_surface=1)
    else()
        message(ERROR "Vulkan not supported correctly on this platform. Revise CMakeLists.txt for thirdparty/vulkan.")
    endif()
    target_link_libraries(volk PUBLIC vulkan)
endif()