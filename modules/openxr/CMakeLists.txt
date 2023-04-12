set(GODOT_MODULE_OPENXR_DIR ${GODOT_MODULES_BASE_DIR}/openxr)
set(GODOT_MODULE_OPENXR_SOURCE
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_action_set.cpp
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_action.cpp
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_interaction_profile.h
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_action_set.h
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_interaction_profile.cpp
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_interaction_profile_meta_data.cpp
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_action.h
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_interaction_profile_meta_data.h
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_action_map.h
	${GODOT_MODULE_OPENXR_DIR}/action_map/openxr_action_map.cpp
	# ${GODOT_MODULE_OPENXR_DIR}/doc_classes/OpenXRInteractionProfile.xml
	# ${GODOT_MODULE_OPENXR_DIR}/doc_classes/OpenXRHand.xml
	# ${GODOT_MODULE_OPENXR_DIR}/doc_classes/OpenXRInterface.xml
	# ${GODOT_MODULE_OPENXR_DIR}/doc_classes/OpenXRAction.xml
	# ${GODOT_MODULE_OPENXR_DIR}/doc_classes/OpenXRIPBinding.xml
	# ${GODOT_MODULE_OPENXR_DIR}/doc_classes/OpenXRActionSet.xml
	# ${GODOT_MODULE_OPENXR_DIR}/doc_classes/OpenXRActionMap.xml
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_action_map_editor.h
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_select_action_dialog.cpp
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_action_editor.cpp
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_interaction_profile_editor.cpp
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_select_action_dialog.h
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_select_interaction_profile_dialog.h
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_action_set_editor.cpp
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_editor_plugin.cpp
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_select_interaction_profile_dialog.cpp
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_action_editor.h
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_interaction_profile_editor.h
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_editor_plugin.h
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_action_set_editor.h
	${GODOT_MODULE_OPENXR_DIR}/editor/openxr_action_map_editor.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_ml2_controller_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_htc_vive_tracker_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_vulkan_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_composition_layer_depth_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_opengl_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_pico_controller_extension.cpp
	#${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_android_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_composition_layer_provider.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_wmr_controller_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_huawei_controller_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_composition_layer_depth_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_fb_display_refresh_rate_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_palm_pose_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_extension_wrapper.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_android_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_wmr_controller_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_htc_controller_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_pico_controller_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_hand_tracking_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_palm_pose_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_htc_vive_tracker_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_fb_passthrough_extension_wrapper.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_fb_display_refresh_rate_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_ml2_controller_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_htc_controller_extension.cpp
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_fb_passthrough_extension_wrapper.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_huawei_controller_extension.h
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_hand_tracking_extension.h
	${GODOT_MODULE_OPENXR_DIR}/openxr_api.cpp
	${GODOT_MODULE_OPENXR_DIR}/openxr_api.h
	${GODOT_MODULE_OPENXR_DIR}/openxr_interface.cpp
	${GODOT_MODULE_OPENXR_DIR}/openxr_interface.h
	${GODOT_MODULE_OPENXR_DIR}/openxr_util.cpp
	${GODOT_MODULE_OPENXR_DIR}/openxr_util.h
	${GODOT_MODULE_OPENXR_DIR}/register_types.cpp
	${GODOT_MODULE_OPENXR_DIR}/register_types.h
	${GODOT_MODULE_OPENXR_DIR}/scene/openxr_hand.h
	${GODOT_MODULE_OPENXR_DIR}/scene/openxr_hand.cpp
	${GODOT_MODULE_OPENXR_DIR}/util.h
	)
if(${WANT_OPENGL} AND ${OPENGL_FOUND})
	set(GODOT_MODULE_OPENXR_SOURCE ${GODOT_MODULE_OPENXR_SOURCE} ${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_opengl_extension.cpp)
endif()
if(${WANT_VULKAN} AND ${VULKAN_FOUND})
	set(GODOT_MODULE_OPENXR_SOURCE ${GODOT_MODULE_OPENXR_SOURCE} ${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_vulkan_extension.cpp)
endif()

godot_add_library(godot-module-openxr modules STATIC ${GODOT_MODULE_OPENXR_SOURCE})
target_link_libraries(godot-module-openxr PUBLIC godot-object godot-core openxr godot-server-renderer zlib)
set_property(TARGET godot-module-openxr PROPERTY CXX_STANDARD 17)
if(${WANT_OPENGL} AND ${OPENGL_FOUND})
	target_link_libraries(godot-module-openxr PUBLIC driver-gles3)
endif()
if(${WANT_VULKAN} AND ${VULKAN_FOUND})
	target_link_libraries(godot-module-openxr PUBLIC driver-vulkan)
endif()

if(${WANT_X11})
	target_compile_definitions(godot-module-openxr PUBLIC XR_USE_PLATFORM_XLIB=1)
endif()
