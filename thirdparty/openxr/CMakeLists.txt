#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(OPENXR_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/openxr)
set(OPENXR_SOURCE
    ${OPENXR_SOURCE_DIR}/include/openxr/openxr_platform_defines.h
    ${OPENXR_SOURCE_DIR}/include/openxr/openxr.h
    ${OPENXR_SOURCE_DIR}/include/openxr/openxr_reflection.h
    ${OPENXR_SOURCE_DIR}/include/openxr/openxr_reflection_structs.h
    ${OPENXR_SOURCE_DIR}/include/openxr/openxr_platform.h
    ${OPENXR_SOURCE_DIR}/include/openxr/openxr_reflection_parent_structs.h
    ${OPENXR_SOURCE_DIR}/src/xr_generated_dispatch_table.h
    ${OPENXR_SOURCE_DIR}/src/xr_generated_dispatch_table.c
    ${OPENXR_SOURCE_DIR}/src/common/hex_and_handles.h
    ${OPENXR_SOURCE_DIR}/src/common/filesystem_utils.hpp
    ${OPENXR_SOURCE_DIR}/src/common/xr_linear.h
    ${OPENXR_SOURCE_DIR}/src/common/stdfs_conditions.h
    ${OPENXR_SOURCE_DIR}/src/common/filesystem_utils.cpp
    ${OPENXR_SOURCE_DIR}/src/common/unique_asset.h
    ${OPENXR_SOURCE_DIR}/src/common/platform_utils.hpp
    ${OPENXR_SOURCE_DIR}/src/common/xr_dependencies.h
    ${OPENXR_SOURCE_DIR}/src/common/object_info.h
    ${OPENXR_SOURCE_DIR}/src/common/extra_algorithms.h
    ${OPENXR_SOURCE_DIR}/src/common/loader_interfaces.h
    ${OPENXR_SOURCE_DIR}/src/common/object_info.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/manifest_file.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/android_utilities.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/xr_generated_loader.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/api_layer_interface.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/exception_handling.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/runtime_interface.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/api_layer_interface.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_instance.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/manifest_file.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_instance.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/android_utilities.h
    ${OPENXR_SOURCE_DIR}/src/loader/runtime_interface.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/xr_generated_loader.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_logger_recorders.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_core.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_platform.hpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_logger_recorders.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_logger.cpp
    ${OPENXR_SOURCE_DIR}/src/loader/loader_logger.hpp
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/json.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/version.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/reader.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/forwards.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/config.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/assertions.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/allocator.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/writer.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/json_features.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include/json/value.h
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/src/lib_json/json_value.cpp
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/src/lib_json/json_writer.cpp
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/src/lib_json/json_reader.cpp
    ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/src/lib_json/json_tool.h
    )
godot_add_library(openxr thirdparty STATIC ${OPENXR_SOURCE})
target_include_directories(openxr PUBLIC ${OPENXR_SOURCE_DIR}/include)
target_include_directories(openxr PRIVATE
                                ${OPENXR_SOURCE_DIR}/src
                                ${OPENXR_SOURCE_DIR}/src/common
                                ${OPENXR_SOURCE_DIR}/src/external/jsoncpp/include)
                                
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	target_compile_definitions(openxr PUBLIC XR_OS_LINUX=1 HAVE_SECURE_GETENV=1)
endif()
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	target_compile_definitions(openxr PUBLIC XR_OS_WINDOWS=1 XR_USE_PLATFORM_WIN32=1)
endif()
if(${WANT_OPENGL} AND ${OPENGL_FOUND})
    target_link_libraries(openxr PUBLIC ${OPENGL_LIBRARIES})
endif()
if(${WANT_VULKAN} AND ${VULKAN_FOUND})
    target_link_libraries(openxr PUBLIC vulkan)
endif()
target_compile_options(openxr PRIVATE -w)
