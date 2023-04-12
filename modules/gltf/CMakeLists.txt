set(GODOT_MODULE_GLTF_DIR ${GODOT_MODULES_BASE_DIR}/gltf)
set(GODOT_MODULE_GLTF_SOURCE
	${GODOT_MODULE_GLTF_DIR}/editor/editor_import_blend_runner.h
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_exporter_gltf_plugin.h
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_importer_gltf.cpp
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_exporter_gltf_plugin.cpp
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_importer_fbx.h
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_importer_blend.h
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_importer_fbx.cpp
	${GODOT_MODULE_GLTF_DIR}/editor/editor_import_blend_runner.cpp
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_importer_gltf.h
	${GODOT_MODULE_GLTF_DIR}/editor/editor_scene_importer_blend.cpp
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_document_extension.h
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_light.cpp
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_spec_gloss.cpp
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_light.h
	${GODOT_MODULE_GLTF_DIR}/extensions/SCsub
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_document_extension.cpp
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_document_extension_convert_importer_mesh.cpp
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_document_extension_convert_importer_mesh.h
	${GODOT_MODULE_GLTF_DIR}/extensions/gltf_spec_gloss.h
	${GODOT_MODULE_GLTF_DIR}/gltf_defines.h
	${GODOT_MODULE_GLTF_DIR}/gltf_document.cpp
	${GODOT_MODULE_GLTF_DIR}/gltf_document.h
	${GODOT_MODULE_GLTF_DIR}/gltf_state.cpp
	${GODOT_MODULE_GLTF_DIR}/gltf_state.h
	${GODOT_MODULE_GLTF_DIR}/gltf_template_convert.h
	${GODOT_MODULE_GLTF_DIR}/register_types.cpp
	${GODOT_MODULE_GLTF_DIR}/register_types.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_animation.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_buffer_view.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_node.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_accessor.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_skeleton.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_camera.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_texture_sampler.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_texture.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_skin.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_camera.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_skin.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_buffer_view.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_mesh.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_node.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_mesh.cpp
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_texture_sampler.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_texture.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_accessor.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_skeleton.h
	${GODOT_MODULE_GLTF_DIR}/structures/gltf_animation.cpp
	)

godot_add_library(godot-module-gltf modules STATIC ${GODOT_MODULE_GLTF_SOURCE})
target_link_libraries(godot-module-gltf PUBLIC godot-object minizip)
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	target_link_libraries(godot-module-gltf PRIVATE shlwapi)
endif()
