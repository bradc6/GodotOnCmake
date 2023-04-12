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

if(${WANT_OPENGL} AND ${OPENGL_FOUND})
    #Generate output filenames for GLES3 shaders to the c++ glsl.gen
    set(GLES3_DRIVER_SHADER_INCLUDE_DIR ${CMAKE_BINARY_INCLUDE_DIR}/drivers/gles3)
    string(REPLACE ${GLES3_DRIVER_SOURCE_DIR} ${GLES3_DRIVER_SHADER_INCLUDE_DIR} GLES3_GLSL_SHADERS_GENERATED "${GLES3_GLSL_SHADERS}")
    string(REPLACE "glsl" "glsl.gen.h" GLES3_GLSL_SHADERS_GENERATED "${GLES3_GLSL_SHADERS_GENERATED}")
    GENERATE_SHADER_SOURCES(gles3 "${GLES3_GLSL_SHADERS}" "${GLES3_GLSL_SHADERS_GENERATED}")

    #The gles library itself
    godot_add_library(driver-gles3 drivers STATIC ${GLES3_DRIVER_SOURCE} ${GLES3_GLSL_SHADERS_GENERATED})
    target_include_directories(driver-gles3 PUBLIC ${CMAKE_BINARY_INCLUDE_DIR})
    target_link_libraries(driver-gles3 PUBLIC godot-core glad)
    target_compile_definitions(driver-gles3 PUBLIC GLES3_ENABLED=1 GLES_OVER_GL=1 GLAD_ENABLED=1)
endif()