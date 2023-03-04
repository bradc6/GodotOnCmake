#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GODOT_MAIN_BASE_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/main)

#####################################
#Main Executables
####################################
set(MAIN_EXECUTABLE_SOURCE
	${GODOT_MAIN_BASE_DIR}/main.h
	${GODOT_MAIN_BASE_DIR}/main_timer_sync.h
	${GODOT_MAIN_BASE_DIR}/performance.h
	${GODOT_MAIN_BASE_DIR}/main.cpp
	${GODOT_MAIN_BASE_DIR}/main_timer_sync.cpp
	${GODOT_MAIN_BASE_DIR}/performance.cpp
	)

#####################################
#HACK - Throw all the fakegen stuff here
####################################
set(FAKEGEN_SOURCE
	${GODOT_FAKEGEN_ROOT_DIR}/core/script_encryption_key.gen.cpp
	${GODOT_FAKEGEN_ROOT_DIR}/core/version_hash.gen.cpp
	${GODOT_FAKEGEN_ROOT_DIR}/editor/register_exporters.gen.cpp
	${GODOT_FAKEGEN_ROOT_DIR}/modules/register_module_types.gen.cpp
	${GODOT_FAKEGEN_ROOT_DIR}/platform/register_platform_apis.gen.cpp
	${GODOT_FAKEGEN_ROOT_DIR}/core/input/default_controller_mappings.gen.cpp

	)

 add_executable(GodotEditor ${MAIN_EXECUTABLE_SOURCE} ${FAKEGEN_SOURCE})
 target_link_libraries(GodotEditor PUBLIC
 									${GODOT_CORE_LIBRARIES} #All the core godot libraries
 									${GODOT_THIRD_PARTY_LIBRARIES} #Thirdparty
 									${GODOT_DRIVER_LIBRARIES} #Drivers
 									${GODOT_SERVER_LIBRARIES} #Servers
 									${GODOT_MODULE_LIBRARIES} #Modules
 									${GODOT_PLATFORM_LIBRARIES} #Platform
 									${GODOT_SCENE_LIBRARIES} #Scene
 									${GODOT_EDITOR_LIBRARIES} #Editor
 									)
 target_compile_definitions(GodotEditor PUBLIC NO_EDITOR_SPLASH=1)

#####################################
#HACK - fakegen includes
####################################
target_include_directories(GodotEditor PUBLIC
									   ${GODOT_ENGINE_ROOT_DIRECTORY}/modules
									   ${GODOT_ENGINE_ROOT_DIRECTORY}/editor
									   ${GODOT_ENGINE_ROOT_DIRECTORY}/platform
									   )