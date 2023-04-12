#Godot buildsystem via Cmake
#Read README.md for details

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

####################################
#Step 1: Get options and set base directories
####################################
option(GODOT_ENGINE_ROOT_DIRECTORY "Set the absolute directory path to base building from")
if(GODOT_ENGINE_ROOT_DIRECTORY STREQUAL "")
  message(FATAL_ERROR "Missing GodotEngine root directory path")
endif()

option(GODOT_EXTERNAL_EDITOR_MODULES "Target names that should be linked into the editor")
option(GODOT_EXTERNAL_RUNTIME_MODULES "Target names that should be linked into runtimes (including the editor)")

set(CMAKE_BINARY_INCLUDE_DIR ${CMAKE_BINARY_DIR}/include)
set(GODOT_SOURCE_ROOT_THIRDPARTY_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/thirdparty)
set(GODOT_MODULES_BASE_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/modules)

####################################
#Step 2: Add any custom modules
####################################
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/modules")

#Find required tools
find_package(Python3 COMPONENTS Interpreter)
message("Found Python3 Interpreter: ${Python3_EXECUTABLE}")
include(GodotGenerators.cmake)
include(Godot.cmake)

####################################
#Step 3: Set some basic common locations
####################################

####################################
#Step 4: Generate the actual project
####################################
set(GODOT_ROOT_CMAKE_DIR ${CMAKE_CURRENT_LIST_DIR})

#These are used to collect all the library targets in a list
set(GODOT_LIBRARIES CACHE STRING "All the godot library targets" FORCE)

#Bring in the base operating system platform
set(GODOT_SOURCE_ROOT_PLATFORM_DIR ${GODOT_ENGINE_ROOT_DIRECTORY}/platform)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	include(LinuxPlatform.cmake)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	include(WindowsPlatform.cmake)
endif()

# *Platform.cmake files define what packages are wanted
if (${WANT_VULKAN})
	if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
		find_package(Vulkan)
	else()
		# Windows relies on Volk alone.
		set(VULKAN_FOUND 1)
	endif()
endif()

if (${WANT_OPENGL})
	find_package(OpenGL)
endif()

if (${WANT_DBUS})
	find_package(DBUS)
endif()

if (${WANT_ALSA})
	find_package(ALSA)
endif()

if (${WANT_PULSEAUDIO})
	find_package(PulseAudio)
endif()

if (${WANT_X11})
	find_package(X11)
endif()

if (${WANT_FONTCONFIG})
	find_package(Fontconfig)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/platform/linux)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/platform/windows)
endif()

#Bring in the third party libraries
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/thirdparty)

#Bring in the component drivers
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/drivers)

#Bring in the core
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/core)

#Bring in the server (aka game components)
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/servers)

#Bring in the scene system
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/scene)

#Get all the engine modules together
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/modules)

#Get all the engine modules together
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/editor)

#And the start of the show
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/main)
