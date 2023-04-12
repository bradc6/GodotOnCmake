#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

if(${WANT_OPENGL} AND ${OPENGL_FOUND})
    set(GLAD_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/glad)
    set(GLAD_SOURCE
        ${GLAD_SOURCE_DIR}/glad/glx.h
        ${GLAD_SOURCE_DIR}/glad/gl.h
        ${GLAD_SOURCE_DIR}/gl.c
        ${GLAD_SOURCE_DIR}/KHR/khrplatform.h
        )
    if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    else()
        set(GLAD_SOURCE ${GLAD_SOURCE}
            ${GLAD_SOURCE_DIR}/glx.c
            )
    endif()
    godot_add_library(glad thirdparty STATIC ${GLAD_SOURCE})
    target_include_directories(glad PUBLIC ${GLAD_SOURCE_DIR})
endif()
