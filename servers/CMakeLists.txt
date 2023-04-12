#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_SOURCE_ROOT_SERVERS_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/servers)

####################################
#Audio
####################################
set(AUDIO_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/audio)
set(AUDIO_SERVER_SOURCE
	${AUDIO_SERVER_SOURCE_DIR}/audio_driver_dummy.cpp
	${AUDIO_SERVER_SOURCE_DIR}/audio_driver_dummy.h
	${AUDIO_SERVER_SOURCE_DIR}/audio_effect.cpp
	${AUDIO_SERVER_SOURCE_DIR}/audio_effect.h
	${AUDIO_SERVER_SOURCE_DIR}/audio_filter_sw.cpp
	${AUDIO_SERVER_SOURCE_DIR}/audio_filter_sw.h
	${AUDIO_SERVER_SOURCE_DIR}/audio_rb_resampler.cpp
	${AUDIO_SERVER_SOURCE_DIR}/audio_rb_resampler.h
	${AUDIO_SERVER_SOURCE_DIR}/audio_stream.cpp
	${AUDIO_SERVER_SOURCE_DIR}/audio_stream.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_distortion.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_delay.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_eq.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_pitch_shift.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_spectrum_analyzer.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_limiter.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/eq_filter.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_stereo_enhance.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_capture.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_compressor.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_record.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_amplify.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_panner.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_spectrum_analyzer.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_stereo_enhance.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_phaser.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_chorus.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_filter.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_phaser.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_stream_generator.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_distortion.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_panner.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_chorus.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_amplify.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/reverb_filter.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_capture.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_pitch_shift.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/eq_filter.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_record.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_stream_generator.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_reverb.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_filter.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_limiter.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/reverb_filter.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_eq.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_reverb.cpp
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_delay.h
	${AUDIO_SERVER_SOURCE_DIR}/effects/audio_effect_compressor.h
)
godot_add_library(godot-server-audio servers STATIC ${AUDIO_SERVER_SOURCE})
target_link_libraries(godot-server-audio PUBLIC godot-io)

####################################
#Camera
####################################
set(CAMERA_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/camera)
set(CAMERA_SERVER_SOURCE
	${CAMERA_SERVER_SOURCE_DIR}/camera_feed.h
	${CAMERA_SERVER_SOURCE_DIR}/camera_feed.cpp
	)
godot_add_library(godot-server-camera servers STATIC ${CAMERA_SERVER_SOURCE})
target_link_libraries(godot-server-camera PUBLIC godot-io)

####################################
#Debugged
####################################
set(DEBUGGER_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/debugger)
set(DEBUGGER_SERVER_SOURCE
	${DEBUGGER_SERVER_SOURCE_DIR}/servers_debugger.h
	${DEBUGGER_SERVER_SOURCE_DIR}/servers_debugger.cpp
	)
godot_add_library(godot-server-debugger servers STATIC ${DEBUGGER_SERVER_SOURCE})
target_link_libraries(godot-server-debugger PUBLIC godot-debugger)

####################################
#Extensions
####################################
set(EXTENSIONS_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/extensions)
set(EXTENSIONS_SERVER_SOURCE
	${EXTENSIONS_SERVER_SOURCE_DIR}/physics_server_2d_extension.cpp
	${EXTENSIONS_SERVER_SOURCE_DIR}/physics_server_2d_extension.h
	${EXTENSIONS_SERVER_SOURCE_DIR}/physics_server_3d_extension.cpp
	${EXTENSIONS_SERVER_SOURCE_DIR}/physics_server_3d_extension.h
	)
godot_add_library(godot-server-extensions servers STATIC ${EXTENSIONS_SERVER_SOURCE})
target_link_libraries(godot-server-extensions PUBLIC godot-extension)

####################################
#Movie Writer
####################################
set(MOVIE_WRITER_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/movie_writer)
set(MOVIE_WRITER_SERVER_SOURCE
	${MOVIE_WRITER_SERVER_SOURCE_DIR}/movie_writer.cpp
	${MOVIE_WRITER_SERVER_SOURCE_DIR}/movie_writer.h
	${MOVIE_WRITER_SERVER_SOURCE_DIR}/movie_writer_mjpeg.cpp
	${MOVIE_WRITER_SERVER_SOURCE_DIR}/movie_writer_mjpeg.h
	${MOVIE_WRITER_SERVER_SOURCE_DIR}/movie_writer_pngwav.cpp
	${MOVIE_WRITER_SERVER_SOURCE_DIR}/movie_writer_pngwav.h
	)
godot_add_library(godot-server-movie-writer servers STATIC ${MOVIE_WRITER_SERVER_SOURCE})
target_link_libraries(godot-server-movie-writer PUBLIC godot-templates)

####################################
#Navigation
####################################
set(NAVIGATION_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/navigation)
set(NAVIGATION_SERVER_SOURCE
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_parameters_2d.cpp
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_parameters_2d.h
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_parameters_3d.cpp
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_parameters_3d.h
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_result_2d.cpp
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_result_2d.h
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_result_3d.cpp
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_path_query_result_3d.h
	${NAVIGATION_SERVER_SOURCE_DIR}/navigation_utilities.h
	)
godot_add_library(godot-server-navigation servers STATIC ${NAVIGATION_SERVER_SOURCE})
target_link_libraries(godot-server-navigation PUBLIC godot-object)

####################################
#Physics 2D
####################################
set(PHYSICS_2D_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_2d)
set(PHYSICS_2D_SOURCE
	${PHYSICS_2D_SOURCE_DIR}/godot_area_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_area_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_area_pair_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_area_pair_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_body_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_body_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_body_direct_state_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_body_direct_state_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_body_pair_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_body_pair_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_broad_phase_2d_bvh.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_broad_phase_2d_bvh.h
	${PHYSICS_2D_SOURCE_DIR}/godot_broad_phase_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_broad_phase_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_collision_object_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_collision_object_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_collision_solver_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_collision_solver_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_collision_solver_2d_sat.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_collision_solver_2d_sat.h
	${PHYSICS_2D_SOURCE_DIR}/godot_constraint_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_joints_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_joints_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_physics_server_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_physics_server_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_shape_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_shape_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_space_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_space_2d.h
	${PHYSICS_2D_SOURCE_DIR}/godot_step_2d.cpp
	${PHYSICS_2D_SOURCE_DIR}/godot_step_2d.h
	)
godot_add_library(godot-server-physics-2D servers STATIC ${PHYSICS_2D_SOURCE})
target_link_libraries(godot-server-physics-2D PUBLIC godot-math)

####################################
#Physics 3D
####################################
set(PHYSICS_3D_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_3d)
set(PHYSICS_3D_SOURCE
	${PHYSICS_3D_SOURCE_DIR}/gjk_epa.cpp
	${PHYSICS_3D_SOURCE_DIR}/gjk_epa.h
	${PHYSICS_3D_SOURCE_DIR}/godot_area_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_area_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_area_pair_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_area_pair_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_body_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_body_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_body_direct_state_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_body_direct_state_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_body_pair_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_body_pair_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_broad_phase_3d_bvh.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_broad_phase_3d_bvh.h
	${PHYSICS_3D_SOURCE_DIR}/godot_broad_phase_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_broad_phase_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_collision_object_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_collision_object_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_collision_solver_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_collision_solver_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_collision_solver_3d_sat.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_collision_solver_3d_sat.h
	${PHYSICS_3D_SOURCE_DIR}/godot_constraint_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_joint_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_physics_server_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_physics_server_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_shape_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_shape_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_soft_body_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_soft_body_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_space_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_space_3d.h
	${PHYSICS_3D_SOURCE_DIR}/godot_step_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/godot_step_3d.h
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_jacobian_entry_3d.h
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_hinge_joint_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_cone_twist_joint_3d.h
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_slider_joint_3d.h
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_cone_twist_joint_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_pin_joint_3d.h
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_generic_6dof_joint_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_generic_6dof_joint_3d.h
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_pin_joint_3d.cpp
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_hinge_joint_3d.h
	${PHYSICS_3D_SOURCE_DIR}/joints/godot_slider_joint_3d.cpp
	)
godot_add_library(godot-server-physics-3D servers STATIC ${PHYSICS_3D_SOURCE})
target_link_libraries(godot-server-physics-3D PUBLIC godot-math)

####################################
#Renderer
####################################
set(RENDERER_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/rendering)
set(RENDERER_SERVER_SOURCE
	${RENDERER_SERVER_SOURCE_DIR}/dummy/rasterizer_dummy.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/rasterizer_scene_dummy.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/environment/fog.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/environment/gi.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/rasterizer_canvas_dummy.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/texture_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/utilities.cpp
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/light_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/particles_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/utilities.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/texture_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/mesh_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/mesh_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/dummy/storage/material_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/environment/renderer_fog.h
	${RENDERER_SERVER_SOURCE_DIR}/environment/renderer_gi.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_canvas_cull.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_canvas_cull.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_canvas_render.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_canvas_render.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_compositor.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_compositor.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_geometry_instance.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_geometry_instance.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/tone_mapper.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/taa.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/vrs.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/copy_effects.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/fsr.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/taa.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/copy_effects.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/bokeh_dof.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/resolve.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/vrs.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/ss_effects.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/luminance.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/bokeh_dof.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/tone_mapper.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/fsr.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/luminance.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/resolve.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects/ss_effects.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/light_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/render_buffer_custom_data_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/texture_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/utilities.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/light_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/forward_id_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/particles_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/render_scene_data_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/render_scene_buffers_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/forward_id_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/utilities.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/texture_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/mesh_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/render_scene_data_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/mesh_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/render_scene_buffers_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/material_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/material_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/storage_rd/particles_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/pipeline_cache_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/renderer_canvas_render_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_clustered/scene_shader_forward_clustered.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_clustered/render_forward_clustered.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_clustered/scene_shader_forward_clustered.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_clustered/render_forward_clustered.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/framebuffer_cache_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/effects_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/uniform_set_cache_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/framebuffer_cache_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shader_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shader_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/pipeline_cache_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/renderer_canvas_render_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/environment/gi.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/environment/fog.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/environment/fog.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/environment/sky.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/environment/sky.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/environment/gi.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/renderer_scene_render_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/cluster_builder_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/renderer_compositor_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/cluster_builder_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/renderer_compositor_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/renderer_scene_render_rd.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_mobile/render_forward_mobile.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_mobile/scene_shader_forward_mobile.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_mobile/scene_shader_forward_mobile.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/forward_mobile/render_forward_mobile.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/uniform_set_cache_rd.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_scene_cull.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_scene_cull.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_scene_occlusion_cull.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_scene_occlusion_cull.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_scene_render.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_scene_render.h
	${RENDERER_SERVER_SOURCE_DIR}/renderer_viewport.cpp
	${RENDERER_SERVER_SOURCE_DIR}/renderer_viewport.h
	${RENDERER_SERVER_SOURCE_DIR}/rendering_device_binds.cpp
	${RENDERER_SERVER_SOURCE_DIR}/rendering_device_binds.h
	${RENDERER_SERVER_SOURCE_DIR}/rendering_device.cpp
	${RENDERER_SERVER_SOURCE_DIR}/rendering_device.h
	${RENDERER_SERVER_SOURCE_DIR}/rendering_method.cpp
	${RENDERER_SERVER_SOURCE_DIR}/rendering_method.h
	${RENDERER_SERVER_SOURCE_DIR}/rendering_server_default.cpp
	${RENDERER_SERVER_SOURCE_DIR}/rendering_server_default.h
	${RENDERER_SERVER_SOURCE_DIR}/rendering_server_globals.cpp
	${RENDERER_SERVER_SOURCE_DIR}/rendering_server_globals.h
	${RENDERER_SERVER_SOURCE_DIR}/shader_compiler.cpp
	${RENDERER_SERVER_SOURCE_DIR}/shader_compiler.h
	${RENDERER_SERVER_SOURCE_DIR}/shader_language.cpp
	${RENDERER_SERVER_SOURCE_DIR}/shader_language.h
	${RENDERER_SERVER_SOURCE_DIR}/shader_preprocessor.cpp
	${RENDERER_SERVER_SOURCE_DIR}/shader_preprocessor.h
	${RENDERER_SERVER_SOURCE_DIR}/shader_types.cpp
	${RENDERER_SERVER_SOURCE_DIR}/shader_types.h
	${RENDERER_SERVER_SOURCE_DIR}/shader_warnings.cpp
	${RENDERER_SERVER_SOURCE_DIR}/shader_warnings.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/camera_attributes_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/utilities.cpp
	${RENDERER_SERVER_SOURCE_DIR}/storage/light_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/render_scene_buffers.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/particles_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/environment_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/storage/camera_attributes_storage.cpp
	${RENDERER_SERVER_SOURCE_DIR}/storage/utilities.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/texture_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/render_scene_buffers.cpp
	${RENDERER_SERVER_SOURCE_DIR}/storage/mesh_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/environment_storage.h
	${RENDERER_SERVER_SOURCE_DIR}/storage/material_storage.h

	)

set(RENDERER_SERVER_SHADERS
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/canvas_uniforms_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/blit.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssil_interleave.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_roughness_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/bokeh_dof_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssao.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_downsampler.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssao_importance_map.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/screen_space_reflection.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/vrs.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/fsr_upscale.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_downsampler_raster.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/tonemap.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssil_blur.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssil.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssil_importance_map.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cube_to_dp.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/blur_raster_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_filter.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/copy_to_fb.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/copy.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/screen_space_reflection_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/specular_merge.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/resolve.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ss_effects_downsample.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssao_blur.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/screen_space_reflection_filter.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/luminance_reduce.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_downsampler_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/luminance_reduce_raster_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_roughness.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/bokeh_dof.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_roughness_raster.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/bokeh_dof_raster.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/taa_resolve.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/ssao_interleave.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/blur_raster.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/screen_space_reflection_scale.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/subsurface_scattering.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/luminance_reduce_raster.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/effects/cubemap_filter_raster.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/scene_data_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/cluster_data_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/forward_clustered/scene_forward_clustered_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/forward_clustered/scene_forward_clustered.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/canvas.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/scene_forward_gi_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/sort.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/light_data_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/giprobe_write.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/skeleton.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/particles.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/particles_copy.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/roughness_limiter.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/sdfgi_preprocess.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/volumetric_fog_process.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/sdfgi_integrate.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/voxel_gi.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/volumetric_fog.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/voxel_gi_sdf.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/sky.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/sdfgi_debug.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/sdfgi_debug_probes.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/voxel_gi_debug.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/gi.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/environment/sdfgi_direct_light.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/canvas_sdf.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/decal_data_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/scene_forward_lights_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/cluster_render.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/scene_forward_aa_inc.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/cluster_debug.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/cluster_store.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/canvas_occlusion.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/forward_mobile/scene_forward_mobile.glsl
	${RENDERER_SERVER_SOURCE_DIR}/renderer_rd/shaders/forward_mobile/scene_forward_mobile_inc.glsl
	)

#Generate output filenames for GLES3 shaders
set(RENDERER_SERVER_INCLUDE_DIR ${CMAKE_BINARY_INCLUDE_DIR}/servers/rendering)
string(REPLACE ${RENDERER_SERVER_SOURCE_DIR} ${RENDERER_SERVER_INCLUDE_DIR} RENDERER_SERVER_SHADERS_GENERATED "${RENDERER_SERVER_SHADERS}")
string(REPLACE "glsl" "glsl.gen.h" RENDERER_SERVER_SHADERS_GENERATED "${RENDERER_SERVER_SHADERS_GENERATED}")
GENERATE_SHADER_SOURCES(glsl "${RENDERER_SERVER_SHADERS}" "${RENDERER_SERVER_SHADERS_GENERATED}")

godot_add_library(godot-server-renderer servers STATIC ${RENDERER_SERVER_SOURCE} ${RENDERER_SERVER_SHADERS_GENERATED})
target_include_directories(godot-server-renderer PUBLIC ${CMAKE_BINARY_INCLUDE_DIR}) #Some other targets depend on specific generated shaders
target_link_libraries(godot-server-renderer PUBLIC godot-templates godot-os godot-glslang spirv-reflect)

####################################
#Text
####################################
set(TEXT_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/text)
set(TEXT_SERVER_SOURCE
	${TEXT_SERVER_SOURCE_DIR}/text_server_dummy.h
	${TEXT_SERVER_SOURCE_DIR}/text_server_extension.cpp
	${TEXT_SERVER_SOURCE_DIR}/text_server_extension.h
	)
godot_add_library(godot-server-text servers STATIC ${TEXT_SERVER_SOURCE})
target_link_libraries(godot-server-text PUBLIC godot-object)

####################################
#XR
####################################
set(XR_SERVER_SOURCE_DIR ${GODOT_SOURCE_ROOT_SERVERS_DIR}/xr)
set(XR_SERVER_SOURCE
	${XR_SERVER_SOURCE_DIR}/xr_interface.cpp
	${XR_SERVER_SOURCE_DIR}/xr_interface_extension.cpp
	${XR_SERVER_SOURCE_DIR}/xr_interface_extension.h
	${XR_SERVER_SOURCE_DIR}/xr_interface.h
	${XR_SERVER_SOURCE_DIR}/xr_pose.cpp
	${XR_SERVER_SOURCE_DIR}/xr_pose.h
	${XR_SERVER_SOURCE_DIR}/xr_positional_tracker.cpp
	${XR_SERVER_SOURCE_DIR}/xr_positional_tracker.h
	)
godot_add_library(godot-server-xr servers STATIC ${XR_SERVER_SOURCE})
target_link_libraries(godot-server-xr PUBLIC godot-math godot-object godot-os godot-server-renderer)

####################################
#Godot-Server
####################################
set(GODOT_SERVER_SOURCE
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/audio_server.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/camera_server.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/display_server.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/display_server_headless.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/navigation_server_2d.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/navigation_server_3d.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_2d.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_2d_wrap_mt.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_3d.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_3d_wrap_mt.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/register_server_types.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/rendering_server.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/server_wrap_mt_common.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/text_server.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/xr_server.h
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/audio_server.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/camera_server.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/display_server.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/navigation_server_2d.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/navigation_server_3d.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_2d.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_2d_wrap_mt.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_3d.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/physics_server_3d_wrap_mt.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/register_server_types.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/rendering_server.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/text_server.cpp
	${GODOT_SOURCE_ROOT_SERVERS_DIR}/xr_server.cpp
	)
godot_add_library(godot-servers servers STATIC ${GODOT_SERVER_SOURCE})
target_link_libraries(godot-servers PUBLIC
									godot-object
									godot-input
									godot-io
									godot-config
									godot-math
									godot-server-audio
									godot-server-camera
									godot-server-renderer
									godot-server-navigation
									godot-server-physics-2D
									godot-server-physics-3D
									godot-server-movie-writer
									godot-server-debugger
									godot-server-xr
									godot-server-extensions
									godot-server-text)

