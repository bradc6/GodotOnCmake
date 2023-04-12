#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(MINIUPNPC_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/miniupnpc)
set(MINIUPNPC_SOURCE
    ${MINIUPNPC_SOURCE_DIR}/include/upnpcommands.h
    ${MINIUPNPC_SOURCE_DIR}/include/miniupnpc_declspec.h
    ${MINIUPNPC_SOURCE_DIR}/include/miniwget.h
    ${MINIUPNPC_SOURCE_DIR}/include/portlistingparse.h
    ${MINIUPNPC_SOURCE_DIR}/include/upnpreplyparse.h
    ${MINIUPNPC_SOURCE_DIR}/include/miniupnpctypes.h
    ${MINIUPNPC_SOURCE_DIR}/include/igd_desc_parse.h
    ${MINIUPNPC_SOURCE_DIR}/include/upnpdev.h
    ${MINIUPNPC_SOURCE_DIR}/include/miniupnpc.h
    ${MINIUPNPC_SOURCE_DIR}/src/miniupnpcstrings.h
    ${MINIUPNPC_SOURCE_DIR}/src/minisoap.h
    ${MINIUPNPC_SOURCE_DIR}/src/minissdpc.c
    ${MINIUPNPC_SOURCE_DIR}/src/addr_is_reserved.c
    ${MINIUPNPC_SOURCE_DIR}/src/minissdpc.h
    ${MINIUPNPC_SOURCE_DIR}/src/minixml.c
    #${MINIUPNPC_SOURCE_DIR}/src/minixmlvalid.c
    ${MINIUPNPC_SOURCE_DIR}/src/miniupnpc_socketdef.h
    ${MINIUPNPC_SOURCE_DIR}/src/miniwget_private.h
    ${MINIUPNPC_SOURCE_DIR}/src/connecthostport.h
    ${MINIUPNPC_SOURCE_DIR}/src/addr_is_reserved.h
    ${MINIUPNPC_SOURCE_DIR}/src/upnpcommands.c
    ${MINIUPNPC_SOURCE_DIR}/src/portlistingparse.c
    ${MINIUPNPC_SOURCE_DIR}/src/igd_desc_parse.c
    ${MINIUPNPC_SOURCE_DIR}/src/minisoap.c
    ${MINIUPNPC_SOURCE_DIR}/src/receivedata.c
    ${MINIUPNPC_SOURCE_DIR}/src/upnpreplyparse.c
    ${MINIUPNPC_SOURCE_DIR}/src/codelength.h
    ${MINIUPNPC_SOURCE_DIR}/src/win32_snprintf.h
    ${MINIUPNPC_SOURCE_DIR}/src/upnpdev.c
    ${MINIUPNPC_SOURCE_DIR}/src/minixml.h
    ${MINIUPNPC_SOURCE_DIR}/src/miniwget.c
    ${MINIUPNPC_SOURCE_DIR}/src/receivedata.h
    ${MINIUPNPC_SOURCE_DIR}/src/miniupnpc.c
    ${MINIUPNPC_SOURCE_DIR}/src/connecthostport.c
    )
godot_add_library(miniupnpc thirdparty STATIC ${MINIUPNPC_SOURCE})
target_link_libraries(miniupnpc godot-core)
target_include_directories(miniupnpc PUBLIC ${MINIUPNPC_SOURCE_DIR}/include)
target_compile_definitions(miniupnpc PUBLIC MINIUPNP_STATICLIB MINIUPNPC_SET_SOCKET_TIMEOUT)
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_link_libraries(miniupnpc iphlpapi)
endif()
