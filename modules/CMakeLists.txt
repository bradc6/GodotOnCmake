#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_SOURCE_ROOT_THIRDPARTY_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/thirdparty)
set(GODOT_MODULES_BASE_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/modules)
set(GODOT_FAKEGEN_ROOT_DIR ${CMAKE_CURRENT_LIST_DIR}/../../FakeGen)

#This variable holds all the targets of this subdirectory
set(GODOT_MODULES_LIBRARIES_INTERNAL)

####################################
#godot-module-astcenc
####################################
set(GODOT_MODULE_ASTCENC_DIR ${GODOT_MODULES_BASE_DIR}/astcenc)
set(GODOT_MODULE_ASTCENC_SOURCE
	${GODOT_MODULE_ASTCENC_DIR}/image_compress_astcenc.cpp
	${GODOT_MODULE_ASTCENC_DIR}/image_compress_astcenc.h
	${GODOT_MODULE_ASTCENC_DIR}/register_types.cpp
	${GODOT_MODULE_ASTCENC_DIR}/register_types.h
	)
add_library(godot-module-astcenc STATIC ${GODOT_MODULE_ASTCENC_SOURCE})
target_link_libraries(godot-module-astcenc PUBLIC godot-io astcenc)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-astcenc)

####################################
#godot-module-basis_universal
####################################
set(GODOT_MODULE_BASIS_UNIVERSAL_DIR ${GODOT_MODULES_BASE_DIR}/basis_universal)
set(GODOT_MODULE_BASIS_UNIVERSAL_SOURCE
	${GODOT_MODULE_BASIS_UNIVERSAL_DIR}/register_types.cpp
	${GODOT_MODULE_BASIS_UNIVERSAL_DIR}/register_types.h
	)
add_library(godot-module-basis-universal STATIC ${GODOT_MODULE_BASIS_UNIVERSAL_SOURCE})
target_link_libraries(godot-module-basis-universal PUBLIC godot-object basis_universal)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-basis-universal)

####################################
#godot-module-bmp
####################################
set(GODOT_MODULE_BMP_DIR ${GODOT_MODULES_BASE_DIR}/bmp)
set(GODOT_MODULE_BMP_SOURCE
	${GODOT_MODULE_BMP_DIR}/image_loader_bmp.cpp
	${GODOT_MODULE_BMP_DIR}/image_loader_bmp.h
	${GODOT_MODULE_BMP_DIR}/register_types.cpp
	${GODOT_MODULE_BMP_DIR}/register_types.h
	)
add_library(godot-module-bmp STATIC ${GODOT_MODULE_BMP_SOURCE})
target_link_libraries(godot-module-bmp PUBLIC godot-io)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-bmp)

####################################
#godot-module-camera
####################################
set(GODOT_MODULE_CAMERA_DIR ${GODOT_MODULES_BASE_DIR}/camera)
set(GODOT_MODULE_CAMERA_SOURCE
	#${GODOT_MODULE_CAMERA_DIR}/camera_macos.h
	#${GODOT_MODULE_CAMERA_DIR}/camera_macos.mm
	${GODOT_MODULE_CAMERA_DIR}/camera_win.cpp
	${GODOT_MODULE_CAMERA_DIR}/camera_win.h
	${GODOT_MODULE_CAMERA_DIR}/register_types.cpp
	${GODOT_MODULE_CAMERA_DIR}/register_types.h
	)

add_library(godot-module-camera STATIC ${GODOT_MODULE_CAMERA_SOURCE})
target_link_libraries(godot-module-camera PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-camera)

####################################
#godot-module-csg
####################################
set(GODOT_MODULE_CSG_DIR ${GODOT_MODULES_BASE_DIR}/csg)
set(GODOT_MODULE_CSG_SOURCE
	${GODOT_MODULE_CSG_DIR}/csg.cpp
	${GODOT_MODULE_CSG_DIR}/csg.h
	${GODOT_MODULE_CSG_DIR}/csg_shape.cpp
	${GODOT_MODULE_CSG_DIR}/csg_shape.h
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGPolygon3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGPrimitive3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGSphere3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGCombiner3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGBox3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGTorus3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGShape3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGMesh3D.xml
	# ${GODOT_MODULE_CSG_DIR}/doc_classes/CSGCylinder3D.xml
	${GODOT_MODULE_CSG_DIR}/editor/csg_gizmos.cpp
	${GODOT_MODULE_CSG_DIR}/editor/csg_gizmos.h
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGCylinder3D.svg
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGTorus3D.svg
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGPolygon3D.svg
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGCombiner3D.svg
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGBox3D.svg
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGMesh3D.svg
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGSphere3D.svg
	# ${GODOT_MODULE_CSG_DIR}/icons/CSGCapsule3D.svg
	${GODOT_MODULE_CSG_DIR}/register_types.cpp
	${GODOT_MODULE_CSG_DIR}/register_types.h
	)

add_library(godot-module-csg STATIC ${GODOT_MODULE_CSG_SOURCE})
target_link_libraries(godot-module-csg PUBLIC godot-math godot-thirdparty-misc)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-csg)

####################################
#godot-module-cvtt
####################################
set(GODOT_MODULE_CVTT_DIR ${GODOT_MODULES_BASE_DIR}/cvtt)
set(GODOT_MODULE_CVTT_SOURCE
	${GODOT_MODULE_CVTT_DIR}/image_compress_cvtt.cpp
	${GODOT_MODULE_CVTT_DIR}/image_compress_cvtt.h
	${GODOT_MODULE_CVTT_DIR}/register_types.cpp
	${GODOT_MODULE_CVTT_DIR}/register_types.h
	)

add_library(godot-module-cvtt STATIC ${GODOT_MODULE_CVTT_SOURCE})
target_link_libraries(godot-module-cvtt PUBLIC godot-io cvtt)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-cvtt)

####################################
#godot-module-dds
####################################
set(GODOT_MODULE_DDS_DIR ${GODOT_MODULES_BASE_DIR}/dds)
set(GODOT_MODULE_DDS_SOURCE
	${GODOT_MODULE_DDS_DIR}/register_types.cpp
	${GODOT_MODULE_DDS_DIR}/register_types.h
	${GODOT_MODULE_DDS_DIR}/texture_loader_dds.cpp
	${GODOT_MODULE_DDS_DIR}/texture_loader_dds.h
	)
add_library(godot-module-dds STATIC ${GODOT_MODULE_DDS_SOURCE})
target_link_libraries(godot-module-dds PUBLIC godot-io)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-dds)

####################################
#godot-module-denoise
####################################
set(GODOT_MODULE_DENOISE_DIR ${GODOT_MODULES_BASE_DIR}/denoise)
set(GODOT_MODULE_DENOISE_SOURCE
	${GODOT_MODULE_DENOISE_DIR}/denoise_wrapper.cpp
	${GODOT_MODULE_DENOISE_DIR}/denoise_wrapper.h
	${GODOT_MODULE_DENOISE_DIR}/lightmap_denoiser.cpp
	${GODOT_MODULE_DENOISE_DIR}/lightmap_denoiser.h
	${GODOT_MODULE_DENOISE_DIR}/register_types.cpp
	${GODOT_MODULE_DENOISE_DIR}/register_types.h
	)
add_library(godot-module-denoise STATIC ${GODOT_MODULE_DENOISE_SOURCE})
target_link_libraries(godot-module-denoise PUBLIC godot-object oidn)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-denoise)

####################################
#godot-module-enet
####################################
set(GODOT_MODULE_ENET_DIR ${GODOT_MODULES_BASE_DIR}/enet)
set(GODOT_MODULE_ENET_SOURCE
	${GODOT_MODULE_ENET_DIR}/enet_connection.cpp
	${GODOT_MODULE_ENET_DIR}/enet_connection.h
	${GODOT_MODULE_ENET_DIR}/enet_multiplayer_peer.cpp
	${GODOT_MODULE_ENET_DIR}/enet_multiplayer_peer.h
	${GODOT_MODULE_ENET_DIR}/enet_packet_peer.cpp
	${GODOT_MODULE_ENET_DIR}/enet_packet_peer.h
	${GODOT_MODULE_ENET_DIR}/register_types.cpp
	${GODOT_MODULE_ENET_DIR}/register_types.h
	${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/enet/godot.cpp
	)
add_library(godot-module-enet STATIC ${GODOT_MODULE_ENET_SOURCE})
target_link_libraries(godot-module-enet PUBLIC godot-object godot-io godot-crypto enet)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-enet)

####################################
#godot-module-etcpak
####################################
set(GODOT_MODULE_ETCPAK_DIR ${GODOT_MODULES_BASE_DIR}/etcpak)
set(GODOT_MODULE_ETCPAK_SOURCE
	${GODOT_MODULE_ETCPAK_DIR}/image_compress_etcpak.cpp
	${GODOT_MODULE_ETCPAK_DIR}/image_compress_etcpak.h
	${GODOT_MODULE_ETCPAK_DIR}/register_types.cpp
	${GODOT_MODULE_ETCPAK_DIR}/register_types.h
	)
add_library(godot-module-etcpak STATIC ${GODOT_MODULE_ETCPAK_SOURCE})
target_link_libraries(godot-module-etcpak PUBLIC godot-io etcpak)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-etcpak)

####################################
#godot-module-freetype
####################################
set(GODOT_MODULE_FREETYPE_DIR ${GODOT_MODULES_BASE_DIR}/freetype)
set(GODOT_MODULE_FREETYPE_SOURCE
	${GODOT_MODULE_FREETYPE_DIR}/register_types.cpp
	${GODOT_MODULE_FREETYPE_DIR}/register_types.h
	${GODOT_MODULE_FREETYPE_DIR}/uwpdef.h
	)
add_library(godot-module-freetype STATIC ${GODOT_MODULE_FREETYPE_SOURCE})
target_link_libraries(godot-module-freetype PUBLIC godot-object freetype)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-freetype)

####################################
#godot-module-gdscript
####################################
set(GODOT_MODULE_GDSCRIPT_DIR ${GODOT_MODULES_BASE_DIR}/gdscript)
set(GODOT_MODULE_GDSCRIPT_SOURCE
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/gdscript_translation_parser_plugin.h
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/gdscript_translation_parser_plugin.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/gdscript_highlighter.h
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/gdscript_highlighter.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_analyzer.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_analyzer.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_byte_codegen.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_byte_codegen.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_cache.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_cache.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_codegen.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_compiler.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_compiler.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_disassembler.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_editor.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_function.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_function.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_lambda_callable.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_lambda_callable.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_parser.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_parser.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_rpc_callable.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_rpc_callable.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_tokenizer.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_tokenizer.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_utility_functions.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_utility_functions.h
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_vm.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_warning.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/gdscript_warning.h
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_language_protocol.h
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_workspace.h
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_extend_parser.h
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_language_server.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_extend_parser.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_text_document.h
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_workspace.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_language_protocol.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/godot_lsp.h
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_text_document.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/language_server/gdscript_language_server.h
	${GODOT_MODULE_GDSCRIPT_DIR}/register_types.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/register_types.h
	)

add_library(godot-module-gdscript STATIC ${GODOT_MODULE_GDSCRIPT_SOURCE})
target_link_libraries(godot-module-gdscript PUBLIC godot-object)
target_include_directories(godot-module-gdscript PRIVATE ${GODOT_FAKEGEN_ROOT_DIR})
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-gdscript)

set(GODOT_MODULE_GDSCRIPT_RESOURCES
	# ${GODOT_MODULE_GDSCRIPT_DIR}/doc_classes/GDScript.xml
	# ${GODOT_MODULE_GDSCRIPT_DIR}/doc_classes/@GDScript.xml
	${GODOT_MODULE_GDSCRIPT_DIR}/icons/GDScript.svg
	${GODOT_MODULE_GDSCRIPT_DIR}/icons/GDScriptInternal.svg
	)

set(GODOT_MODULE_GDSCRIPT_TESTS
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/gdscript_test_runner.h
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/test_gdscript.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/gdscript_test_runner_suite.h
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/README.md
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/test_gdscript.h
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/gdscript_test_runner.cpp
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/lambda_shadowing_arg.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/overriding_native_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/onready_with_export.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/cast_enum_bad_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/get_node_without_onready.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/onready_with_export.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/lambda_unused_arg.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/cast_enum_bad_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/inference_with_variant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/get_node_without_onready.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/cast_enum_bad_int.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/lambda_shadowing_arg.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/cast_enum_bad_int.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/overriding_native_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/inference_with_variant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/warnings/lambda_unused_arg.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_function_typecheck.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_cyclic_reference_a.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_script_native_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/gdscript_to_preload.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_native_access_types.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/property_functions.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_with_custom_class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/assignments_with_untyped.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/array_string_stringname_equivalent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_inferred_access_isnt_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_unnamed_depend.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/ternary_hard_infer.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/annotation_constant_expression_parameters.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/null_initializer.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_enum_to_int_typed_var.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/subscript_self.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/for_loop_on_variant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/base_outer_resolution_base.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_is_treated_as_int.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/lookup_class_external.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/await_type_inference.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/assymetric_assignment_good.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/allow_get_node_with_onready.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/return_variant_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/vararg_call.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/assymetric_assignment_good.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_typecheck_inner_class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/lambda_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/call_static_builtin_function.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_enum_as_constant_external.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_duplicate_into_dict.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/auto_inferred_type_dont_error.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_other_enum_cast_to_same_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/call_static_builtin_function.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/call_self_get_name.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/class_from_parent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/assign_to_native_enum_property.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/use_preload_script_as_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/lookup_signal.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_inner_class_as_constant_external.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/use_preload_script_as_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/function_match_parent_signature_with_extra_parameters.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_named_no_shadow.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/class_from_parent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/lookup_class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/assign_to_native_enum_property.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_from_outer.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_unnamed_depend.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/warning_ignore_annotation.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/base_outer_resolution_a.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/call_self_get_name.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/cast_non_null.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_enum_as_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_other_enum_cast_to_same_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/inferred_return_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_type_is_treated_as_dictionary.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_same_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/onready_on_inner_class_with_non_node_outer.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/await_with_signals_no_warning.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/base_outer_resolution.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/warning_ignore_annotation.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_int_cast_to_same_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_constant_types_are_inferred.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/onready_on_inner_class_with_non_node_outer.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/local_inference_is_weak.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/property_inline.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_from_base.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/weak_initializer.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/lookup_signal.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/default_arg_convertable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_access_types.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_same_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/await_with_signals_no_warning.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/extend_abstract_class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_as_default_parameter.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/base_outer_resolution_extend.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/for_loop_on_variant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_script_native_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/class_inference_is_weak.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/as.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/array_string_stringname_equivalent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_as_const.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/out_of_order.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/inner_base.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/constants_from_parent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/property_functions.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/inner_class_as_return_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/const_conversions.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/variant_arg_in_virtual_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/return_conversions.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/lookup_class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/class_inference_is_weak.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_cyclic_reference.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/return_conversions.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_inner_base.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_usage.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_named_no_shadow.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/out_of_order_external.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_inner_class_as_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/out_of_order.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/null_initializer.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/function_match_parent_signature_with_default_dict_void.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_enum_as_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_int_cast_to_same_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_with_custom_class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_typecheck_inner_class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_as_default_parameter.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_inner_base.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_script_native_type.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/return_variant_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/inner_class_as_return_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/await_type_inference.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_function_typecheck.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_from_base.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/out_of_order_external.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/hard_variants.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_type_is_treated_as_dictionary.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/static_method_builtin_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/const_conversions.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/constants_from_parent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_value_from_parent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_access_types.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/weak_initializer.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/variant_arg_in_virtual_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/extend_abstract_class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/function_match_parent_signature_with_extra_parameters.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_cyclic_reference_b.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/inner_base.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/allow_void_function_to_return_void.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/base_outer_resolution_b.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/external_inner_class_as_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_native_access_types.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_is_treated_as_int.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/allow_void_function_to_return_void.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_constant_types_are_inferred.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/vararg_call.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_from_outer.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/ternary_hard_infer.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_duplicate_into_dict.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/function_match_parent_signature_with_default_dict_void.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/auto_inferred_type_dont_error.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/subscript_self.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/static_method_builtin_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/annotation_constant_expression_parameters.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/base_outer_resolution.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/inferred_return_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/property_inline.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/lambda_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_inferred_access_isnt_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/as.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/local_inference_is_weak.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/assignments_with_untyped.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/out_of_order_external_a.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/allow_get_node_with_onready.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/default_arg_convertable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/hard_variants.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/typed_array_usage.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/preload_cyclic_reference.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_as_const.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_value_from_parent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/base_outer_resolution_c.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/enum_assign_enum_to_int_typed_var.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/features/cast_non_null.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_to_read_only_property.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_float_value.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_native_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_const.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_class_var_assign_with_wrong_enum_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_literal_bool.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_duplicate_key_lua.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_builtin_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/onready_within_non_node.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/get_node_shorthand_within_non_node.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_int.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_dictionary_index_assign.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_function_get_type_error.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/bitwise_float_left_operand.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/annotation_non_constant_parameter.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_native_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/missing_argument.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/inferring_with_weak_type_member_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/preload_enum_error.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_local_var_assign_with_wrong_enum_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_string.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_float.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_to_read_only_property_indirectly.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_dictionary_index_assign.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_return_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_var.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/inferring_with_weak_type_local_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_local_var_assign_with_wrong_enum_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/redefine_local_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_function_parameter_wrong_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/class_name_shadows_builtin_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/redefine_local_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_shadows_base_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/bitwise_float_left_operand.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_assign_differently_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_count_less.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_instance_constants.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_concatenation_dictionary.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_named_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_constant_int.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/incompatible_assignment.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_string_stringname_equivalent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assymetric_assignment_bad.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_func.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_string_value.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_assignment.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_native_bad_value.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_local_var_init_with_wrong_enum_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/abstract_class_instantiate.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/ternary_weak_infer.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_used_as_function.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_concatenation_mixed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/class_name_shadows_builtin_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_used_as_property.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_inline_get_type_error.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_constant_float.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_array_index_assign.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_concatenation_bool.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_constants_as_variant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_count_more.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_duplicate_bad_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/abstract_class_instantiate.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_instance_constants.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/bitwise_float_right_operand.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_lookup.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_inline_set_type_error.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/lambda_wrong_return.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/onready_within_non_node_inner_class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_constant_int.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/overload_script_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/native_type_errors.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_literal_bool.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assymetric_assignment_bad.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/onready_within_non_node.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/super_nonexistent_base_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/annotation_non_constant_parameter.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_local_var_assign_outer_with_wrong_enum_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_function_get_type_error.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_external.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_enum_value.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constructor_call_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_custom_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/lambda_no_return.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_pass_differently_to_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_init_with_unconvertable_in_literal.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_custom_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_instance_constants_as_variant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_return_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_constant_float.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_default_values.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_string_value.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_subscript_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/onready_within_non_node_inner_class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_class_var_init_with_wrong_enum_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_float.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_instance_constants_as_variant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/params_default_forward_reference.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_duplicate_key_python.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_to_read_only_property.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_int.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_array_index.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_init_with_unconvertable_in_literal.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_shadows_base_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/get_node_shorthand_within_non_node.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/native_type_errors.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/redefine_class_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_class_var_assign_with_wrong_enum_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_func.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_function_return_wrong_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/return_null_in_void_func.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_native_bad_value.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_duplicate_key_lua.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/redefine_class_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_iterator.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_gd_utility.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/super_nonexistent_base_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/await_signal_no_infer.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_used_as_property.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_override.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/inferring_with_weak_type_parameter.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/preload_enum_error.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_inheritance.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_bad_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_duplicate_bad_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/ternary_weak_infer.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/return_variant_in_void_func.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/leading_number_separator.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/await_signal_no_infer.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/abstract_script_instantiate.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_signal.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_assignment.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_string_stringname_equivalent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_bad_value.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_duplicate_key_python.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_count_less.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_named_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_name_shadows_builtin_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_const.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_external_a.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_function_set_type_error.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_concatenation_dictionary.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_enum_value.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_function_set_type_error.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_external.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_duplicate_key_lua_with_string.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_name_shadows_builtin_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_used_as_function.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_bad_method.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_default_values.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_concatenation_bool.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_literal_int.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_class_var_init_with_wrong_enum_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/dictionary_duplicate_key_lua_with_string.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_var.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/lambda_no_return.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/overload_script_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_unnamed_assign_to_named.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/variable_overloads_superclass_function.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/match_with_subscript.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_concatenation_mixed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/variable_name_shadows_builtin_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/match_with_subscript.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_bad_value.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/setter_parameter_uses_property_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/incompatible_assignment.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_iterator.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_subscript_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_inheritance.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_local_var_init_with_wrong_enum_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/bitwise_float_right_operand.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_used_as_function.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_gd_utility.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_preload_unnamed_assign_to_named.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/inferring_with_weak_type_member_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/variable_overloads_superclass_function.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/match_with_variable_expression.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/function_dont_match_parent_signature_parameter_count_more.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_hard_string.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_utility.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/match_with_variable_expression.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_pass_differently_to_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_inline_set_type_error.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_constants.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/typed_array_assign_differently_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/params_default_forward_reference.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/variable_name_shadows_builtin_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_local_var_assign_outer_with_wrong_enum_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/abstract_script_instantiate.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_signal.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_preload_unnamed_assign_to_named.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/lambda_wrong_return.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constructor_call_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_enum_value.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_override.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/return_null_in_void_func.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/inferring_with_weak_type_local_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/missing_argument.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_unnamed_assign_to_named.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/invalid_array_index.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/leading_number_separator.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/property_inline_get_type_error.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_lookup.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_function_parameter_wrong_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_constants.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/setter_parameter_uses_property_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_name_shadows_builtin_type.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_used_as_function.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_name_shadows_builtin_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/cyclic_ref_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_builtin_method.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/return_variant_in_void_func.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_enum_value.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/constant_array_index_assign.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/use_value_of_void_function_utility.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/for_loop_on_literal_int.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/inferring_with_weak_type_parameter.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/assign_to_read_only_property_indirectly.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_float_value.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/outer_class_constants_as_variant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/analyzer/errors/enum_function_return_wrong_type.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/project.godot
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_variable_class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unassigned_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/return_value_discarded.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/assert_always_true.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unassigned_variable_op_assign.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/enum_assign_int_without_casting.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unused_argument.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unassigned_variable_op_assign.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/confusable_identifier.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/narrowing_conversion.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unreachable_code_after_return.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_variable_function.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/standalone_expression.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/enum_assign_int_without_casting.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unreachable_code_after_return_bug_55154.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/deprecated_operators.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_global_identifier.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/incompatible_ternary.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/integer_division.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_variable_class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/match_default_not_at_end.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file_newline_comment.notest.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unreachable_code_after_return_bug_55154.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/narrowing_conversion.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file_comment.notest.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unreachable_code_after_return.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unused_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file.notest.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/assert_always_true.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unused_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file_newline.notest.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file_newline.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/static_called_on_instance.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/match_default_not_at_end.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/incompatible_ternary.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/confusable_identifier.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file_comment.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/standalone_expression.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unused_argument.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/integer_division.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_variable_function.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file_newline_comment.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/deprecated_operators.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/unassigned_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/return_value_discarded.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/empty_file.notest.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/shadowed_global_identifier.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/warnings/static_called_on_instance.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/export_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/number_separators.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/variable_declaration.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/if_after_lambda.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_parentheses.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_multiple_variable_binds_in_pattern.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/semicolon_as_end_statement.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class_inheritance.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/in.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class_inheritance_access.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/super.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/trailing_comma_in_function_args.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_named_callable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_function_calls.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_multiple_patterns_with_array.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dictionary.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/function_default_parameter_type_inference.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_default_parameter_capture.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/export_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/for_range.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/vector_inf.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dollar_and_percent_get_node.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dictionary.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_arithmetic.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_capture_callable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/basic_expression_matching.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/export_enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/float_notation.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/str_preserves_case.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_named_callable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/bitwise_operators.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/float_notation.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/variable_declaration.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/function_many_parameters.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/space_indentation.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_callable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_dictionary.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/semicolon_as_terminator.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_array.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_bind_unused.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_multiple_variable_binds_in_pattern.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_assert.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/concatenation.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/array.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_dictionary.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_match.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dictionary_mixed_syntax.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dollar_node_paths.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dictionary_mixed_syntax.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/arrays_dictionaries_nested_const.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/super.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/for_range.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_function_calls.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/export_enum.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/constants.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/number_separators.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/string_formatting.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/str_preserves_case.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dictionary_lua_style.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/signal_declaration.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_match.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/semicolon_as_terminator.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class_name.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/typed_arrays.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/unnamed_enums_outer_conflicts.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dollar_and_percent_get_node.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/advanced_expression_matching.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_dictionary.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/concatenation.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_with_variables.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/space_indentation.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class_inheritance_access.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/single_line_declaration.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/property_setter_getter.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/bitwise_operators.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/static_typing.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_vector.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_strings.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_arrays.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_default_parameter_capture.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dollar_node_paths.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/if_after_lambda.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/in.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_arrays.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_if.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/trailing_comma_in_function_args.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/array.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/function_default_parameter_type_inference.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_if.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/typed_arrays.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_multiple_patterns_with_array.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_dictionary.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_dictionaries.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/signal_declaration.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/truthiness.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_if.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/operator_assign.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/arrays_dictionaries_nested_const.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/semicolon_as_end_statement.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_dictionaries.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/basic_expression_matching.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_callable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/dictionary_lua_style.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/enum.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_bind_unused.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/truthiness.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/operator_assign.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match_with_variables.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/static_typing.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/while.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/unicode_identifiers.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/vector_inf.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/unnamed_enums_outer_conflicts.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class_name.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_if.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/single_line_declaration.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_vector.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/while.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/property_setter_getter.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/unicode_identifiers.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_arithmetic.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_array.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_assert.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/class_inheritance.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/constants.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/multiline_strings.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/function_many_parameters.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/match.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/nested_parentheses.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/lambda_capture_callable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/string_formatting.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/features/advanced_expression_matching.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/yield_instead_of_await.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/lambda_standalone.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/wrong_value_after_dollar.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/nothing_after_dollar.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/multiple_number_separators.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_colon.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/boolean_negation_without_argument_using_bang.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_3_equal_signs.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_identifier_string.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_escape_sequence.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/identifier_similar_to_keyword.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/mixing_tabs_spaces.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/function_conflicts_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_in_var_if.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/class_name_after_annotation.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/vcs_conflict_marker.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_for_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/constant_conflicts_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_closing_expr_paren.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_2_equal_signs.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/function_conflicts_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/double_dictionary_comma.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/binary_complement_without_argument.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/dollar-assignment-bug-53696.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/wrong_value_after_dollar.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/match_multiple_variable_binds_in_branch.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/subscript_without_index.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/function_conflicts_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_colon.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/mistaken_decrement_operator.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_closing_expr_paren.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/identifier_similar_to_keyword.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_constant.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/multiple_number_separators.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_function.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/array_consecutive_commas.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_constant.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/boolean_negation_without_argument_using_bang.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_3_equal_signs.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/redefine_local_constant_with_keyword.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/mistaken_decrement_operator.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/wrong_value_after_dollar_slash.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/array_consecutive_commas.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_without_identifier.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/yield_instead_of_await.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/binary_complement_without_argument.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/vcs_conflict_marker.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/double_dictionary_comma.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/nothing_after_dollar.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_ternary_operator.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_ternary_operator.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/mistaken_increment_operator.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_paren_after_args.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_empty_assignee.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_expression_after_ternary_else.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/function_conflicts_variable.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_in_var.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/mixing_tabs_spaces.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_in_var.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/wrong_value_after_dollar_slash.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_paren_after_args.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/lambda_standalone.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/boolean_negation_without_argument.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/dollar-assignment-bug-53696.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/missing_expression_after_ternary_else.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/redefine_keyword.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_identifier_string.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/constant_conflicts_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_for_variable.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_identifier_number.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/subscript_without_index.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/default_value_in_function_call.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/default_value_in_function_call.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_escape_sequence.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/boolean_negation_without_argument.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/match_multiple_variable_binds_in_branch.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/redefine_local_constant_with_keyword.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_empty_assignee.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/brace_syntax.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_without_identifier.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_in_var_if.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_in_if.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/brace_syntax.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/class_name_after_annotation.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/variable_conflicts_function.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/redefine_keyword.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_2_equal_signs.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/assignment_in_if.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/mistaken_increment_operator.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/parser/errors/invalid_identifier_number.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/.gitignore
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/assign_to_read_only_property.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/assign_to_read_only_property_with_variable_index.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/range_optimized_in_for_has_int_iterator.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/params_default_values.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/array_string_stringname_equivalent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/match_string_stringname_equivalent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/await_on_void.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/use_conversion_assign_with_variant_value.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/dictionaries_arent_shared.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/property_with_operator_assignment.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/dictionary_string_stringname_equivalent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/lua_assign.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/await_without_coroutine.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/await_without_coroutine.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/range_optimized_in_for_has_int_iterator.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/chain_assignment_works.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-null-equals-builtin.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/standalone-calls-do-not-write-to-nil.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/property_with_operator_assignment.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/lua_assign.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/parameter_shadowing.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/assign_member_with_operation.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/await_on_void.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/lambda_use_self.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/string_stringname_equivalent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/stringify.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-builtin-equals-null.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/assign_member_with_operation.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/match_string_stringname_equivalent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/does_not_override_temp_values.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/gdscript.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/typed_array_init_with_untyped_in_literal.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/range_returns_ints.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-builtin-equals-null.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/conversion_for_default_parameter.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-null-not-equals-builtin.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/dictionary_string_stringname_equivalent.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/for_loop_iterator_types.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/array_string_stringname_equivalent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/constants_are_read_only.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-builtin-not-equals-null.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/constants_are_read_only.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/arrays_arent_shared.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/chain_assignment_works.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-null-equals-builtin.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-null-not-equals-builtin.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/typed_array_init_with_untyped_in_literal.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/params_default_values.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/string_stringname_equivalent.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/range_returns_ints.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/lambda_use_self.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/typed_assignment.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/typed_assignment.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/compare-builtin-not-equals-null.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/for_loop_iterator_types.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/use_conversion_assign_with_variant_value.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/conversion_for_default_parameter.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/standalone-calls-do-not-write-to-nil.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/recursion.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/does_not_override_temp_values.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/arrays_arent_shared.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/dictionaries_arent_shared.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/stringify.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/gdscript.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/parameter_shadowing.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/features/recursion.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/assign_to_read_only_property.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/use_return_value_of_void_builtin_method_call.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/constant_dictionary_is_deep.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/use_return_value_of_free_call.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_assign_differently_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/bad_conversion_for_default_parameter.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/use_return_value_of_free_call.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/use_return_value_of_void_native_method_call.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/constant_dictionary_is_deep.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/bad_conversion_for_default_parameter.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_pass_differently_to_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_pass_basic_to_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/non_static_method_call_on_native_class.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/constant_array_is_deep.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/use_return_value_of_void_native_method_call.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_assign_basic_to_typed.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_assign_basic_to_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_pass_basic_to_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_pass_differently_to_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/use_return_value_of_void_builtin_method_call.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/callable_call_after_free_object.out
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/typed_array_assign_differently_typed.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/constant_array_is_deep.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/non_static_method_call_on_native_class.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/errors/callable_call_after_free_object.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/tests/scripts/runtime/assign_to_read_only_property_with_variable_index.out
	)

set(GODOT_MODULE_GDSCRIPT_EDITOR_TEMPLATES
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/EditorScenePostImport/basic_import_script.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/EditorScenePostImport/no_comments.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/CharacterBody3D/basic_movement.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/VisualShaderNodeCustom/basic.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/CharacterBody2D/basic_movement.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/Node/default.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/EditorPlugin/plugin.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/Object/empty.gd
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/SCsub
	${GODOT_MODULE_GDSCRIPT_DIR}/editor/script_templates/EditorScript/basic_editor_script.gd
	)


####################################
#godot-module-glslang
####################################
set(GODOT_MODULE_GLSLANG_DIR ${GODOT_MODULES_BASE_DIR}/glslang)
set(GODOT_MODULE_GLSLANG_SOURCE
	${GODOT_MODULE_GLSLANG_DIR}/glslang_resource_limits.h
	${GODOT_MODULE_GLSLANG_DIR}/register_types.cpp
	${GODOT_MODULE_GLSLANG_DIR}/register_types.h
	)
add_library(godot-module-glslang STATIC ${GODOT_MODULE_GLSLANG_SOURCE})
target_link_libraries(godot-module-glslang PUBLIC godot-object godot-glslang)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-glslang)


####################################
#godot-module-gltf
####################################
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

add_library(godot-module-gltf STATIC ${GODOT_MODULE_GLTF_SOURCE})
target_link_libraries(godot-module-gltf PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-gltf)

####################################
#godot-module-gridmap
####################################
set(GODOT_MODULE_GRIDMAP_DIR ${GODOT_MODULES_BASE_DIR}/gridmap)
set(GODOT_MODULE_GRIDMAP_SOURCE
	${GODOT_MODULE_GRIDMAP_DIR}/editor/grid_map_editor_plugin.cpp
	${GODOT_MODULE_GRIDMAP_DIR}/editor/grid_map_editor_plugin.h
	${GODOT_MODULE_GRIDMAP_DIR}/grid_map.cpp
	${GODOT_MODULE_GRIDMAP_DIR}/grid_map.h
	#${GODOT_MODULE_GRIDMAP_DIR}/icons/GridMap.svg
	${GODOT_MODULE_GRIDMAP_DIR}/register_types.cpp
	${GODOT_MODULE_GRIDMAP_DIR}/register_types.h
	)
add_library(godot-module-gridmap STATIC ${GODOT_MODULE_GRIDMAP_SOURCE})
target_link_libraries(godot-module-gridmap PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-gridmap)

####################################
#godot-module-hdr
####################################
set(GODOT_MODULE_HDR_DIR ${GODOT_MODULES_BASE_DIR}/hdr)
set(GODOT_MODULE_HDR_SOURCE
	${GODOT_MODULE_HDR_DIR}/image_loader_hdr.cpp
	${GODOT_MODULE_HDR_DIR}/image_loader_hdr.h
	${GODOT_MODULE_HDR_DIR}/register_types.cpp
	${GODOT_MODULE_HDR_DIR}/register_types.h
	)
add_library(godot-module-hdr STATIC ${GODOT_MODULE_HDR_SOURCE})
target_link_libraries(godot-module-hdr PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-hdr)

####################################
#godot-module-jpg
####################################
set(GODOT_MODULE_JPG_DIR ${GODOT_MODULES_BASE_DIR}/jpg)
set(GODOT_MODULE_JPG_SOURCE
	${GODOT_MODULE_JPG_DIR}/image_loader_jpegd.cpp
	${GODOT_MODULE_JPG_DIR}/image_loader_jpegd.h
	${GODOT_MODULE_JPG_DIR}/register_types.cpp
	${GODOT_MODULE_JPG_DIR}/register_types.h
	)
add_library(godot-module-jpg STATIC ${GODOT_MODULE_JPG_SOURCE})
target_link_libraries(godot-module-jpg PUBLIC godot-object jpeg-compressor)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-jpg)

####################################
#godot-module-jsonrpc
####################################
set(GODOT_MODULE_JSON_RPC_DIR ${GODOT_MODULES_BASE_DIR}/jsonrpc)
set(GODOT_MODULE_JSON_RPC_SOURCE
	${GODOT_MODULE_JSON_RPC_DIR}/jsonrpc.cpp
	${GODOT_MODULE_JSON_RPC_DIR}/jsonrpc.h
	${GODOT_MODULE_JSON_RPC_DIR}/register_types.cpp
	${GODOT_MODULE_JSON_RPC_DIR}/register_types.h
	)
add_library(godot-module-jsonrpc STATIC ${GODOT_MODULE_JSON_RPC_SOURCE})
target_link_libraries(godot-module-jsonrpc PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-jsonrpc)

####################################
#godot-module-lightmapper-rd
####################################
set(GODOT_MODULE_LIGHTMAPPER_RD_DIR ${GODOT_MODULES_BASE_DIR}/lightmapper_rd)
set(GODOT_MODULE_LIGHTMAPPER_RD_SOURCE
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/lightmapper_rd.cpp
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/lightmapper_rd.h
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/register_types.cpp
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/register_types.h
	)

set(GODOT_MODULE_LIGHTMAPPER_RD_SHADRERS
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/lm_blendseams.glsl
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/lm_common_inc.glsl
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/lm_compute.glsl
	${GODOT_MODULE_LIGHTMAPPER_RD_DIR}/lm_raster.glsl
	)
add_library(godot-module-lightmapper-rd STATIC ${GODOT_MODULE_LIGHTMAPPER_RD_SOURCE})
target_link_libraries(godot-module-lightmapper-rd PUBLIC godot-object)
target_include_directories(godot-module-lightmapper-rd PRIVATE ${GODOT_FAKEGEN_ROOT_DIR}/modules/lightmapper_rd)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-lightmapper-rd)

####################################
#godot-module-mbedtls
####################################
set(GODOT_MODULE_MBEDTLS_DIR ${GODOT_MODULES_BASE_DIR}/mbedtls)
set(GODOT_MODULE_MBEDTLS_SOURCE
	${GODOT_MODULE_MBEDTLS_DIR}/crypto_mbedtls.cpp
	${GODOT_MODULE_MBEDTLS_DIR}/crypto_mbedtls.h
	${GODOT_MODULE_MBEDTLS_DIR}/dtls_server_mbedtls.cpp
	${GODOT_MODULE_MBEDTLS_DIR}/dtls_server_mbedtls.h
	${GODOT_MODULE_MBEDTLS_DIR}/packet_peer_mbed_dtls.cpp
	${GODOT_MODULE_MBEDTLS_DIR}/packet_peer_mbed_dtls.h
	${GODOT_MODULE_MBEDTLS_DIR}/register_types.cpp
	${GODOT_MODULE_MBEDTLS_DIR}/register_types.h
	${GODOT_MODULE_MBEDTLS_DIR}/stream_peer_mbedtls.cpp
	${GODOT_MODULE_MBEDTLS_DIR}/stream_peer_mbedtls.h
	${GODOT_MODULE_MBEDTLS_DIR}/tests/test_crypto_mbedtls.cpp
	${GODOT_MODULE_MBEDTLS_DIR}/tests/test_crypto_mbedtls.h
	${GODOT_MODULE_MBEDTLS_DIR}/tls_context_mbedtls.cpp
	${GODOT_MODULE_MBEDTLS_DIR}/tls_context_mbedtls.h
	)
add_library(godot-module-mbedtls STATIC ${GODOT_MODULE_MBEDTLS_SOURCE})
target_link_libraries(godot-module-mbedtls PUBLIC godot-object mbedtls)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-mbedtls)

####################################
#godot-module-meshoptimizer
####################################
set(GODOT_MODULE_MESHOPTIMIZER_DIR ${GODOT_MODULES_BASE_DIR}/meshoptimizer)
set(GODOT_MODULE_MESHOPTIMIZER_SOURCE
	${GODOT_MODULE_MESHOPTIMIZER_DIR}/register_types.cpp
	${GODOT_MODULE_MESHOPTIMIZER_DIR}/register_types.h
	)
add_library(godot-module-meshoptimizer STATIC ${GODOT_MODULE_MESHOPTIMIZER_SOURCE})
target_link_libraries(godot-module-meshoptimizer PUBLIC godot-object meshoptimizer)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-meshoptimizer)

####################################
#godot-module-minimp3
####################################
set(GODOT_MODULE_MINIMP3_DIR ${GODOT_MODULES_BASE_DIR}/minimp3)
set(GODOT_MODULE_MINIMP3_SOURCE
	${GODOT_MODULE_MINIMP3_DIR}/audio_stream_mp3.cpp
	${GODOT_MODULE_MINIMP3_DIR}/audio_stream_mp3.h
	${GODOT_MODULE_MINIMP3_DIR}/register_types.cpp
	${GODOT_MODULE_MINIMP3_DIR}/register_types.h
	${GODOT_MODULE_MINIMP3_DIR}/resource_importer_mp3.cpp
	${GODOT_MODULE_MINIMP3_DIR}/resource_importer_mp3.h
	)
add_library(godot-module-minimp3 STATIC ${GODOT_MODULE_MINIMP3_SOURCE})
target_link_libraries(godot-module-minimp3 PUBLIC godot-object minimp3)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-minimp3)

####################################
#godot-module-mobile_vr
####################################
set(GODOT_MODULE_MOBILE_VR_DIR ${GODOT_MODULES_BASE_DIR}/mobile_vr)
set(GODOT_MODULE_MOBILE_VR_SOURCE
	${GODOT_MODULE_MOBILE_VR_DIR}/mobile_vr_interface.cpp
	${GODOT_MODULE_MOBILE_VR_DIR}/mobile_vr_interface.h
	${GODOT_MODULE_MOBILE_VR_DIR}/register_types.cpp
	${GODOT_MODULE_MOBILE_VR_DIR}/register_types.h
	)
add_library(godot-module-mobile-vr STATIC ${GODOT_MODULE_MOBILE_VR_SOURCE})
target_link_libraries(godot-module-mobile-vr PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-mobile-vr)

####################################
#godot-module-mono *BROKEN*
####################################
set(GODOT_MODULE_MONO_DIR ${GODOT_MODULES_BASE_DIR}/mono)
set(GODOT_MODULE_MONO_SOURCE
	${GODOT_MODULE_MONO_DIR}/class_db_api_json.cpp
	${GODOT_MODULE_MONO_DIR}/class_db_api_json.h
	${GODOT_MODULE_MONO_DIR}/csharp_script.cpp
	${GODOT_MODULE_MONO_DIR}/csharp_script.h
	${GODOT_MODULE_MONO_DIR}/editor/editor_internal_calls.h
	${GODOT_MODULE_MONO_DIR}/editor/hostfxr_resolver.h
	${GODOT_MODULE_MONO_DIR}/editor/editor_internal_calls.cpp
	${GODOT_MODULE_MONO_DIR}/editor/bindings_generator.h
	${GODOT_MODULE_MONO_DIR}/editor/semver.h
	${GODOT_MODULE_MONO_DIR}/editor/code_completion.cpp
	${GODOT_MODULE_MONO_DIR}/editor/semver.cpp
	${GODOT_MODULE_MONO_DIR}/editor/bindings_generator.cpp
	${GODOT_MODULE_MONO_DIR}/editor/code_completion.h
	${GODOT_MODULE_MONO_DIR}/editor/hostfxr_resolver.cpp
	${GODOT_MODULE_MONO_DIR}/godotsharp_defs.h
	${GODOT_MODULE_MONO_DIR}/godotsharp_dirs.cpp
	${GODOT_MODULE_MONO_DIR}/godotsharp_dirs.h
	${GODOT_MODULE_MONO_DIR}/icons/CSharpScript.svg
	${GODOT_MODULE_MONO_DIR}/interop_types.h
	${GODOT_MODULE_MONO_DIR}/managed_callable.cpp
	${GODOT_MODULE_MONO_DIR}/managed_callable.h
	${GODOT_MODULE_MONO_DIR}/mono_gc_handle.cpp
	${GODOT_MODULE_MONO_DIR}/mono_gc_handle.h
	${GODOT_MODULE_MONO_DIR}/mono_gd/android_mono_config.h
	${GODOT_MODULE_MONO_DIR}/mono_gd/gd_mono.cpp
	# ${GODOT_MODULE_MONO_DIR}/mono_gd/support/ios_support.mm
	# ${GODOT_MODULE_MONO_DIR}/mono_gd/support/android_support.cpp
	# ${GODOT_MODULE_MONO_DIR}/mono_gd/support/android_support.h
	# ${GODOT_MODULE_MONO_DIR}/mono_gd/support/ios_support.h
	${GODOT_MODULE_MONO_DIR}/mono_gd/gd_mono_cache.h
	${GODOT_MODULE_MONO_DIR}/mono_gd/gd_mono.h
	${GODOT_MODULE_MONO_DIR}/mono_gd/gd_mono_cache.cpp
	${GODOT_MODULE_MONO_DIR}/register_types.cpp
	${GODOT_MODULE_MONO_DIR}/register_types.h
	${GODOT_MODULE_MONO_DIR}/signal_awaiter_utils.cpp
	${GODOT_MODULE_MONO_DIR}/signal_awaiter_utils.h
	${GODOT_MODULE_MONO_DIR}/thirdparty/hostfxr.h
	${GODOT_MODULE_MONO_DIR}/thirdparty/coreclr_delegates.h
	${GODOT_MODULE_MONO_DIR}/utils/path_utils.h
	${GODOT_MODULE_MONO_DIR}/utils/macros.h
	${GODOT_MODULE_MONO_DIR}/utils/string_utils.h
	${GODOT_MODULE_MONO_DIR}/utils/path_utils.cpp
	${GODOT_MODULE_MONO_DIR}/utils/string_utils.cpp
	${GODOT_MODULE_MONO_DIR}/utils/naming_utils.cpp
	${GODOT_MODULE_MONO_DIR}/utils/macos_utils.cpp
	${GODOT_MODULE_MONO_DIR}/utils/macos_utils.h
	${GODOT_MODULE_MONO_DIR}/utils/naming_utils.h
	${GODOT_MODULE_MONO_DIR}/glue/runtime_interop.cpp
	${GODOT_MODULE_MONO_DIR}/glue/runtime_interop.h
	)

set(GODOT_MODULE_MONO_SCRIPT_DOTNET_SDK_CSHARP
		${GODOT_MODULE_MONO_DIR}/config.py
	${GODOT_MODULE_MONO_DIR}/build_scripts/__init__.py
	${GODOT_MODULE_MONO_DIR}/build_scripts/mono_configure.py
	${GODOT_MODULE_MONO_DIR}/build_scripts/build_assemblies.py
	${GODOT_MODULE_MONO_DIR}/Directory.Build.props
	${GODOT_MODULE_MONO_DIR}/Directory.Build.targets
	${GODOT_MODULE_MONO_DIR}/doc_classes/CSharpScript.xml
	${GODOT_MODULE_MONO_DIR}/doc_classes/GodotSharp.xml
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/ExternalEditorId.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Export/ExportPlugin.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Export/AotBuilder.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Export/XcodeHelper.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/GodotSharpEditor.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/PlaySettings.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/NuGetUtils.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/BuildManager.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/BuildInfo.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/DotNetFinder.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/BuildOutputView.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/BuildResult.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/MSBuildPanel.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Build/BuildSystem.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/VerbosityLevelId.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/CsProjOperations.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Internals/GodotSharpDirs.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Internals/EditorProgress.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Internals/Globals.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Internals/Internal.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Utils/CollectionExtensions.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Utils/User32Dll.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Utils/FsPathUtils.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Utils/File.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Utils/Directory.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Utils/OS.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/HotReloadAssemblyWatcher.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/GodotTools.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Ides/MonoDevelop/Instance.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Ides/MonoDevelop/EditorId.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Ides/GodotIdeManager.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Ides/MessagingServer.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Ides/Rider/RiderPathManager.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools/Ides/Rider/RiderPathLocator.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.BuildLogger/GodotBuildLogger.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.BuildLogger/GodotTools.BuildLogger.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.OpenVisualStudio/Program.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.OpenVisualStudio/GodotTools.OpenVisualStudio.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging.CLI/Program.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging.CLI/ForwarderMessageHandler.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging.CLI/GodotTools.IdeMessaging.CLI.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.sln
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.ProjectEditor/ProjectUtils.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.ProjectEditor/IdentifierUtils.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.ProjectEditor/ApiAssembliesInfo.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.ProjectEditor/ProjectGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.ProjectEditor/DotNetSolution.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.ProjectEditor/GodotTools.ProjectEditor.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/Message.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/ILogger.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/ClientHandshake.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/Peer.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/MessageDecoder.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/Client.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/IHandshake.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/ClientMessageHandler.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/GodotIdeMetadata.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/Utils/SemaphoreExtensions.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/Utils/NotifyAwaiter.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/ResponseAwaiter.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/GodotTools.IdeMessaging.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/IMessageHandler.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.IdeMessaging/Requests/Requests.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.Core/StringExtensions.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.Core/GodotTools.Core.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.Core/FileUtils.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.Core/ProcessExtensions.cs
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.Shared/GodotTools.Shared.csproj
	${GODOT_MODULE_MONO_DIR}/editor/GodotTools/GodotTools.Shared/GenerateGodotNupkgsVersions.targets
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.NET.Sdk/Godot.NET.Sdk.csproj
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.NET.Sdk/Sdk/Sdk.targets
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.NET.Sdk/Sdk/Sdk.props
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.NET.Sdk.sln
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/Godot.SourceGenerators.Sample.csproj
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/Generic.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/ExportedProperties.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/Bar.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/MoreExportedFields.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/Foo.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/ScriptBoilerplate.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/EventSignals.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/ExportedFields.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators.Sample/Methods.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/Godot.SourceGenerators.csproj
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ScriptSignalsGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/GodotMemberData.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ScriptSerializationGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/EventHandlerSuffixSuppressor.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ExtensionMethods.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/GodotEnums.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/Godot.SourceGenerators.props
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ScriptRegistrarGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/MarshalUtils.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/PropertyInfo.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ScriptPathAttributeGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/GodotPluginsInitializerGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/MarshalType.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ScriptPropertiesGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/GodotClasses.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/MethodInfo.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ScriptPropertyDefValGenerator.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/MustBeVariantAnalyzer.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/Common.cs
	${GODOT_MODULE_MONO_DIR}/editor/Godot.NET.Sdk/Godot.SourceGenerators/ScriptMethodsGenerator.cs
	)

set(GODOT_MODULE_MONO_SCRIPT_TEMPLATES_CSHARP
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/EditorScenePostImport/basic_import_script.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/EditorScenePostImport/no_comments.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/CharacterBody3D/basic_movement.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/VisualShaderNodeCustom/basic.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/CharacterBody2D/basic_movement.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/Node/default.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/EditorPlugin/plugin.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/Object/empty.cs
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/SCsub
	${GODOT_MODULE_MONO_DIR}/editor/script_templates/EditorScript/basic_editor_script.cs
	)

set(GODOT_MODULE_MONO_GODOTSHARP_SOURCE
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotPlugins/PluginLoadContext.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotPlugins/GodotPlugins.csproj
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotPlugins/Main.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/GodotSharp.csproj
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/GodotSharp.csproj.DotSettings
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Properties/AssemblyInfo.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/StringName.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/GodotTaskScheduler.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/GodotObject.base.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/StringExtensions.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/CustomGCHandle.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Extensions/NodeExtensions.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Extensions/GodotObjectExtensions.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Extensions/PackedSceneExtensions.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Extensions/ResourceLoaderExtensions.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/MathfEx.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Basis.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Colors.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Rect2I.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/GodotUnhandledExceptionEvent.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/MustBeVariantAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/ExportCategoryAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/RpcAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/GodotClassNameAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/ToolAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/ScriptPathAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/SignalAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/AssemblyHasScriptsAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/ExportGroupAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/ExportSubgroupAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Attributes/ExportAttribute.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Aabb.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Vector3.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Vector2I.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/ReflectionUtils.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NodePath.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Dictionary.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Transform2D.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Vector4I.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Dispatcher.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/AlcReloadCfg.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/ManagedCallbacks.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/PropertyInfo.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/ScriptManagerBridge.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/GCHandleBridge.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/CSharpInstanceBridge.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/MethodInfo.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/GodotSerializationInfo.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Bridge/ScriptManagerBridge.types.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Rid.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/GodotSynchronizationContext.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/NativeFuncs.extended.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/VariantUtils.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/VariantUtils.generic.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/InteropUtils.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/InteropStructs.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/ExceptionUtils.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/NativeVariantPtrArgs.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/CustomUnsafe.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/NativeFuncs.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/GodotDllImportResolver.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/NativeInterop/Marshaling.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Variant.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Vector4.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Signal.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Interfaces/IAwaiter.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Interfaces/ISerializationListener.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Interfaces/IAwaitable.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Projection.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Rect2.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Vector3I.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/GodotObject.exceptions.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/DebuggingUtils.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Array.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/GodotTraceListener.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/GD.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/DelegateUtils.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Quaternion.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Vector2.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Callable.generics.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Color.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/SignalAwaiter.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Transform3D.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Mathf.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Plane.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/Callable.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/Core/DisposablesTracker.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp/GlobalUsings.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/.editorconfig
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/.gitignore
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/Godot.SourceGenerators.Internal/Godot.SourceGenerators.Internal.csproj
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/Godot.SourceGenerators.Internal/ExtensionMethods.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/Godot.SourceGenerators.Internal/UnmanagedCallbacksGenerator.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/Godot.SourceGenerators.Internal/GeneratorClasses.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/Godot.SourceGenerators.Internal/CallbacksInfo.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/Godot.SourceGenerators.Internal/Common.cs
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/ExternalAnnotations/System.Runtime.InteropServices.xml
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharpEditor/GodotSharpEditor.csproj.DotSettings
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharpEditor/GodotSharpEditor.csproj
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp.sln.DotSettings
	${GODOT_MODULE_MONO_DIR}/glue/GodotSharp/GodotSharp.sln
)

add_library(godot-module-mono STATIC ${GODOT_MODULE_MONO_SOURCE})
target_link_libraries(godot-module-mono PUBLIC godot-string godot-io godot-os godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-mono)

####################################
#godot-module-msdfgen
####################################
set(GODOT_MODULE_MSDFGEN_DIR ${GODOT_MODULES_BASE_DIR}/msdfgen)
set(GODOT_MODULE_MSDFGEN_SOURCE
	${GODOT_MODULE_MSDFGEN_DIR}/register_types.cpp
	${GODOT_MODULE_MSDFGEN_DIR}/register_types.h
	)
add_library(godot-module-msdfgen STATIC ${GODOT_MODULE_MSDFGEN_SOURCE})
target_link_libraries(godot-module-msdfgen PUBLIC godot-object msdfgen)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-msdfgen)

####################################
#godot-module-multiplayer
####################################
set(GODOT_MODULE_MULTIPLAYER_DIR ${GODOT_MODULES_BASE_DIR}/multiplayer)
set(GODOT_MODULE_MULTIPLAYER_SOURCE
	${GODOT_MODULE_MULTIPLAYER_DIR}/editor/replication_editor.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/editor/multiplayer_editor_plugin.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/editor/editor_network_profiler.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/editor/multiplayer_editor_plugin.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/editor/replication_editor.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/editor/editor_network_profiler.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/multiplayer_debugger.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/multiplayer_debugger.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/multiplayer_spawner.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/multiplayer_spawner.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/multiplayer_synchronizer.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/multiplayer_synchronizer.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/register_types.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/register_types.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_cache_interface.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_cache_interface.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_multiplayer.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_multiplayer.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_replication_config.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_replication_config.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_replication_interface.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_replication_interface.h
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_rpc_interface.cpp
	${GODOT_MODULE_MULTIPLAYER_DIR}/scene_rpc_interface.h
	)
add_library(godot-module-multiplayer STATIC ${GODOT_MODULE_MULTIPLAYER_SOURCE})
target_link_libraries(godot-module-multiplayer PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-multiplayer)

####################################
#godot-module-navigation
####################################
set(GODOT_MODULE_NAVIGATION_DIR ${GODOT_MODULES_BASE_DIR}/navigation)
set(GODOT_MODULE_NAVIGATION_SOURCE
	${GODOT_MODULE_NAVIGATION_DIR}/editor/navigation_mesh_editor_plugin.h
	${GODOT_MODULE_NAVIGATION_DIR}/editor/navigation_mesh_editor_plugin.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/godot_navigation_server.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/godot_navigation_server.h
	${GODOT_MODULE_NAVIGATION_DIR}/nav_agent.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/nav_agent.h
	${GODOT_MODULE_NAVIGATION_DIR}/nav_base.h
	${GODOT_MODULE_NAVIGATION_DIR}/navigation_mesh_generator.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/navigation_mesh_generator.h
	${GODOT_MODULE_NAVIGATION_DIR}/nav_link.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/nav_link.h
	${GODOT_MODULE_NAVIGATION_DIR}/nav_map.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/nav_map.h
	${GODOT_MODULE_NAVIGATION_DIR}/nav_region.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/nav_region.h
	${GODOT_MODULE_NAVIGATION_DIR}/nav_rid.h
	${GODOT_MODULE_NAVIGATION_DIR}/nav_utils.h
	${GODOT_MODULE_NAVIGATION_DIR}/register_types.cpp
	${GODOT_MODULE_NAVIGATION_DIR}/register_types.h
)
add_library(godot-module-navigation STATIC ${GODOT_MODULE_NAVIGATION_SOURCE})
target_link_libraries(godot-module-navigation PUBLIC godot-object rvo2 recast-navigation)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-navigation)

####################################
#godot-module-noise
####################################
set(GODOT_MODULE_NOISE_DIR ${GODOT_MODULES_BASE_DIR}/noise)
set(GODOT_MODULE_NOISE_SOURCE
	${GODOT_MODULE_NOISE_DIR}/editor/noise_editor_plugin.cpp
	${GODOT_MODULE_NOISE_DIR}/editor/noise_editor_plugin.h
	${GODOT_MODULE_NOISE_DIR}/fastnoise_lite.cpp
	${GODOT_MODULE_NOISE_DIR}/fastnoise_lite.h
	${GODOT_MODULE_NOISE_DIR}/noise.cpp
	${GODOT_MODULE_NOISE_DIR}/noise.h
	${GODOT_MODULE_NOISE_DIR}/noise_texture_2d.cpp
	${GODOT_MODULE_NOISE_DIR}/noise_texture_2d.h
	${GODOT_MODULE_NOISE_DIR}/register_types.cpp
	${GODOT_MODULE_NOISE_DIR}/register_types.h
	${GODOT_MODULE_NOISE_DIR}/SCsub
	${GODOT_MODULE_NOISE_DIR}/tests/test_fastnoise_lite.h
	${GODOT_MODULE_NOISE_DIR}/tests/test_noise_texture_2d.h
	)
add_library(godot-module-noise STATIC ${GODOT_MODULE_NOISE_SOURCE})
target_link_libraries(godot-module-noise PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-noise)

####################################
#godot-module-ogg
####################################
set(GODOT_MODULE_OGG_DIR ${GODOT_MODULES_BASE_DIR}/ogg)
set(GODOT_MODULE_OGG_SOURCE
	${GODOT_MODULE_OGG_DIR}/ogg_packet_sequence.cpp
	${GODOT_MODULE_OGG_DIR}/ogg_packet_sequence.h
	${GODOT_MODULE_OGG_DIR}/register_types.cpp
	${GODOT_MODULE_OGG_DIR}/register_types.h
	)
add_library(godot-module-ogg STATIC ${GODOT_MODULE_OGG_SOURCE})
target_link_libraries(godot-module-ogg PUBLIC godot-object ogg)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-ogg)

####################################
#godot-module-openxr
####################################
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
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_vulkan_extension.cpp
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
	${GODOT_MODULE_OPENXR_DIR}/extensions/openxr_opengl_extension.cpp
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
add_library(godot-module-openxr STATIC ${GODOT_MODULE_OPENXR_SOURCE})
target_link_libraries(godot-module-openxr PUBLIC godot-object openxr)
target_compile_definitions(godot-module-openxr PUBLIC XR_USE_GRAPHICS_API_VULKAN=1)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-openxr)

####################################
#godot-module-raycast
####################################
set(GODOT_MODULE_RAYCAST_DIR ${GODOT_MODULES_BASE_DIR}/raycast)
set(GODOT_MODULE_RAYCAST_SOURCE
	${GODOT_MODULE_RAYCAST_DIR}/lightmap_raycaster_embree.cpp
	${GODOT_MODULE_RAYCAST_DIR}/lightmap_raycaster_embree.h
	${GODOT_MODULE_RAYCAST_DIR}/raycast_occlusion_cull.cpp
	${GODOT_MODULE_RAYCAST_DIR}/raycast_occlusion_cull.h
	${GODOT_MODULE_RAYCAST_DIR}/register_types.cpp
	${GODOT_MODULE_RAYCAST_DIR}/register_types.h
	${GODOT_MODULE_RAYCAST_DIR}/static_raycaster_embree.cpp
	${GODOT_MODULE_RAYCAST_DIR}/static_raycaster_embree.h
	)
add_library(godot-module-raycast STATIC ${GODOT_MODULE_RAYCAST_SOURCE})
target_link_libraries(godot-module-raycast PUBLIC godot-object embree)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-raycast)

####################################
#godot-module-regex
####################################
set(GODOT_MODULE_REGEX_DIR ${GODOT_MODULES_BASE_DIR}/regex)
set(GODOT_MODULE_REGEX_SOURCE
	${GODOT_MODULE_REGEX_DIR}/regex.cpp
	${GODOT_MODULE_REGEX_DIR}/regex.h
	${GODOT_MODULE_REGEX_DIR}/register_types.cpp
	${GODOT_MODULE_REGEX_DIR}/register_types.h
	${GODOT_MODULE_REGEX_DIR}/tests/test_regex.h
	)
add_library(godot-module-regex STATIC ${GODOT_MODULE_REGEX_SOURCE})
target_link_libraries(godot-module-regex PUBLIC godot-object pcre2)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-regex)

####################################
#godot-module-squish
####################################
set(GODOT_MODULE_SQUISH_DIR ${GODOT_MODULES_BASE_DIR}/squish)
set(GODOT_MODULE_SQUISH_SOURCE
	${GODOT_MODULE_SQUISH_DIR}/image_decompress_squish.cpp
	${GODOT_MODULE_SQUISH_DIR}/image_decompress_squish.h
	${GODOT_MODULE_SQUISH_DIR}/register_types.cpp
	${GODOT_MODULE_SQUISH_DIR}/register_types.h
	)
add_library(godot-module-squish STATIC ${GODOT_MODULE_SQUISH_SOURCE})
target_link_libraries(godot-module-squish PUBLIC godot-object squish)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-squish)

####################################
#godot-module-svg
####################################
set(GODOT_MODULE_SVG_DIR ${GODOT_MODULES_BASE_DIR}/svg)
set(GODOT_MODULE_SVG_SOURCE
	${GODOT_MODULE_SVG_DIR}/image_loader_svg.cpp
	${GODOT_MODULE_SVG_DIR}/image_loader_svg.h
	${GODOT_MODULE_SVG_DIR}/register_types.cpp
	${GODOT_MODULE_SVG_DIR}/register_types.h
	)
add_library(godot-module-svg STATIC ${GODOT_MODULE_SVG_SOURCE})
target_link_libraries(godot-module-svg PUBLIC godot-object thorvg)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-svg)

####################################
#godot-module-text-server-adv
####################################
set(GODOT_MODULE_TEXT_SERVER_ADV_DIR ${GODOT_MODULES_BASE_DIR}/text_server_adv)
set(GODOT_MODULE_TEXT_SERVER_ADV_SOURCE
	#Compiled into icu directly
	#${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/icu_data/icudata_stub.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/register_types.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/register_types.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/script_iterator.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/script_iterator.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/text_server_adv.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/text_server_adv.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_bounds_iterator.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_bounds_iterator.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_svg_in_ot.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_svg_in_ot.h
	)
add_library(godot-module-text-server-adv STATIC ${GODOT_MODULE_TEXT_SERVER_ADV_SOURCE})
target_link_libraries(godot-module-text-server-adv PUBLIC godot-object thorvg harfbuzz freetype msdfgen icu4c)
#target_compile_definitions(godot-module-text-server-adv)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-text-server-adv)

####################################
#godot-module-text-server-fb
####################################
set(GODOT_MODULE_TEXT_SERVER_FB_DIR ${GODOT_MODULES_BASE_DIR}/text_server_fb)
set(GODOT_MODULE_TEXT_SERVER_FB_SOURCE
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/register_types.cpp
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/register_types.h
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/text_server_fb.cpp
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/text_server_fb.h
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/thorvg_bounds_iterator.cpp
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/thorvg_bounds_iterator.h
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/thorvg_svg_in_ot.cpp
	${GODOT_MODULE_TEXT_SERVER_FB_DIR}/thorvg_svg_in_ot.h
)
add_library(godot-module-text-server-fb STATIC ${GODOT_MODULE_TEXT_SERVER_FB_SOURCE})
target_link_libraries(godot-module-text-server-fb PUBLIC godot-object thorvg freetype msdfgen)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-text-server-fb)

####################################
#godot-module-tga
####################################
set(GODOT_MODULE_TGA_DIR ${GODOT_MODULES_BASE_DIR}/tga)
set(GODOT_MODULE_TGA_SOURCE
	${GODOT_MODULE_TGA_DIR}/image_loader_tga.cpp
	${GODOT_MODULE_TGA_DIR}/image_loader_tga.h
	${GODOT_MODULE_TGA_DIR}/register_types.cpp
	${GODOT_MODULE_TGA_DIR}/register_types.h
)
add_library(godot-module-tga STATIC ${GODOT_MODULE_TGA_SOURCE})
target_link_libraries(godot-module-tga PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-tga)

####################################
#godot-module-theora
####################################
set(GODOT_MODULE_THEORA_DIR ${GODOT_MODULES_BASE_DIR}/theora)
set(GODOT_MODULE_THEORA_SOURCE
	${GODOT_MODULE_THEORA_DIR}/register_types.cpp
	${GODOT_MODULE_THEORA_DIR}/register_types.h
	${GODOT_MODULE_THEORA_DIR}/video_stream_theora.cpp
	${GODOT_MODULE_THEORA_DIR}/video_stream_theora.h
	)
add_library(godot-module-theora STATIC ${GODOT_MODULE_THEORA_SOURCE})
target_link_libraries(godot-module-theora PUBLIC godot-object theora vorbis)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-theora)

####################################
#godot-module-tinyexr
####################################
set(GODOT_MODULE_TINYEXR_DIR ${GODOT_MODULES_BASE_DIR}/tinyexr)
set(GODOT_MODULE_TINYEXR_SOURCE
	${GODOT_MODULE_TINYEXR_DIR}/image_loader_tinyexr.cpp
	${GODOT_MODULE_TINYEXR_DIR}/image_loader_tinyexr.h
	${GODOT_MODULE_TINYEXR_DIR}/image_saver_tinyexr.cpp
	${GODOT_MODULE_TINYEXR_DIR}/image_saver_tinyexr.h
	${GODOT_MODULE_TINYEXR_DIR}/register_types.cpp
	${GODOT_MODULE_TINYEXR_DIR}/register_types.h
	)
add_library(godot-module-tinyexr STATIC ${GODOT_MODULE_TINYEXR_SOURCE})
target_link_libraries(godot-module-tinyexr PUBLIC godot-object tinyexr)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-tinyexr)

####################################
#godot-module-upnp
####################################
set(GODOT_MODULE_UPNP_DIR ${GODOT_MODULES_BASE_DIR}/upnp)
set(GODOT_MODULE_UPNP_SOURCE
	${GODOT_MODULE_UPNP_DIR}/register_types.cpp
	${GODOT_MODULE_UPNP_DIR}/register_types.h
	${GODOT_MODULE_UPNP_DIR}/upnp.cpp
	${GODOT_MODULE_UPNP_DIR}/upnp_device.cpp
	${GODOT_MODULE_UPNP_DIR}/upnp_device.h
	${GODOT_MODULE_UPNP_DIR}/upnp.h
	)
add_library(godot-module-upnp STATIC ${GODOT_MODULE_UPNP_SOURCE})
target_link_libraries(godot-module-upnp PUBLIC godot-object miniupnpc)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-upnp)

####################################
#godot-module-vhacd
####################################
set(GODOT_MODULE_VHACD_DIR ${GODOT_MODULES_BASE_DIR}/vhacd)
set(GODOT_MODULE_VHACD_SOURCE
	${GODOT_MODULE_VHACD_DIR}/register_types.cpp
	${GODOT_MODULE_VHACD_DIR}/register_types.h
	)
add_library(godot-module-vhacd STATIC ${GODOT_MODULE_VHACD_SOURCE})
target_link_libraries(godot-module-vhacd PUBLIC godot-object vhacd)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-vhacd)

####################################
#godot-module-vorbis
####################################
set(GODOT_MODULE_VORBIS_DIR ${GODOT_MODULES_BASE_DIR}/vorbis)
set(GODOT_MODULE_VORBIS_SOURCE
	${GODOT_MODULE_VORBIS_DIR}/audio_stream_ogg_vorbis.cpp
	${GODOT_MODULE_VORBIS_DIR}/audio_stream_ogg_vorbis.h
	${GODOT_MODULE_VORBIS_DIR}/register_types.cpp
	${GODOT_MODULE_VORBIS_DIR}/register_types.h
	${GODOT_MODULE_VORBIS_DIR}/resource_importer_ogg_vorbis.cpp
	${GODOT_MODULE_VORBIS_DIR}/resource_importer_ogg_vorbis.h
	)
add_library(godot-module-vorbis STATIC ${GODOT_MODULE_VORBIS_SOURCE})
target_link_libraries(godot-module-vorbis PUBLIC godot-object vorbis)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-vorbis)

####################################
#godot-module-webp
####################################
set(GODOT_MODULE_WEBP_DIR ${GODOT_MODULES_BASE_DIR}/webp)
set(GODOT_MODULE_WEBP_SOURCE
	${GODOT_MODULE_WEBP_DIR}/image_loader_webp.cpp
	${GODOT_MODULE_WEBP_DIR}/image_loader_webp.h
	${GODOT_MODULE_WEBP_DIR}/register_types.cpp
	${GODOT_MODULE_WEBP_DIR}/register_types.h
	${GODOT_MODULE_WEBP_DIR}/resource_saver_webp.cpp
	${GODOT_MODULE_WEBP_DIR}/resource_saver_webp.h
	${GODOT_MODULE_WEBP_DIR}/webp_common.cpp
	${GODOT_MODULE_WEBP_DIR}/webp_common.h
	)
add_library(godot-module-webp STATIC ${GODOT_MODULE_WEBP_SOURCE})
target_link_libraries(godot-module-webp PUBLIC godot-object webp)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-webp)

####################################
#godot-module-webrtc
####################################
set(GODOT_MODULE_WEBRTC_DIR ${GODOT_MODULES_BASE_DIR}/webrtc)
set(GODOT_MODULE_WEBRTC_SOURCE
	${GODOT_MODULE_WEBRTC_DIR}/register_types.cpp
	${GODOT_MODULE_WEBRTC_DIR}/register_types.h
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_data_channel.cpp
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_data_channel_extension.cpp
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_data_channel_extension.h
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_data_channel.h
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_data_channel_js.cpp
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_data_channel_js.h
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_multiplayer_peer.cpp
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_multiplayer_peer.h
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_peer_connection.cpp
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_peer_connection_extension.cpp
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_peer_connection_extension.h
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_peer_connection.h
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_peer_connection_js.cpp
	${GODOT_MODULE_WEBRTC_DIR}/webrtc_peer_connection_js.h
	)
add_library(godot-module-webrtc STATIC ${GODOT_MODULE_WEBRTC_SOURCE})
target_link_libraries(godot-module-webrtc PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-webrtc)

####################################
#godot-module-websocket
####################################
set(GODOT_MODULE_WEBSOCKET_DIR ${GODOT_MODULES_BASE_DIR}/websocket)
set(GODOT_MODULE_WEBSOCKET_SOURCE
	${GODOT_MODULE_WEBSOCKET_DIR}/editor/editor_debugger_server_websocket.cpp
	${GODOT_MODULE_WEBSOCKET_DIR}/editor/editor_debugger_server_websocket.h
	${GODOT_MODULE_WEBSOCKET_DIR}/emws_peer.cpp
	${GODOT_MODULE_WEBSOCKET_DIR}/emws_peer.h
	${GODOT_MODULE_WEBSOCKET_DIR}/packet_buffer.h
	${GODOT_MODULE_WEBSOCKET_DIR}/register_types.cpp
	${GODOT_MODULE_WEBSOCKET_DIR}/register_types.h
	${GODOT_MODULE_WEBSOCKET_DIR}/remote_debugger_peer_websocket.cpp
	${GODOT_MODULE_WEBSOCKET_DIR}/remote_debugger_peer_websocket.h
	${GODOT_MODULE_WEBSOCKET_DIR}/websocket_multiplayer_peer.cpp
	${GODOT_MODULE_WEBSOCKET_DIR}/websocket_multiplayer_peer.h
	${GODOT_MODULE_WEBSOCKET_DIR}/websocket_peer.cpp
	${GODOT_MODULE_WEBSOCKET_DIR}/websocket_peer.h
	${GODOT_MODULE_WEBSOCKET_DIR}/wsl_peer.cpp
	${GODOT_MODULE_WEBSOCKET_DIR}/wsl_peer.h
	)
add_library(godot-module-websocket STATIC ${GODOT_MODULE_WEBSOCKET_SOURCE})
target_link_libraries(godot-module-websocket PUBLIC godot-object wslay)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-websocket)

####################################
#godot-module-webxr
####################################
set(GODOT_MODULE_WEBXR_DIR ${GODOT_MODULES_BASE_DIR}/webxr)
set(GODOT_MODULE_WEBXR_SOURCE
	${GODOT_MODULE_WEBXR_DIR}/godot_webxr.h
	${GODOT_MODULE_WEBXR_DIR}/register_types.cpp
	${GODOT_MODULE_WEBXR_DIR}/register_types.h
	${GODOT_MODULE_WEBXR_DIR}/webxr_interface.cpp
	${GODOT_MODULE_WEBXR_DIR}/webxr_interface.h
	${GODOT_MODULE_WEBXR_DIR}/webxr_interface_js.cpp
	${GODOT_MODULE_WEBXR_DIR}/webxr_interface_js.h
	)
add_library(godot-module-webxr STATIC ${GODOT_MODULE_WEBXR_SOURCE})
target_link_libraries(godot-module-webxr PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-webxr)

####################################
#godot-module-xatlas-unwrap
####################################
set(GODOT_MODULE_XATLAS_UNWRAP_DIR ${GODOT_MODULES_BASE_DIR}/xatlas_unwrap)
set(GODOT_MODULE_XATLAS_UNWRAP_SOURCE
	${GODOT_MODULE_XATLAS_UNWRAP_DIR}/register_types.cpp
	${GODOT_MODULE_XATLAS_UNWRAP_DIR}/register_types.h
	)
add_library(godot-module-xatlas-unwrap STATIC ${GODOT_MODULE_XATLAS_UNWRAP_SOURCE})
target_link_libraries(godot-module-xatlas-unwrap PUBLIC godot-object)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-xatlas-unwrap)

####################################
#godot-module-zip
####################################
set(GODOT_MODULE_ZIP_DIR ${GODOT_MODULES_BASE_DIR}/zip)
set(GODOT_MODULE_ZIP_SOURCE
	${GODOT_MODULE_ZIP_DIR}/register_types.cpp
	${GODOT_MODULE_ZIP_DIR}/register_types.h
	${GODOT_MODULE_ZIP_DIR}/zip_packer.cpp
	${GODOT_MODULE_ZIP_DIR}/zip_packer.h
	${GODOT_MODULE_ZIP_DIR}/zip_reader.cpp
	${GODOT_MODULE_ZIP_DIR}/zip_reader.h
	)
add_library(godot-module-zip STATIC ${GODOT_MODULE_ZIP_SOURCE})
target_link_libraries(godot-module-zip PUBLIC godot-object godot-io minizip)
list(APPEND GODOT_MODULES_LIBRARIES_INTERNAL godot-module-zip)
set(GODOT_MODULE_LIBRARIES ${GODOT_MODULES_LIBRARIES_INTERNAL} PARENT_SCOPE)
