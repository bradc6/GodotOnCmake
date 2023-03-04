#Godot buildsystem via Cmake
#Read README.md for details

####################################
#Step 1: Get options and set base directories
####################################
option(GODOT_ENGINE_ROOT_DIRECTORY "Set the absolute directory path to base building from")
if(GODOT_ENGINE_ROOT_DIRECTORY STREQUAL "")
  message(FATAL_ERROR "Missing GodotEngine root directory path")
endif()

#HACK - This should not exist
set(GODOT_FAKEGEN_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../FakeGen" CACHE STRING "Here is the FakeGen to share" FORCE)


####################################
#Step 2: Add any custom modules
####################################
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/modules")

#Find required tools
find_package(Python3 COMPONENTS Interpreter)
message("Found Python3 Interpreter: ${Python3_EXECUTABLE}")
include(GodotGenerators.cmake)

####################################
#Step 3: Set some basic common locations
####################################


####################################
#Step 4: Centralize platform detection
####################################
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  include(LinuxPlatformDetection.cmake)
endif()

####################################
#Step 5: Generate the actual project
####################################
set(GODOT_ROOT_CMAKE_DIR ${CMAKE_CURRENT_LIST_DIR})

#These are used to collect all the library targets in a list
set(GODOT_THIRD_PARTY_LIBRARIES CACHE STRING "All the thirdparty libraries" FORCE)
set(GODOT_DRIVER_LIBRARIES CACHE STRING "All the driver libraries" FORCE)
set(GODOT_EDITOR_LIBRARIES CACHE STRING "All the editor libraries" FORCE)
set(GODOT_PLATFORM_LIBRARIES CACHE STRING "All the platform libraries" FORCE)
set(GODOT_CORE_LIBRARIES CACHE STRING "All the godot core library targets" FORCE)
set(GODOT_SERVER_LIBRARIES CACHE STRING "All the server libraries" FORCE)
set(GODOT_SCENE_LIBRARIES CACHE STRING "All the scene libraries" FORCE)
set(GODOT_MODULE_LIBRARIES CACHE STRING "All the module libraries" FORCE)

#Bring in the third party libraries
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/thirdparty)

#Bring in the base operating system platform
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/platform)

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

#message("#######################")
#message("${GODOT_CORE_LIBRARIES}")
#message("${GODOT_THIRD_PARTY_LIBRARIES}")
#message("${GODOT_DRIVER_LIBRARIES}")
#message("${GODOT_SERVER_LIBRARIES}")
#message("${GODOT_MODULE_LIBRARIES}")
#message("${GODOT_PLATFORM_LIBRARIES}")
#message("${GODOT_SCENE_LIBRARIES}")
#message("${GODOT_EDITOR_LIBRARIES}")
#message("#######################")

#And the start of the show
add_subdirectory(${GODOT_ROOT_CMAKE_DIR}/main)
