#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_CORE_BASE_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/core)
set(GODOT_SOURCE_ROOT_PLATFORM_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/platform)

#This variable holds all the targets of this subdirectory
set(GODOT_CORE_LIBRARIES_INTERNAL)

####################################
#object
####################################
set(GODOT_CORE_OBJECT_DIR ${GODOT_CORE_BASE_DIR}/object)
set(GODOT_CORE_OBJECT_SOURCE
    ${GODOT_CORE_OBJECT_DIR}/callable_method_pointer.cpp
    ${GODOT_CORE_OBJECT_DIR}/callable_method_pointer.h
    ${GODOT_CORE_OBJECT_DIR}/class_db.cpp
    ${GODOT_CORE_OBJECT_DIR}/class_db.h
    ${GODOT_CORE_OBJECT_DIR}/make_virtuals.py
    ${GODOT_CORE_OBJECT_DIR}/message_queue.cpp
    ${GODOT_CORE_OBJECT_DIR}/message_queue.h
    ${GODOT_CORE_OBJECT_DIR}/method_bind.cpp
    ${GODOT_CORE_OBJECT_DIR}/method_bind.h
    ${GODOT_CORE_OBJECT_DIR}/object.cpp
    ${GODOT_CORE_OBJECT_DIR}/object.h
    ${GODOT_CORE_OBJECT_DIR}/object_id.h
    ${GODOT_CORE_OBJECT_DIR}/ref_counted.cpp
    ${GODOT_CORE_OBJECT_DIR}/ref_counted.h
    ${GODOT_CORE_OBJECT_DIR}/script_language.cpp
    ${GODOT_CORE_OBJECT_DIR}/script_language_extension.cpp
    ${GODOT_CORE_OBJECT_DIR}/script_language_extension.h
    ${GODOT_CORE_OBJECT_DIR}/script_language.h
    ${GODOT_CORE_OBJECT_DIR}/undo_redo.cpp
    ${GODOT_CORE_OBJECT_DIR}/undo_redo.h
    ${GODOT_CORE_OBJECT_DIR}/worker_thread_pool.cpp
    ${GODOT_CORE_OBJECT_DIR}/worker_thread_pool.h
    )
add_library(godot-object STATIC ${GODOT_CORE_OBJECT_SOURCE})
target_include_directories(godot-object PUBLIC ${GODOT_ENGINE_ROOT_DIRECTORY} ${GODOT_FAKEGEN_ROOT_DIR})
#HACK - Because I am linux steal fakegen
target_include_directories(godot-object PUBLIC ${GODOT_SOURCE_ROOT_PLATFORM_DIR}/linuxbsd)
target_compile_definitions(godot-object PUBLIC
                                      DEBUG_ENABLED=1 MODULE_MONO_ENABLED=1 UNIX_ENABLED=1 GD_MONO_HOT_RELOAD=1 PULSEAUDIO_ENABLED=1 ALSAMIDI_ENABLED=1 VULKAN_ENABLED=1)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-object)

####################################
#math
####################################
set(GODOT_CORE_MATH_DIR ${GODOT_CORE_BASE_DIR}/math)
set(GODOT_CORE_MATH_SOURCE
    ${GODOT_CORE_MATH_DIR}/aabb.cpp
    ${GODOT_CORE_MATH_DIR}/aabb.h
    ${GODOT_CORE_MATH_DIR}/a_star.cpp
    ${GODOT_CORE_MATH_DIR}/a_star_grid_2d.cpp
    ${GODOT_CORE_MATH_DIR}/a_star_grid_2d.h
    ${GODOT_CORE_MATH_DIR}/a_star.h
    ${GODOT_CORE_MATH_DIR}/audio_frame.h
    ${GODOT_CORE_MATH_DIR}/basis.cpp
    ${GODOT_CORE_MATH_DIR}/basis.h
    ${GODOT_CORE_MATH_DIR}/bvh_abb.h
    ${GODOT_CORE_MATH_DIR}/bvh_cull.inc
    ${GODOT_CORE_MATH_DIR}/bvh_debug.inc
    ${GODOT_CORE_MATH_DIR}/bvh.h
    ${GODOT_CORE_MATH_DIR}/bvh_integrity.inc
    ${GODOT_CORE_MATH_DIR}/bvh_logic.inc
    ${GODOT_CORE_MATH_DIR}/bvh_misc.inc
    ${GODOT_CORE_MATH_DIR}/bvh_pair.inc
    ${GODOT_CORE_MATH_DIR}/bvh_public.inc
    ${GODOT_CORE_MATH_DIR}/bvh_refit.inc
    ${GODOT_CORE_MATH_DIR}/bvh_split.inc
    ${GODOT_CORE_MATH_DIR}/bvh_structs.inc
    ${GODOT_CORE_MATH_DIR}/bvh_tree.h
    ${GODOT_CORE_MATH_DIR}/color.cpp
    ${GODOT_CORE_MATH_DIR}/color.h
    ${GODOT_CORE_MATH_DIR}/color_names.inc
    ${GODOT_CORE_MATH_DIR}/convex_hull.cpp
    ${GODOT_CORE_MATH_DIR}/convex_hull.h
    ${GODOT_CORE_MATH_DIR}/delaunay_2d.h
    ${GODOT_CORE_MATH_DIR}/delaunay_3d.h
    ${GODOT_CORE_MATH_DIR}/disjoint_set.h
    ${GODOT_CORE_MATH_DIR}/dynamic_bvh.cpp
    ${GODOT_CORE_MATH_DIR}/dynamic_bvh.h
    ${GODOT_CORE_MATH_DIR}/expression.cpp
    ${GODOT_CORE_MATH_DIR}/expression.h
    ${GODOT_CORE_MATH_DIR}/face3.cpp
    ${GODOT_CORE_MATH_DIR}/face3.h
    ${GODOT_CORE_MATH_DIR}/geometry_2d.cpp
    ${GODOT_CORE_MATH_DIR}/geometry_2d.h
    ${GODOT_CORE_MATH_DIR}/geometry_3d.cpp
    ${GODOT_CORE_MATH_DIR}/geometry_3d.h
    ${GODOT_CORE_MATH_DIR}/math_defs.h
    ${GODOT_CORE_MATH_DIR}/math_fieldwise.cpp
    ${GODOT_CORE_MATH_DIR}/math_fieldwise.h
    ${GODOT_CORE_MATH_DIR}/math_funcs.cpp
    ${GODOT_CORE_MATH_DIR}/math_funcs.h
    ${GODOT_CORE_MATH_DIR}/plane.cpp
    ${GODOT_CORE_MATH_DIR}/plane.h
    ${GODOT_CORE_MATH_DIR}/projection.cpp
    ${GODOT_CORE_MATH_DIR}/projection.h
    ${GODOT_CORE_MATH_DIR}/quaternion.cpp
    ${GODOT_CORE_MATH_DIR}/quaternion.h
    ${GODOT_CORE_MATH_DIR}/quick_hull.cpp
    ${GODOT_CORE_MATH_DIR}/quick_hull.h
    ${GODOT_CORE_MATH_DIR}/random_number_generator.cpp
    ${GODOT_CORE_MATH_DIR}/random_number_generator.h
    ${GODOT_CORE_MATH_DIR}/random_pcg.cpp
    ${GODOT_CORE_MATH_DIR}/random_pcg.h
    ${GODOT_CORE_MATH_DIR}/rect2.cpp
    ${GODOT_CORE_MATH_DIR}/rect2.h
    ${GODOT_CORE_MATH_DIR}/rect2i.cpp
    ${GODOT_CORE_MATH_DIR}/rect2i.h
    ${GODOT_CORE_MATH_DIR}/SCsub
    ${GODOT_CORE_MATH_DIR}/static_raycaster.cpp
    ${GODOT_CORE_MATH_DIR}/static_raycaster.h
    ${GODOT_CORE_MATH_DIR}/transform_2d.cpp
    ${GODOT_CORE_MATH_DIR}/transform_2d.h
    ${GODOT_CORE_MATH_DIR}/transform_3d.cpp
    ${GODOT_CORE_MATH_DIR}/transform_3d.h
    ${GODOT_CORE_MATH_DIR}/triangle_mesh.cpp
    ${GODOT_CORE_MATH_DIR}/triangle_mesh.h
    ${GODOT_CORE_MATH_DIR}/triangulate.cpp
    ${GODOT_CORE_MATH_DIR}/triangulate.h
    ${GODOT_CORE_MATH_DIR}/vector2.cpp
    ${GODOT_CORE_MATH_DIR}/vector2.h
    ${GODOT_CORE_MATH_DIR}/vector2i.cpp
    ${GODOT_CORE_MATH_DIR}/vector2i.h
    ${GODOT_CORE_MATH_DIR}/vector3.cpp
    ${GODOT_CORE_MATH_DIR}/vector3.h
    ${GODOT_CORE_MATH_DIR}/vector3i.cpp
    ${GODOT_CORE_MATH_DIR}/vector3i.h
    ${GODOT_CORE_MATH_DIR}/vector4.cpp
    ${GODOT_CORE_MATH_DIR}/vector4.h
    ${GODOT_CORE_MATH_DIR}/vector4i.cpp
    ${GODOT_CORE_MATH_DIR}/vector4i.h
    )

add_library(godot-math STATIC ${GODOT_CORE_MATH_SOURCE})
target_include_directories(godot-math PUBLIC ${GODOT_ENGINE_ROOT_DIRECTORY})
target_link_libraries(godot-math PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-math)

####################################
#string
####################################
set(GODOT_CORE_STRING_DIR ${GODOT_CORE_BASE_DIR}/string)
set(GODOT_CORE_STRING_SOURCE
    ${GODOT_CORE_STRING_DIR}/char_range.inc
    ${GODOT_CORE_STRING_DIR}/char_utils.h
    ${GODOT_CORE_STRING_DIR}/locales.h
    ${GODOT_CORE_STRING_DIR}/node_path.cpp
    ${GODOT_CORE_STRING_DIR}/node_path.h
    ${GODOT_CORE_STRING_DIR}/optimized_translation.cpp
    ${GODOT_CORE_STRING_DIR}/optimized_translation.h
    ${GODOT_CORE_STRING_DIR}/print_string.cpp
    ${GODOT_CORE_STRING_DIR}/print_string.h
    ${GODOT_CORE_STRING_DIR}/SCsub
    ${GODOT_CORE_STRING_DIR}/string_buffer.h
    ${GODOT_CORE_STRING_DIR}/string_builder.cpp
    ${GODOT_CORE_STRING_DIR}/string_builder.h
    ${GODOT_CORE_STRING_DIR}/string_name.cpp
    ${GODOT_CORE_STRING_DIR}/string_name.h
    ${GODOT_CORE_STRING_DIR}/translation.cpp
    ${GODOT_CORE_STRING_DIR}/translation.h
    ${GODOT_CORE_STRING_DIR}/translation_po.cpp
    ${GODOT_CORE_STRING_DIR}/translation_po.h
    ${GODOT_CORE_STRING_DIR}/ucaps.h
    ${GODOT_CORE_STRING_DIR}/ustring.cpp
    ${GODOT_CORE_STRING_DIR}/ustring.h
    )
add_library(godot-string STATIC ${GODOT_CORE_STRING_SOURCE})
target_include_directories(godot-string PUBLIC ${GODOT_ENGINE_ROOT_DIRECTORY})
target_link_libraries(godot-string PUBLIC godot-object godot-thirdparty-misc)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-string)


####################################
#config
####################################
set(GODOT_CORE_CONFIG_DIR ${GODOT_CORE_BASE_DIR}/config)
set(GODOT_CORE_CONFIG_SOURCE
    ${GODOT_CORE_CONFIG_DIR}/engine.cpp
    ${GODOT_CORE_CONFIG_DIR}/engine.h
    ${GODOT_CORE_CONFIG_DIR}/project_settings.cpp
    ${GODOT_CORE_CONFIG_DIR}/project_settings.h
    )
add_library(godot-config STATIC ${GODOT_CORE_CONFIG_SOURCE})
target_link_libraries(godot-config PUBLIC godot-string godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-config)

####################################
#crypto
####################################
set(GODOT_CORE_CRYPTO_DIR ${GODOT_CORE_BASE_DIR}/crypto)
set(GODOT_CORE_CRYPTO_SOURCE
    ${GODOT_CORE_CRYPTO_DIR}/aes_context.cpp
    ${GODOT_CORE_CRYPTO_DIR}/aes_context.h
    ${GODOT_CORE_CRYPTO_DIR}/crypto_core.cpp
    ${GODOT_CORE_CRYPTO_DIR}/crypto_core.h
    ${GODOT_CORE_CRYPTO_DIR}/crypto.cpp
    ${GODOT_CORE_CRYPTO_DIR}/crypto.h
    ${GODOT_CORE_CRYPTO_DIR}/hashing_context.cpp
    ${GODOT_CORE_CRYPTO_DIR}/hashing_context.h
    )
add_library(godot-crypto STATIC ${GODOT_CORE_CRYPTO_SOURCE})
target_include_directories(godot-crypto PUBLIC ${GODOT_ENGINE_ROOT_DIRECTORY})
target_link_libraries(godot-crypto PUBLIC godot-object mbedtls)
target_include_directories(godot-crypto PRIVATE ${GODOT_FAKEGEN_ROOT_DIR})
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-crypto)

####################################
#debugger
####################################
set(GODOT_CORE_DEBUGGER_DIR ${GODOT_CORE_BASE_DIR}/debugger)
set(GODOT_CORE_DEBUGGER_SOURCE
    ${GODOT_CORE_DEBUGGER_DIR}/debugger_marshalls.cpp
    ${GODOT_CORE_DEBUGGER_DIR}/debugger_marshalls.h
    ${GODOT_CORE_DEBUGGER_DIR}/engine_debugger.cpp
    ${GODOT_CORE_DEBUGGER_DIR}/engine_debugger.h
    ${GODOT_CORE_DEBUGGER_DIR}/engine_profiler.cpp
    ${GODOT_CORE_DEBUGGER_DIR}/engine_profiler.h
    ${GODOT_CORE_DEBUGGER_DIR}/local_debugger.cpp
    ${GODOT_CORE_DEBUGGER_DIR}/local_debugger.h
    ${GODOT_CORE_DEBUGGER_DIR}/remote_debugger.cpp
    ${GODOT_CORE_DEBUGGER_DIR}/remote_debugger.h
    ${GODOT_CORE_DEBUGGER_DIR}/remote_debugger_peer.cpp
    ${GODOT_CORE_DEBUGGER_DIR}/remote_debugger_peer.h
    ${GODOT_CORE_DEBUGGER_DIR}/script_debugger.cpp
    ${GODOT_CORE_DEBUGGER_DIR}/script_debugger.h
    )
add_library(godot-debugger STATIC ${GODOT_CORE_DEBUGGER_SOURCE})
target_link_libraries(godot-debugger PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-debugger)

####################################
#error
####################################
set(GODOT_CORE_ERROR_DIR ${GODOT_CORE_BASE_DIR}/error)
set(GODOT_CORE_ERROR_SOURCE
    ${GODOT_CORE_ERROR_DIR}/error_list.cpp
    ${GODOT_CORE_ERROR_DIR}/error_list.h
    ${GODOT_CORE_ERROR_DIR}/error_macros.cpp
    ${GODOT_CORE_ERROR_DIR}/error_macros.h
)
add_library(godot-error STATIC ${GODOT_CORE_ERROR_SOURCE})
target_link_libraries(godot-error PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-error)

####################################
#extension
####################################
set(GODOT_CORE_EXTENSION_DIR ${GODOT_CORE_BASE_DIR}/extension)
set(GODOT_CORE_EXTENSION_SOURCE
    ${GODOT_CORE_EXTENSION_DIR}/extension_api_dump.cpp
    ${GODOT_CORE_EXTENSION_DIR}/extension_api_dump.h
    ${GODOT_CORE_EXTENSION_DIR}/gdextension.cpp
    ${GODOT_CORE_EXTENSION_DIR}/gdextension.h
    ${GODOT_CORE_EXTENSION_DIR}/gdextension_interface.cpp
    ${GODOT_CORE_EXTENSION_DIR}/gdextension_interface.h
    ${GODOT_CORE_EXTENSION_DIR}/gdextension_manager.cpp
    ${GODOT_CORE_EXTENSION_DIR}/gdextension_manager.h
    )
add_library(godot-extension STATIC ${GODOT_CORE_EXTENSION_SOURCE})
target_link_libraries(godot-extension PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-extension)

####################################
#input
####################################
set(GODOT_CORE_INPUT_DIR ${GODOT_CORE_BASE_DIR}/input)
set(GODOT_CORE_INPUT_SOURCE
    ${GODOT_CORE_INPUT_DIR}/input.cpp
    ${GODOT_CORE_INPUT_DIR}/input_enums.h
    ${GODOT_CORE_INPUT_DIR}/input_event.cpp
    ${GODOT_CORE_INPUT_DIR}/input_event.h
    ${GODOT_CORE_INPUT_DIR}/input.h
    ${GODOT_CORE_INPUT_DIR}/input_map.cpp
    ${GODOT_CORE_INPUT_DIR}/input_map.h
    ${GODOT_CORE_INPUT_DIR}/shortcut.cpp
    ${GODOT_CORE_INPUT_DIR}/shortcut.h
    )
add_library(godot-input STATIC ${GODOT_CORE_INPUT_SOURCE})
target_link_libraries(godot-input PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-input)

####################################
#templates
####################################
set(GODOT_CORE_TEMPLATES_DIR ${GODOT_CORE_BASE_DIR}/templates)
set(GODOT_CORE_TEMPLATES_SOURCE
    ${GODOT_CORE_TEMPLATES_DIR}/bin_sorted_array.h
    ${GODOT_CORE_TEMPLATES_DIR}/command_queue_mt.cpp
    ${GODOT_CORE_TEMPLATES_DIR}/command_queue_mt.h
    ${GODOT_CORE_TEMPLATES_DIR}/cowdata.h
    ${GODOT_CORE_TEMPLATES_DIR}/hashfuncs.h
    ${GODOT_CORE_TEMPLATES_DIR}/hash_map.h
    ${GODOT_CORE_TEMPLATES_DIR}/hash_set.h
    ${GODOT_CORE_TEMPLATES_DIR}/list.h
    ${GODOT_CORE_TEMPLATES_DIR}/local_vector.h
    ${GODOT_CORE_TEMPLATES_DIR}/lru.h
    ${GODOT_CORE_TEMPLATES_DIR}/oa_hash_map.h
    ${GODOT_CORE_TEMPLATES_DIR}/paged_allocator.h
    ${GODOT_CORE_TEMPLATES_DIR}/paged_array.h
    ${GODOT_CORE_TEMPLATES_DIR}/pair.h
    ${GODOT_CORE_TEMPLATES_DIR}/pass_func.h
    ${GODOT_CORE_TEMPLATES_DIR}/pooled_list.h
    ${GODOT_CORE_TEMPLATES_DIR}/rb_map.h
    ${GODOT_CORE_TEMPLATES_DIR}/rb_set.h
    ${GODOT_CORE_TEMPLATES_DIR}/rid.h
    ${GODOT_CORE_TEMPLATES_DIR}/rid_owner.cpp
    ${GODOT_CORE_TEMPLATES_DIR}/rid_owner.h
    ${GODOT_CORE_TEMPLATES_DIR}/ring_buffer.h
    ${GODOT_CORE_TEMPLATES_DIR}/safe_list.h
    ${GODOT_CORE_TEMPLATES_DIR}/safe_refcount.h
    ${GODOT_CORE_TEMPLATES_DIR}/SCsub
    ${GODOT_CORE_TEMPLATES_DIR}/search_array.h
    ${GODOT_CORE_TEMPLATES_DIR}/self_list.h
    ${GODOT_CORE_TEMPLATES_DIR}/simple_type.h
    ${GODOT_CORE_TEMPLATES_DIR}/sort_array.h
    ${GODOT_CORE_TEMPLATES_DIR}/vector.h
    ${GODOT_CORE_TEMPLATES_DIR}/vmap.h
    ${GODOT_CORE_TEMPLATES_DIR}/vset.h
    )
add_library(godot-templates STATIC ${GODOT_CORE_TEMPLATES_SOURCE})
target_link_libraries(godot-templates PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-templates)

####################################
#io
####################################
set(GODOT_CORE_IO_DIR ${GODOT_CORE_BASE_DIR}/io)
set(GODOT_CORE_IO_SOURCE
    ${GODOT_CORE_IO_DIR}/compression.cpp
    ${GODOT_CORE_IO_DIR}/compression.h
    ${GODOT_CORE_IO_DIR}/config_file.cpp
    ${GODOT_CORE_IO_DIR}/config_file.h
    ${GODOT_CORE_IO_DIR}/dir_access.cpp
    ${GODOT_CORE_IO_DIR}/dir_access.h
    ${GODOT_CORE_IO_DIR}/dtls_server.cpp
    ${GODOT_CORE_IO_DIR}/dtls_server.h
    ${GODOT_CORE_IO_DIR}/file_access_compressed.cpp
    ${GODOT_CORE_IO_DIR}/file_access_compressed.h
    ${GODOT_CORE_IO_DIR}/file_access.cpp
    ${GODOT_CORE_IO_DIR}/file_access_encrypted.cpp
    ${GODOT_CORE_IO_DIR}/file_access_encrypted.h
    ${GODOT_CORE_IO_DIR}/file_access.h
    ${GODOT_CORE_IO_DIR}/file_access_memory.cpp
    ${GODOT_CORE_IO_DIR}/file_access_memory.h
    ${GODOT_CORE_IO_DIR}/file_access_network.cpp
    ${GODOT_CORE_IO_DIR}/file_access_network.h
    ${GODOT_CORE_IO_DIR}/file_access_pack.cpp
    ${GODOT_CORE_IO_DIR}/file_access_pack.h
    ${GODOT_CORE_IO_DIR}/file_access_zip.cpp
    ${GODOT_CORE_IO_DIR}/file_access_zip.h
    ${GODOT_CORE_IO_DIR}/http_client.cpp
    ${GODOT_CORE_IO_DIR}/http_client.h
    ${GODOT_CORE_IO_DIR}/http_client_tcp.cpp
    ${GODOT_CORE_IO_DIR}/http_client_tcp.h
    ${GODOT_CORE_IO_DIR}/image.cpp
    ${GODOT_CORE_IO_DIR}/image.h
    ${GODOT_CORE_IO_DIR}/image_loader.cpp
    ${GODOT_CORE_IO_DIR}/image_loader.h
    ${GODOT_CORE_IO_DIR}/ip_address.cpp
    ${GODOT_CORE_IO_DIR}/ip_address.h
    ${GODOT_CORE_IO_DIR}/ip.cpp
    ${GODOT_CORE_IO_DIR}/ip.h
    ${GODOT_CORE_IO_DIR}/json.cpp
    ${GODOT_CORE_IO_DIR}/json.h
    ${GODOT_CORE_IO_DIR}/logger.cpp
    ${GODOT_CORE_IO_DIR}/logger.h
    ${GODOT_CORE_IO_DIR}/marshalls.cpp
    ${GODOT_CORE_IO_DIR}/marshalls.h
    ${GODOT_CORE_IO_DIR}/missing_resource.cpp
    ${GODOT_CORE_IO_DIR}/missing_resource.h
    ${GODOT_CORE_IO_DIR}/net_socket.cpp
    ${GODOT_CORE_IO_DIR}/net_socket.h
    ${GODOT_CORE_IO_DIR}/packed_data_container.cpp
    ${GODOT_CORE_IO_DIR}/packed_data_container.h
    ${GODOT_CORE_IO_DIR}/packet_peer.cpp
    ${GODOT_CORE_IO_DIR}/packet_peer_dtls.cpp
    ${GODOT_CORE_IO_DIR}/packet_peer_dtls.h
    ${GODOT_CORE_IO_DIR}/packet_peer.h
    ${GODOT_CORE_IO_DIR}/packet_peer_udp.cpp
    ${GODOT_CORE_IO_DIR}/packet_peer_udp.h
    ${GODOT_CORE_IO_DIR}/pck_packer.cpp
    ${GODOT_CORE_IO_DIR}/pck_packer.h
    ${GODOT_CORE_IO_DIR}/resource.cpp
    ${GODOT_CORE_IO_DIR}/resource_format_binary.cpp
    ${GODOT_CORE_IO_DIR}/resource_format_binary.h
    ${GODOT_CORE_IO_DIR}/resource.h
    ${GODOT_CORE_IO_DIR}/resource_importer.cpp
    ${GODOT_CORE_IO_DIR}/resource_importer.h
    ${GODOT_CORE_IO_DIR}/resource_loader.cpp
    ${GODOT_CORE_IO_DIR}/resource_loader.h
    ${GODOT_CORE_IO_DIR}/resource_saver.cpp
    ${GODOT_CORE_IO_DIR}/resource_saver.h
    ${GODOT_CORE_IO_DIR}/resource_uid.cpp
    ${GODOT_CORE_IO_DIR}/resource_uid.h
    ${GODOT_CORE_IO_DIR}/SCsub
    ${GODOT_CORE_IO_DIR}/stream_peer.cpp
    ${GODOT_CORE_IO_DIR}/stream_peer_gzip.cpp
    ${GODOT_CORE_IO_DIR}/stream_peer_gzip.h
    ${GODOT_CORE_IO_DIR}/stream_peer.h
    ${GODOT_CORE_IO_DIR}/stream_peer_tcp.cpp
    ${GODOT_CORE_IO_DIR}/stream_peer_tcp.h
    ${GODOT_CORE_IO_DIR}/stream_peer_tls.cpp
    ${GODOT_CORE_IO_DIR}/stream_peer_tls.h
    ${GODOT_CORE_IO_DIR}/tcp_server.cpp
    ${GODOT_CORE_IO_DIR}/tcp_server.h
    ${GODOT_CORE_IO_DIR}/translation_loader_po.cpp
    ${GODOT_CORE_IO_DIR}/translation_loader_po.h
    ${GODOT_CORE_IO_DIR}/udp_server.cpp
    ${GODOT_CORE_IO_DIR}/udp_server.h
    ${GODOT_CORE_IO_DIR}/xml_parser.cpp
    ${GODOT_CORE_IO_DIR}/xml_parser.h
    ${GODOT_CORE_IO_DIR}/zip_io.cpp
    ${GODOT_CORE_IO_DIR}/zip_io.h
    )
add_library(godot-io STATIC ${GODOT_CORE_IO_SOURCE})
target_link_libraries(godot-io PUBLIC godot-object zstd godot-templates godot-string)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-io)

####################################
#os
####################################
set(GODOT_CORE_OS_DIR ${GODOT_CORE_BASE_DIR}/os)
set(GODOT_CORE_OS_SOURCE
    ${GODOT_CORE_OS_DIR}/keyboard.cpp
    ${GODOT_CORE_OS_DIR}/keyboard.h
    ${GODOT_CORE_OS_DIR}/main_loop.cpp
    ${GODOT_CORE_OS_DIR}/main_loop.h
    ${GODOT_CORE_OS_DIR}/memory.cpp
    ${GODOT_CORE_OS_DIR}/memory.h
    ${GODOT_CORE_OS_DIR}/midi_driver.cpp
    ${GODOT_CORE_OS_DIR}/midi_driver.h
    ${GODOT_CORE_OS_DIR}/mutex.cpp
    ${GODOT_CORE_OS_DIR}/mutex.h
    ${GODOT_CORE_OS_DIR}/os.cpp
    ${GODOT_CORE_OS_DIR}/os.h
    ${GODOT_CORE_OS_DIR}/pool_allocator.cpp
    ${GODOT_CORE_OS_DIR}/pool_allocator.h
    ${GODOT_CORE_OS_DIR}/rw_lock.h
    ${GODOT_CORE_OS_DIR}/semaphore.h
    ${GODOT_CORE_OS_DIR}/spin_lock.h
    ${GODOT_CORE_OS_DIR}/thread.cpp
    ${GODOT_CORE_OS_DIR}/threaded_array_processor.h
    ${GODOT_CORE_OS_DIR}/thread.h
    ${GODOT_CORE_OS_DIR}/thread_safe.h
    ${GODOT_CORE_OS_DIR}/time.cpp
    ${GODOT_CORE_OS_DIR}/time_enums.h
    ${GODOT_CORE_OS_DIR}/time.h
    )

add_library(godot-os STATIC ${GODOT_CORE_OS_SOURCE})
target_link_libraries(godot-os PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-os)

####################################
#variant
####################################
set(GODOT_CORE_VARIANT_DIR ${GODOT_CORE_BASE_DIR}/variant)
set(GODOT_CORE_VARIANT_SOURCE
    ${GODOT_CORE_VARIANT_DIR}/array.cpp
    ${GODOT_CORE_VARIANT_DIR}/array.h
    ${GODOT_CORE_VARIANT_DIR}/binder_common.h
    ${GODOT_CORE_VARIANT_DIR}/callable_bind.cpp
    ${GODOT_CORE_VARIANT_DIR}/callable_bind.h
    ${GODOT_CORE_VARIANT_DIR}/callable.cpp
    ${GODOT_CORE_VARIANT_DIR}/callable.h
    ${GODOT_CORE_VARIANT_DIR}/container_type_validate.h
    ${GODOT_CORE_VARIANT_DIR}/dictionary.cpp
    ${GODOT_CORE_VARIANT_DIR}/dictionary.h
    ${GODOT_CORE_VARIANT_DIR}/method_ptrcall.h
    ${GODOT_CORE_VARIANT_DIR}/native_ptr.h
    ${GODOT_CORE_VARIANT_DIR}/SCsub
    ${GODOT_CORE_VARIANT_DIR}/typed_array.h
    ${GODOT_CORE_VARIANT_DIR}/type_info.h
    ${GODOT_CORE_VARIANT_DIR}/variant_call.cpp
    ${GODOT_CORE_VARIANT_DIR}/variant_construct.cpp
    ${GODOT_CORE_VARIANT_DIR}/variant_construct.h
    ${GODOT_CORE_VARIANT_DIR}/variant.cpp
    ${GODOT_CORE_VARIANT_DIR}/variant_destruct.cpp
    ${GODOT_CORE_VARIANT_DIR}/variant_destruct.h
    ${GODOT_CORE_VARIANT_DIR}/variant.h
    ${GODOT_CORE_VARIANT_DIR}/variant_internal.h
    ${GODOT_CORE_VARIANT_DIR}/variant_op.cpp
    ${GODOT_CORE_VARIANT_DIR}/variant_op.h
    ${GODOT_CORE_VARIANT_DIR}/variant_parser.cpp
    ${GODOT_CORE_VARIANT_DIR}/variant_parser.h
    ${GODOT_CORE_VARIANT_DIR}/variant_setget.cpp
    ${GODOT_CORE_VARIANT_DIR}/variant_setget.h
    ${GODOT_CORE_VARIANT_DIR}/variant_utility.cpp
    )
add_library(godot-variant STATIC ${GODOT_CORE_VARIANT_SOURCE})
target_link_libraries(godot-variant PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-variant)

####################################
#core
####################################
set(GODOT_CORE_SOURCE
    ${GODOT_CORE_BASE_DIR}/core_bind.h
    ${GODOT_CORE_BASE_DIR}/core_constants.h
    ${GODOT_CORE_BASE_DIR}/core_globals.h
    ${GODOT_CORE_BASE_DIR}/core_string_names.h
    ${GODOT_CORE_BASE_DIR}/doc_data.h
    ${GODOT_CORE_BASE_DIR}/register_core_types.h
    ${GODOT_CORE_BASE_DIR}/typedefs.h
    ${GODOT_CORE_BASE_DIR}/version.h
    ${GODOT_CORE_BASE_DIR}/core_bind.cpp
    ${GODOT_CORE_BASE_DIR}/core_constants.cpp
    ${GODOT_CORE_BASE_DIR}/core_globals.cpp
    ${GODOT_CORE_BASE_DIR}/core_string_names.cpp
    ${GODOT_CORE_BASE_DIR}/doc_data.cpp
    ${GODOT_CORE_BASE_DIR}/register_core_types.cpp
    )
add_library(godot-core STATIC ${GODOT_CORE_SOURCE})
target_link_libraries(godot-core PUBLIC godot-object)
list(APPEND GODOT_CORE_LIBRARIES_INTERNAL godot-core)

#Apply it to the higher level cmake file
set(GODOT_CORE_LIBRARIES ${GODOT_CORE_LIBRARIES_INTERNAL} PARENT_SCOPE)
