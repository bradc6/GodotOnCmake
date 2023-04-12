#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

if (${WANT_VULKAN} AND ${VULKAN_FOUND})
    set(VULKAN_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/vulkan)
    set(VULKAN_SOURCE
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_ggp.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_core.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_ios.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_win32.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_xcb.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_directfb.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_wayland.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_android.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_enums.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_xlib.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_xlib_xrandr.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vk_sdk_platform.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vk_layer.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_static_assertions.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_macos.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_handles.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_beta.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_structs.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_fuchsia.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_raii.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vk_icd.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_to_string.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_hash.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_screen.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_format_traits.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_vi.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_funcs.hpp
        ${VULKAN_SOURCE_DIR}/include/vulkan/vulkan_metal.h
        ${VULKAN_SOURCE_DIR}/include/vulkan/vk_platform.h
        ${VULKAN_SOURCE_DIR}/include/vk_video/vulkan_video_codecs_common.h
        ${VULKAN_SOURCE_DIR}/include/vk_video/vulkan_video_codec_h264std_encode.h
        ${VULKAN_SOURCE_DIR}/include/vk_video/vulkan_video_codec_h265std.h
        ${VULKAN_SOURCE_DIR}/include/vk_video/vulkan_video_codec_h265std_encode.h
        ${VULKAN_SOURCE_DIR}/include/vk_video/vulkan_video_codec_h265std_decode.h
        ${VULKAN_SOURCE_DIR}/include/vk_video/vulkan_video_codec_h264std.h
        ${VULKAN_SOURCE_DIR}/include/vk_video/vulkan_video_codec_h264std_decode.h
        ${VULKAN_SOURCE_DIR}/vk_enum_string_helper.h
        ${VULKAN_SOURCE_DIR}/vk_mem_alloc.cpp
        ${VULKAN_SOURCE_DIR}/vk_mem_alloc.h
        )
    godot_add_library(vulkan thirdparty STATIC ${VULKAN_SOURCE})
    target_include_directories(vulkan PUBLIC ${VULKAN_SOURCE_DIR}/include ${VULKAN_SOURCE_DIR})
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        target_compile_definitions(vulkan PUBLIC VK_USE_PLATFORM_XLIB_KHR=1 USE_VOLK=1 VK_ENABLE_BETA_EXTENSIONS=1 VK_KHR_xlib_surface=1 VMA_DYNAMIC_VULKAN_FUNCTIONS=0 VMA_STATIC_VULKAN_FUNCTIONS=1 VMA_VULKAN_VERSION=1003000)
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        target_compile_definitions(vulkan PUBLIC VK_USE_PLATFORM_WIN32_KHR=1 USE_VOLK=1 VK_ENABLE_BETA_EXTENSIONS=1 VK_KHR_win32_surface=1 VMA_DYNAMIC_VULKAN_FUNCTIONS=0 VMA_STATIC_VULKAN_FUNCTIONS=1 VMA_VULKAN_VERSION=1003000)
    else()
        message(ERROR "Vulkan not supported correctly on this platform. Revise CMakeLists.txt for thirdparty/vulkan.")
    endif()
    target_link_libraries(vulkan PUBLIC volk)
endif()
