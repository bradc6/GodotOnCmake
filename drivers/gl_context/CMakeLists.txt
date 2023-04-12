cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GLCONTEXT_DRIVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/glad)
set(GLCONTEXT_DRIVER_SOURCE
    ${GLCONTEXT_DRIVER_SOURCE_DIR}/gl.c
    )

if(${WANT_OPENGL} AND ${OPENGL_FOUND})
    godot_add_library(driver-glcontext drivers STATIC ${GLCONTEXT_DRIVER_SOURCE})
    target_compile_definitions(driver-glcontext PUBLIC GLAD_ENABLED=1 GLES_OVER_GL=1)
    target_include_directories(driver-glcontext PUBLIC ${GLCONTEXT_DRIVER_SOURCE_DIR})
endif()