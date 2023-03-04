#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_SOURCE_ROOT_SCENE_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/scene)

#This variable holds all the targets of this subdirectory
set(GODOT_SCENE_LIBRARIES_INTERNAL)

####################################
#2D
####################################
set(2D_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/2d)
set(2D_SCENE_SOURCE
	${2D_SCENE_SOURCE_DIR}/animated_sprite_2d.cpp
	${2D_SCENE_SOURCE_DIR}/area_2d.cpp
	${2D_SCENE_SOURCE_DIR}/audio_listener_2d.cpp
	${2D_SCENE_SOURCE_DIR}/audio_stream_player_2d.cpp
	${2D_SCENE_SOURCE_DIR}/back_buffer_copy.cpp
	${2D_SCENE_SOURCE_DIR}/camera_2d.cpp
	${2D_SCENE_SOURCE_DIR}/canvas_group.cpp
	${2D_SCENE_SOURCE_DIR}/canvas_modulate.cpp
	${2D_SCENE_SOURCE_DIR}/collision_object_2d.cpp
	${2D_SCENE_SOURCE_DIR}/collision_polygon_2d.cpp
	${2D_SCENE_SOURCE_DIR}/collision_shape_2d.cpp
	${2D_SCENE_SOURCE_DIR}/cpu_particles_2d.cpp
	${2D_SCENE_SOURCE_DIR}/gpu_particles_2d.cpp
	${2D_SCENE_SOURCE_DIR}/joint_2d.cpp
	${2D_SCENE_SOURCE_DIR}/light_2d.cpp
	${2D_SCENE_SOURCE_DIR}/light_occluder_2d.cpp
	${2D_SCENE_SOURCE_DIR}/line_2d.cpp
	${2D_SCENE_SOURCE_DIR}/line_builder.cpp
	${2D_SCENE_SOURCE_DIR}/marker_2d.cpp
	${2D_SCENE_SOURCE_DIR}/mesh_instance_2d.cpp
	${2D_SCENE_SOURCE_DIR}/multimesh_instance_2d.cpp
	${2D_SCENE_SOURCE_DIR}/navigation_agent_2d.cpp
	${2D_SCENE_SOURCE_DIR}/navigation_link_2d.cpp
	${2D_SCENE_SOURCE_DIR}/navigation_obstacle_2d.cpp
	${2D_SCENE_SOURCE_DIR}/navigation_region_2d.cpp
	${2D_SCENE_SOURCE_DIR}/node_2d.cpp
	${2D_SCENE_SOURCE_DIR}/parallax_background.cpp
	${2D_SCENE_SOURCE_DIR}/parallax_layer.cpp
	${2D_SCENE_SOURCE_DIR}/path_2d.cpp
	${2D_SCENE_SOURCE_DIR}/physical_bone_2d.cpp
	${2D_SCENE_SOURCE_DIR}/physics_body_2d.cpp
	${2D_SCENE_SOURCE_DIR}/polygon_2d.cpp
	${2D_SCENE_SOURCE_DIR}/ray_cast_2d.cpp
	${2D_SCENE_SOURCE_DIR}/remote_transform_2d.cpp
	${2D_SCENE_SOURCE_DIR}/shape_cast_2d.cpp
	${2D_SCENE_SOURCE_DIR}/skeleton_2d.cpp
	${2D_SCENE_SOURCE_DIR}/sprite_2d.cpp
	${2D_SCENE_SOURCE_DIR}/tile_map.cpp
	${2D_SCENE_SOURCE_DIR}/touch_screen_button.cpp
	${2D_SCENE_SOURCE_DIR}/visible_on_screen_notifier_2d.cpp
	)
add_library(godot-scene-2d STATIC ${2D_SCENE_SOURCE})
target_link_libraries(godot-scene-2d PUBLIC godot-templates)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-2d)

####################################
#3D
####################################
set(3D_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/3d)
set(3D_SCENE_SOURCE
	${3D_SCENE_SOURCE_DIR}/area_3d.cpp
	${3D_SCENE_SOURCE_DIR}/area_3d.h
	${3D_SCENE_SOURCE_DIR}/audio_listener_3d.cpp
	${3D_SCENE_SOURCE_DIR}/audio_listener_3d.h
	${3D_SCENE_SOURCE_DIR}/audio_stream_player_3d.cpp
	${3D_SCENE_SOURCE_DIR}/audio_stream_player_3d.h
	${3D_SCENE_SOURCE_DIR}/bone_attachment_3d.cpp
	${3D_SCENE_SOURCE_DIR}/bone_attachment_3d.h
	${3D_SCENE_SOURCE_DIR}/camera_3d.cpp
	${3D_SCENE_SOURCE_DIR}/camera_3d.h
	${3D_SCENE_SOURCE_DIR}/collision_object_3d.cpp
	${3D_SCENE_SOURCE_DIR}/collision_object_3d.h
	${3D_SCENE_SOURCE_DIR}/collision_polygon_3d.cpp
	${3D_SCENE_SOURCE_DIR}/collision_polygon_3d.h
	${3D_SCENE_SOURCE_DIR}/collision_shape_3d.cpp
	${3D_SCENE_SOURCE_DIR}/collision_shape_3d.h
	${3D_SCENE_SOURCE_DIR}/cpu_particles_3d.cpp
	${3D_SCENE_SOURCE_DIR}/cpu_particles_3d.h
	${3D_SCENE_SOURCE_DIR}/decal.cpp
	${3D_SCENE_SOURCE_DIR}/decal.h
	${3D_SCENE_SOURCE_DIR}/fog_volume.cpp
	${3D_SCENE_SOURCE_DIR}/fog_volume.h
	${3D_SCENE_SOURCE_DIR}/gpu_particles_3d.cpp
	${3D_SCENE_SOURCE_DIR}/gpu_particles_3d.h
	${3D_SCENE_SOURCE_DIR}/gpu_particles_collision_3d.cpp
	${3D_SCENE_SOURCE_DIR}/gpu_particles_collision_3d.h
	${3D_SCENE_SOURCE_DIR}/importer_mesh_instance_3d.cpp
	${3D_SCENE_SOURCE_DIR}/importer_mesh_instance_3d.h
	${3D_SCENE_SOURCE_DIR}/joint_3d.cpp
	${3D_SCENE_SOURCE_DIR}/joint_3d.h
	${3D_SCENE_SOURCE_DIR}/label_3d.cpp
	${3D_SCENE_SOURCE_DIR}/label_3d.h
	${3D_SCENE_SOURCE_DIR}/light_3d.cpp
	${3D_SCENE_SOURCE_DIR}/light_3d.h
	${3D_SCENE_SOURCE_DIR}/lightmap_gi.cpp
	${3D_SCENE_SOURCE_DIR}/lightmap_gi.h
	${3D_SCENE_SOURCE_DIR}/lightmapper.cpp
	${3D_SCENE_SOURCE_DIR}/lightmapper.h
	${3D_SCENE_SOURCE_DIR}/lightmap_probe.cpp
	${3D_SCENE_SOURCE_DIR}/lightmap_probe.h
	${3D_SCENE_SOURCE_DIR}/marker_3d.cpp
	${3D_SCENE_SOURCE_DIR}/marker_3d.h
	${3D_SCENE_SOURCE_DIR}/mesh_instance_3d.cpp
	${3D_SCENE_SOURCE_DIR}/mesh_instance_3d.h
	${3D_SCENE_SOURCE_DIR}/multimesh_instance_3d.cpp
	${3D_SCENE_SOURCE_DIR}/multimesh_instance_3d.h
	${3D_SCENE_SOURCE_DIR}/navigation_agent_3d.cpp
	${3D_SCENE_SOURCE_DIR}/navigation_agent_3d.h
	${3D_SCENE_SOURCE_DIR}/navigation_link_3d.cpp
	${3D_SCENE_SOURCE_DIR}/navigation_link_3d.h
	${3D_SCENE_SOURCE_DIR}/navigation_obstacle_3d.cpp
	${3D_SCENE_SOURCE_DIR}/navigation_obstacle_3d.h
	${3D_SCENE_SOURCE_DIR}/navigation_region_3d.cpp
	${3D_SCENE_SOURCE_DIR}/navigation_region_3d.h
	${3D_SCENE_SOURCE_DIR}/node_3d.cpp
	${3D_SCENE_SOURCE_DIR}/node_3d.h
	${3D_SCENE_SOURCE_DIR}/occluder_instance_3d.cpp
	${3D_SCENE_SOURCE_DIR}/occluder_instance_3d.h
	${3D_SCENE_SOURCE_DIR}/path_3d.cpp
	${3D_SCENE_SOURCE_DIR}/path_3d.h
	${3D_SCENE_SOURCE_DIR}/physics_body_3d.cpp
	${3D_SCENE_SOURCE_DIR}/physics_body_3d.h
	${3D_SCENE_SOURCE_DIR}/ray_cast_3d.cpp
	${3D_SCENE_SOURCE_DIR}/ray_cast_3d.h
	${3D_SCENE_SOURCE_DIR}/reflection_probe.cpp
	${3D_SCENE_SOURCE_DIR}/reflection_probe.h
	${3D_SCENE_SOURCE_DIR}/remote_transform_3d.cpp
	${3D_SCENE_SOURCE_DIR}/remote_transform_3d.h
	${3D_SCENE_SOURCE_DIR}/shape_cast_3d.cpp
	${3D_SCENE_SOURCE_DIR}/shape_cast_3d.h
	${3D_SCENE_SOURCE_DIR}/skeleton_3d.cpp
	${3D_SCENE_SOURCE_DIR}/skeleton_3d.h
	${3D_SCENE_SOURCE_DIR}/skeleton_ik_3d.cpp
	${3D_SCENE_SOURCE_DIR}/skeleton_ik_3d.h
	${3D_SCENE_SOURCE_DIR}/soft_body_3d.cpp
	${3D_SCENE_SOURCE_DIR}/soft_body_3d.h
	${3D_SCENE_SOURCE_DIR}/spring_arm_3d.cpp
	${3D_SCENE_SOURCE_DIR}/spring_arm_3d.h
	${3D_SCENE_SOURCE_DIR}/sprite_3d.cpp
	${3D_SCENE_SOURCE_DIR}/sprite_3d.h
	${3D_SCENE_SOURCE_DIR}/vehicle_body_3d.cpp
	${3D_SCENE_SOURCE_DIR}/vehicle_body_3d.h
	${3D_SCENE_SOURCE_DIR}/velocity_tracker_3d.cpp
	${3D_SCENE_SOURCE_DIR}/velocity_tracker_3d.h
	${3D_SCENE_SOURCE_DIR}/visible_on_screen_notifier_3d.cpp
	${3D_SCENE_SOURCE_DIR}/visible_on_screen_notifier_3d.h
	${3D_SCENE_SOURCE_DIR}/visual_instance_3d.cpp
	${3D_SCENE_SOURCE_DIR}/visual_instance_3d.h
	${3D_SCENE_SOURCE_DIR}/voxel_gi.cpp
	${3D_SCENE_SOURCE_DIR}/voxel_gi.h
	${3D_SCENE_SOURCE_DIR}/voxelizer.cpp
	${3D_SCENE_SOURCE_DIR}/voxelizer.h
	${3D_SCENE_SOURCE_DIR}/world_environment.cpp
	${3D_SCENE_SOURCE_DIR}/world_environment.h
	${3D_SCENE_SOURCE_DIR}/xr_nodes.cpp
	${3D_SCENE_SOURCE_DIR}/xr_nodes.h
	)
add_library(godot-scene-3d STATIC ${3D_SCENE_SOURCE})
target_link_libraries(godot-scene-3d PUBLIC godot-os godot-templates godot-thirdparty-misc)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-3d)

####################################
#Animation
####################################
set(ANIMATION_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/animation)
set(ANIMATION_SCENE_SOURCE
	${ANIMATION_SCENE_SOURCE_DIR}/animation_blend_space_1d.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/animation_blend_space_1d.h
	${ANIMATION_SCENE_SOURCE_DIR}/animation_blend_space_2d.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/animation_blend_space_2d.h
	${ANIMATION_SCENE_SOURCE_DIR}/animation_blend_tree.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/animation_blend_tree.h
	${ANIMATION_SCENE_SOURCE_DIR}/animation_node_state_machine.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/animation_node_state_machine.h
	${ANIMATION_SCENE_SOURCE_DIR}/animation_player.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/animation_player.h
	${ANIMATION_SCENE_SOURCE_DIR}/animation_tree.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/animation_tree.h
	${ANIMATION_SCENE_SOURCE_DIR}/easing_equations.h
	${ANIMATION_SCENE_SOURCE_DIR}/root_motion_view.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/root_motion_view.h
	${ANIMATION_SCENE_SOURCE_DIR}/tween.cpp
	${ANIMATION_SCENE_SOURCE_DIR}/tween.h
	)
add_library(godot-scene-animation STATIC ${ANIMATION_SCENE_SOURCE})
target_link_libraries(godot-scene-animation PUBLIC godot-math godot-scene-2d godot-scene-3d)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-animation)

####################################
#Audio
####################################
set(AUDIO_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/audio)
set(AUDIO_SCENE_SOURCE
	${AUDIO_SCENE_SOURCE_DIR}/audio_stream_player.cpp
	${AUDIO_SCENE_SOURCE_DIR}/audio_stream_player.h
	)
add_library(godot-scene-audio STATIC ${AUDIO_SCENE_SOURCE})
target_link_libraries(godot-scene-audio PUBLIC godot-templates)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-audio)

####################################
#Debugger
####################################
set(DEBUGGER_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/debugger)
set(DEBUGGER_SCENE_SOURCE
	${DEBUGGER_SCENE_SOURCE_DIR}/scene_debugger.cpp
	${DEBUGGER_SCENE_SOURCE_DIR}/scene_debugger.h
	)
add_library(godot-scene-debugger STATIC ${DEBUGGER_SCENE_SOURCE})
target_link_libraries(godot-scene-debugger PUBLIC godot-object)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-debugger)

####################################
#GUI
####################################
set(GUI_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/gui)
set(GUI_SCENE_SOURCE
	${GUI_SCENE_SOURCE_DIR}/aspect_ratio_container.cpp
	${GUI_SCENE_SOURCE_DIR}/aspect_ratio_container.h
	${GUI_SCENE_SOURCE_DIR}/base_button.cpp
	${GUI_SCENE_SOURCE_DIR}/base_button.h
	${GUI_SCENE_SOURCE_DIR}/box_container.cpp
	${GUI_SCENE_SOURCE_DIR}/box_container.h
	${GUI_SCENE_SOURCE_DIR}/button.cpp
	${GUI_SCENE_SOURCE_DIR}/button.h
	${GUI_SCENE_SOURCE_DIR}/center_container.cpp
	${GUI_SCENE_SOURCE_DIR}/center_container.h
	${GUI_SCENE_SOURCE_DIR}/check_box.cpp
	${GUI_SCENE_SOURCE_DIR}/check_box.h
	${GUI_SCENE_SOURCE_DIR}/check_button.cpp
	${GUI_SCENE_SOURCE_DIR}/check_button.h
	${GUI_SCENE_SOURCE_DIR}/code_edit.cpp
	${GUI_SCENE_SOURCE_DIR}/code_edit.h
	${GUI_SCENE_SOURCE_DIR}/color_mode.cpp
	${GUI_SCENE_SOURCE_DIR}/color_mode.h
	${GUI_SCENE_SOURCE_DIR}/color_picker.cpp
	${GUI_SCENE_SOURCE_DIR}/color_picker.h
	${GUI_SCENE_SOURCE_DIR}/color_rect.cpp
	${GUI_SCENE_SOURCE_DIR}/color_rect.h
	${GUI_SCENE_SOURCE_DIR}/container.cpp
	${GUI_SCENE_SOURCE_DIR}/container.h
	${GUI_SCENE_SOURCE_DIR}/control.cpp
	${GUI_SCENE_SOURCE_DIR}/control.h
	${GUI_SCENE_SOURCE_DIR}/dialogs.cpp
	${GUI_SCENE_SOURCE_DIR}/dialogs.h
	${GUI_SCENE_SOURCE_DIR}/file_dialog.cpp
	${GUI_SCENE_SOURCE_DIR}/file_dialog.h
	${GUI_SCENE_SOURCE_DIR}/flow_container.cpp
	${GUI_SCENE_SOURCE_DIR}/flow_container.h
	${GUI_SCENE_SOURCE_DIR}/graph_edit.cpp
	${GUI_SCENE_SOURCE_DIR}/graph_edit.h
	${GUI_SCENE_SOURCE_DIR}/graph_node.cpp
	${GUI_SCENE_SOURCE_DIR}/graph_node.h
	${GUI_SCENE_SOURCE_DIR}/grid_container.cpp
	${GUI_SCENE_SOURCE_DIR}/grid_container.h
	${GUI_SCENE_SOURCE_DIR}/item_list.cpp
	${GUI_SCENE_SOURCE_DIR}/item_list.h
	${GUI_SCENE_SOURCE_DIR}/label.cpp
	${GUI_SCENE_SOURCE_DIR}/label.h
	${GUI_SCENE_SOURCE_DIR}/line_edit.cpp
	${GUI_SCENE_SOURCE_DIR}/line_edit.h
	${GUI_SCENE_SOURCE_DIR}/link_button.cpp
	${GUI_SCENE_SOURCE_DIR}/link_button.h
	${GUI_SCENE_SOURCE_DIR}/margin_container.cpp
	${GUI_SCENE_SOURCE_DIR}/margin_container.h
	${GUI_SCENE_SOURCE_DIR}/menu_bar.cpp
	${GUI_SCENE_SOURCE_DIR}/menu_bar.h
	${GUI_SCENE_SOURCE_DIR}/menu_button.cpp
	${GUI_SCENE_SOURCE_DIR}/menu_button.h
	${GUI_SCENE_SOURCE_DIR}/nine_patch_rect.cpp
	${GUI_SCENE_SOURCE_DIR}/nine_patch_rect.h
	${GUI_SCENE_SOURCE_DIR}/option_button.cpp
	${GUI_SCENE_SOURCE_DIR}/option_button.h
	${GUI_SCENE_SOURCE_DIR}/panel_container.cpp
	${GUI_SCENE_SOURCE_DIR}/panel_container.h
	${GUI_SCENE_SOURCE_DIR}/panel.cpp
	${GUI_SCENE_SOURCE_DIR}/panel.h
	${GUI_SCENE_SOURCE_DIR}/popup.cpp
	${GUI_SCENE_SOURCE_DIR}/popup.h
	${GUI_SCENE_SOURCE_DIR}/popup_menu.cpp
	${GUI_SCENE_SOURCE_DIR}/popup_menu.h
	${GUI_SCENE_SOURCE_DIR}/progress_bar.cpp
	${GUI_SCENE_SOURCE_DIR}/progress_bar.h
	${GUI_SCENE_SOURCE_DIR}/range.cpp
	${GUI_SCENE_SOURCE_DIR}/range.h
	${GUI_SCENE_SOURCE_DIR}/reference_rect.cpp
	${GUI_SCENE_SOURCE_DIR}/reference_rect.h
	${GUI_SCENE_SOURCE_DIR}/rich_text_effect.cpp
	${GUI_SCENE_SOURCE_DIR}/rich_text_effect.h
	${GUI_SCENE_SOURCE_DIR}/rich_text_label.cpp
	${GUI_SCENE_SOURCE_DIR}/rich_text_label.h
	${GUI_SCENE_SOURCE_DIR}/scroll_bar.cpp
	${GUI_SCENE_SOURCE_DIR}/scroll_bar.h
	${GUI_SCENE_SOURCE_DIR}/scroll_container.cpp
	${GUI_SCENE_SOURCE_DIR}/scroll_container.h
	${GUI_SCENE_SOURCE_DIR}/separator.cpp
	${GUI_SCENE_SOURCE_DIR}/separator.h
	${GUI_SCENE_SOURCE_DIR}/slider.cpp
	${GUI_SCENE_SOURCE_DIR}/slider.h
	${GUI_SCENE_SOURCE_DIR}/spin_box.cpp
	${GUI_SCENE_SOURCE_DIR}/spin_box.h
	${GUI_SCENE_SOURCE_DIR}/split_container.cpp
	${GUI_SCENE_SOURCE_DIR}/split_container.h
	${GUI_SCENE_SOURCE_DIR}/subviewport_container.cpp
	${GUI_SCENE_SOURCE_DIR}/subviewport_container.h
	${GUI_SCENE_SOURCE_DIR}/tab_bar.cpp
	${GUI_SCENE_SOURCE_DIR}/tab_bar.h
	${GUI_SCENE_SOURCE_DIR}/tab_container.cpp
	${GUI_SCENE_SOURCE_DIR}/tab_container.h
	${GUI_SCENE_SOURCE_DIR}/text_edit.cpp
	${GUI_SCENE_SOURCE_DIR}/text_edit.h
	${GUI_SCENE_SOURCE_DIR}/texture_button.cpp
	${GUI_SCENE_SOURCE_DIR}/texture_button.h
	${GUI_SCENE_SOURCE_DIR}/texture_progress_bar.cpp
	${GUI_SCENE_SOURCE_DIR}/texture_progress_bar.h
	${GUI_SCENE_SOURCE_DIR}/texture_rect.cpp
	${GUI_SCENE_SOURCE_DIR}/texture_rect.h
	${GUI_SCENE_SOURCE_DIR}/tree.cpp
	${GUI_SCENE_SOURCE_DIR}/tree.h
	${GUI_SCENE_SOURCE_DIR}/video_stream_player.cpp
	${GUI_SCENE_SOURCE_DIR}/video_stream_player.h
	${GUI_SCENE_SOURCE_DIR}/view_panner.cpp
	${GUI_SCENE_SOURCE_DIR}/view_panner.h
	)

add_library(godot-scene-gui STATIC ${GUI_SCENE_SOURCE})
target_link_libraries(godot-scene-gui PUBLIC godot-input godot-server-audio)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-gui)

####################################
#main
####################################
set(MAIN_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/main)
set(MAIN_SCENE_SOURCE
	${MAIN_SCENE_SOURCE_DIR}/canvas_item.cpp
	${MAIN_SCENE_SOURCE_DIR}/canvas_item.h
	${MAIN_SCENE_SOURCE_DIR}/canvas_layer.cpp
	${MAIN_SCENE_SOURCE_DIR}/canvas_layer.h
	${MAIN_SCENE_SOURCE_DIR}/http_request.cpp
	${MAIN_SCENE_SOURCE_DIR}/http_request.h
	${MAIN_SCENE_SOURCE_DIR}/instance_placeholder.cpp
	${MAIN_SCENE_SOURCE_DIR}/instance_placeholder.h
	${MAIN_SCENE_SOURCE_DIR}/missing_node.cpp
	${MAIN_SCENE_SOURCE_DIR}/missing_node.h
	${MAIN_SCENE_SOURCE_DIR}/multiplayer_api.cpp
	${MAIN_SCENE_SOURCE_DIR}/multiplayer_api.h
	${MAIN_SCENE_SOURCE_DIR}/multiplayer_peer.cpp
	${MAIN_SCENE_SOURCE_DIR}/multiplayer_peer.h
	${MAIN_SCENE_SOURCE_DIR}/node.cpp
	${MAIN_SCENE_SOURCE_DIR}/node.h
	${MAIN_SCENE_SOURCE_DIR}/resource_preloader.cpp
	${MAIN_SCENE_SOURCE_DIR}/resource_preloader.h
	${MAIN_SCENE_SOURCE_DIR}/scene_tree.cpp
	${MAIN_SCENE_SOURCE_DIR}/scene_tree.h
	${MAIN_SCENE_SOURCE_DIR}/shader_globals_override.cpp
	${MAIN_SCENE_SOURCE_DIR}/shader_globals_override.h
	${MAIN_SCENE_SOURCE_DIR}/timer.cpp
	${MAIN_SCENE_SOURCE_DIR}/timer.h
	${MAIN_SCENE_SOURCE_DIR}/viewport.cpp
	${MAIN_SCENE_SOURCE_DIR}/viewport.h
	${MAIN_SCENE_SOURCE_DIR}/window.cpp
	${MAIN_SCENE_SOURCE_DIR}/window.h
	)
add_library(godot-scene-main STATIC ${MAIN_SCENE_SOURCE})
target_link_libraries(godot-scene-main PUBLIC godot-io godot-string godot-object godot-os godot-scene-debugger godot-scene-animation godot-scene-gui)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-main)

####################################
#default theme
####################################
set(RESOURCES_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/resources)
set(RESOURCES_SCENE_SOURCE
	${RESOURCES_SCENE_SOURCE_DIR}/animation.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/animation.h
	${RESOURCES_SCENE_SOURCE_DIR}/animation_library.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/animation_library.h
	${RESOURCES_SCENE_SOURCE_DIR}/audio_stream_polyphonic.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/audio_stream_polyphonic.h
	${RESOURCES_SCENE_SOURCE_DIR}/audio_stream_wav.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/audio_stream_wav.h
	${RESOURCES_SCENE_SOURCE_DIR}/bit_map.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/bit_map.h
	${RESOURCES_SCENE_SOURCE_DIR}/bone_map.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/bone_map.h
	${RESOURCES_SCENE_SOURCE_DIR}/box_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/box_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/camera_attributes.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/camera_attributes.h
	${RESOURCES_SCENE_SOURCE_DIR}/canvas_item_material.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/canvas_item_material.h
	${RESOURCES_SCENE_SOURCE_DIR}/capsule_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/capsule_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/capsule_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/capsule_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/circle_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/circle_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/concave_polygon_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/concave_polygon_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/concave_polygon_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/concave_polygon_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/convex_polygon_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/convex_polygon_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/convex_polygon_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/convex_polygon_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/curve.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/curve.h
	${RESOURCES_SCENE_SOURCE_DIR}/cylinder_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/cylinder_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/environment.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/environment.h
	${RESOURCES_SCENE_SOURCE_DIR}/fog_material.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/fog_material.h
	${RESOURCES_SCENE_SOURCE_DIR}/font.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/font.h
	${RESOURCES_SCENE_SOURCE_DIR}/gradient.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/gradient.h
	${RESOURCES_SCENE_SOURCE_DIR}/height_map_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/height_map_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/immediate_mesh.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/immediate_mesh.h
	${RESOURCES_SCENE_SOURCE_DIR}/importer_mesh.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/importer_mesh.h
	${RESOURCES_SCENE_SOURCE_DIR}/label_settings.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/label_settings.h
	${RESOURCES_SCENE_SOURCE_DIR}/material.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/material.h
	${RESOURCES_SCENE_SOURCE_DIR}/mesh.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/mesh_data_tool.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/mesh_data_tool.h
	${RESOURCES_SCENE_SOURCE_DIR}/mesh.h
	${RESOURCES_SCENE_SOURCE_DIR}/mesh_library.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/mesh_library.h
	${RESOURCES_SCENE_SOURCE_DIR}/multimesh.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/multimesh.h
	${RESOURCES_SCENE_SOURCE_DIR}/navigation_mesh.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/navigation_mesh.h
	${RESOURCES_SCENE_SOURCE_DIR}/navigation_polygon.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/navigation_polygon.h
	${RESOURCES_SCENE_SOURCE_DIR}/packed_scene.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/packed_scene.h
	${RESOURCES_SCENE_SOURCE_DIR}/particle_process_material.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/particle_process_material.h
	${RESOURCES_SCENE_SOURCE_DIR}/physics_material.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/physics_material.h
	${RESOURCES_SCENE_SOURCE_DIR}/polygon_path_finder.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/polygon_path_finder.h
	${RESOURCES_SCENE_SOURCE_DIR}/primitive_meshes.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/primitive_meshes.h
	${RESOURCES_SCENE_SOURCE_DIR}/rectangle_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/rectangle_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/resource_format_text.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/resource_format_text.h
	${RESOURCES_SCENE_SOURCE_DIR}/segment_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/segment_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/separation_ray_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/separation_ray_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/separation_ray_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/separation_ray_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/shader.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/shader.h
	${RESOURCES_SCENE_SOURCE_DIR}/shader_include.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/shader_include.h
	${RESOURCES_SCENE_SOURCE_DIR}/shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_ccdik.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_ccdik.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_fabrik.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_fabrik.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_jiggle.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_jiggle.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_lookat.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_lookat.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_physicalbones.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_physicalbones.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_stackholder.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_stackholder.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_twoboneik.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_2d_twoboneik.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_stack_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_modification_stack_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_profile.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skeleton_profile.h
	${RESOURCES_SCENE_SOURCE_DIR}/skin.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/skin.h
	${RESOURCES_SCENE_SOURCE_DIR}/sky.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/sky.h
	${RESOURCES_SCENE_SOURCE_DIR}/sky_material.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/sky_material.h
	${RESOURCES_SCENE_SOURCE_DIR}/sphere_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/sphere_shape_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/sprite_frames.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/sprite_frames.h
	${RESOURCES_SCENE_SOURCE_DIR}/style_box.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/style_box.h
	${RESOURCES_SCENE_SOURCE_DIR}/surface_tool.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/surface_tool.h
	${RESOURCES_SCENE_SOURCE_DIR}/syntax_highlighter.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/syntax_highlighter.h
	${RESOURCES_SCENE_SOURCE_DIR}/text_file.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/text_file.h
	${RESOURCES_SCENE_SOURCE_DIR}/text_line.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/text_line.h
	${RESOURCES_SCENE_SOURCE_DIR}/text_paragraph.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/text_paragraph.h
	${RESOURCES_SCENE_SOURCE_DIR}/texture.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/texture.h
	${RESOURCES_SCENE_SOURCE_DIR}/theme.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/theme.h
	${RESOURCES_SCENE_SOURCE_DIR}/tile_set.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/tile_set.h
	${RESOURCES_SCENE_SOURCE_DIR}/video_stream.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/video_stream.h
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader.h
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader_nodes.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader_nodes.h
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader_particle_nodes.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader_particle_nodes.h
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader_sdf_nodes.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/visual_shader_sdf_nodes.h
	${RESOURCES_SCENE_SOURCE_DIR}/world_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/world_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/world_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/world_3d.h
	${RESOURCES_SCENE_SOURCE_DIR}/world_boundary_shape_2d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/world_boundary_shape_2d.h
	${RESOURCES_SCENE_SOURCE_DIR}/world_boundary_shape_3d.cpp
	${RESOURCES_SCENE_SOURCE_DIR}/world_boundary_shape_3d.h
	)

set(RESOURCE_DEFAULT_THEME_SOURCE
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/vslider_tick.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/add.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_on_disabled_mirrored.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/mini_checkerboard.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/tabs_menu.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/arrow_left.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/scroll_button_left.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/hslider_tick.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/arrow_down.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/radio_checked.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/color_picker_bar_arrow.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/grid_snap.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/scroll_button_left_hl.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/checked.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_on_mirrored.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_off_disabled.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/radio_unchecked.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/picker_shape_rectangle_wheel.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/slider_grabber.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/radio_unchecked_disabled.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/graph_port.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/grid_layout.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/text_edit_tab.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/zoom_more.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/hsplitter.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/default_theme_icons_builders.py
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/tabs_drop_mark.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/option_button_arrow.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/file.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/line_edit_clear.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/arrow_right.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/indeterminate.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/error_icon.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/close.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_off_disabled_mirrored.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/grid_minimap.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/color_picker_overbright.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/zoom_reset.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_off_mirrored.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/color_picker_pipette.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/slider_grabber_disabled.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/popup_menu_arrow_right.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/updown.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/popup_menu_arrow_left.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/folder_up.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/resizer_nw.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/checked_disabled.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/zoom_less.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/text_edit_space.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/resizer_se.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/tabs_menu_hl.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/text_edit_ellipsis.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/picker_shape_circle.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/visibility_visible.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/unchecked.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/default_theme_builders.py
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/scroll_button_right.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/unchecked_disabled.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/SCsub
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/picker_shape_rectangle.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/folder.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/scroll_button_right_hl.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/color_picker_cursor.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/vsplitter.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/reload.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/breakpoint.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_on.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/close_hl.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/slider_grabber_hl.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_off.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/radio_checked_disabled.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/bookmark.svg
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/toggle_on_disabled.svg
	)
add_library(godot-scene-resources STATIC ${RESOURCES_SCENE_SOURCE})
target_link_libraries(godot-scene-resources PUBLIC godot-templates godot-io godot-variant godot-scene-main)

list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-resources)

####################################
#Theme
####################################
set(THEME_SCENE_SOURCE_DIR ${GODOT_SOURCE_ROOT_SCENE_DIR}/theme)
set(THEME_SCENE_SOURCE
	${THEME_SCENE_SOURCE_DIR}/theme_db.cpp
	${THEME_SCENE_SOURCE_DIR}/theme_db.h
	${THEME_SCENE_SOURCE_DIR}/theme_owner.cpp
	${THEME_SCENE_SOURCE_DIR}/theme_owner.h
	#Default Theme
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/default_theme.h
	${RESOURCES_SCENE_SOURCE_DIR}/default_theme/default_theme.cpp
	)
add_library(godot-scene-theme STATIC ${THEME_SCENE_SOURCE})
target_link_libraries(godot-scene-theme PUBLIC godot-object)
target_include_directories(godot-scene-theme PRIVATE ${GODOT_FAKEGEN_ROOT_DIR}/scene/resources)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene-theme)

####################################
#Scene
####################################
set(SCENE_SOURCE
	${GODOT_SOURCE_ROOT_SCENE_DIR}/property_utils.h
	${GODOT_SOURCE_ROOT_SCENE_DIR}/register_scene_types.h
	${GODOT_SOURCE_ROOT_SCENE_DIR}/scene_string_names.h
	${GODOT_SOURCE_ROOT_SCENE_DIR}/property_utils.cpp
	${GODOT_SOURCE_ROOT_SCENE_DIR}/register_scene_types.cpp
	${GODOT_SOURCE_ROOT_SCENE_DIR}/scene_string_names.cpp
	)
add_library(godot-scene STATIC ${SCENE_SOURCE})
target_link_libraries(godot-scene PUBLIC godot-string godot-config godot-scene-resources godot-scene-audio)
list(APPEND GODOT_SCENE_LIBRARIES_INTERNAL godot-scene)

set(GODOT_SCENE_LIBRARIES ${GODOT_SCENE_LIBRARIES_INTERNAL} PARENT_SCOPE)