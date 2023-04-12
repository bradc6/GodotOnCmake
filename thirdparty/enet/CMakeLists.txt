set(ENET_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/enet)
set(ENET_SOURCE
    ${ENET_SOURCE_DIR}/callbacks.c
    ${ENET_SOURCE_DIR}/compress.c
    ${ENET_SOURCE_DIR}/enet/godot_ext.h
    ${ENET_SOURCE_DIR}/enet/time.h
    ${ENET_SOURCE_DIR}/enet/callbacks.h
    ${ENET_SOURCE_DIR}/enet/godot.h
    ${ENET_SOURCE_DIR}/enet/list.h
    ${ENET_SOURCE_DIR}/enet/types.h
    ${ENET_SOURCE_DIR}/enet/enet.h
    ${ENET_SOURCE_DIR}/enet/protocol.h
    ${ENET_SOURCE_DIR}/enet/utility.h
    #TODO - THIS needs to be in the engine target
    #${ENET_SOURCE_DIR}/godot.cpp
    ${ENET_SOURCE_DIR}/host.c
    ${ENET_SOURCE_DIR}/list.c
    ${ENET_SOURCE_DIR}/packet.c
    ${ENET_SOURCE_DIR}/patches/godot_socket.patch
    ${ENET_SOURCE_DIR}/peer.c
    ${ENET_SOURCE_DIR}/protocol.c
    )
godot_add_library(enet thirdparty STATIC ${ENET_SOURCE})
target_include_directories(enet PUBLIC ${ENET_SOURCE_DIR})
target_compile_definitions(enet PUBLIC GODOT_ENET=1)
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_link_libraries(enet ws2_32)
endif()
target_compile_options(enet PRIVATE -w)
