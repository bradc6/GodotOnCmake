#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(GRAPHITE_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/graphite)
set(GRAPHITE_SOURCE
    ${GRAPHITE_SOURCE_DIR}/include/graphite2/Log.h
    ${GRAPHITE_SOURCE_DIR}/include/graphite2/Font.h
    ${GRAPHITE_SOURCE_DIR}/include/graphite2/Types.h
    ${GRAPHITE_SOURCE_DIR}/include/graphite2/Segment.h
    ${GRAPHITE_SOURCE_DIR}/src/gr_char_info.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Font.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Slot.cpp
    ${GRAPHITE_SOURCE_DIR}/src/CmapCache.cpp
    ${GRAPHITE_SOURCE_DIR}/src/gr_face.cpp
    ${GRAPHITE_SOURCE_DIR}/src/gr_slot.cpp
    ${GRAPHITE_SOURCE_DIR}/src/FileFace.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Decompressor.cpp
    ${GRAPHITE_SOURCE_DIR}/src/gr_font.cpp
    ${GRAPHITE_SOURCE_DIR}/src/UtfCodec.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Face.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Intervals.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Sparse.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Collider.cpp
    ${GRAPHITE_SOURCE_DIR}/src/TtfUtil.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Code.cpp
    ${GRAPHITE_SOURCE_DIR}/src/GlyphFace.cpp
    ${GRAPHITE_SOURCE_DIR}/src/gr_segment.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Pass.cpp
    ${GRAPHITE_SOURCE_DIR}/src/inc/json.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/List.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/UtfCodec.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/NameTable.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Compression.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Code.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Face.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Font.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Collider.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Machine.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Main.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Endian.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Decompressor.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/FileFace.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/locale2lcid.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/bits.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/GlyphFace.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/GlyphCache.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/opcode_table.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/TtfTypes.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Error.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/CharInfo.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/opcodes.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/FeatureVal.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Sparse.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Pass.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Rule.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/CmapCache.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Position.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Silf.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/debug.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Intervals.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Slot.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/FeatureMap.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/TtfUtil.h
    ${GRAPHITE_SOURCE_DIR}/src/inc/Segment.h
    ${GRAPHITE_SOURCE_DIR}/src/json.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Silf.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Position.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Segment.cpp
    ${GRAPHITE_SOURCE_DIR}/src/FeatureMap.cpp
    ${GRAPHITE_SOURCE_DIR}/src/Justifier.cpp
    ${GRAPHITE_SOURCE_DIR}/src/gr_features.cpp
    ${GRAPHITE_SOURCE_DIR}/src/GlyphCache.cpp
    ${GRAPHITE_SOURCE_DIR}/src/gr_logging.cpp
    ${GRAPHITE_SOURCE_DIR}/src/NameTable.cpp
    )
if((${CMAKE_SYSTEM_NAME} STREQUAL "Windows") AND (${MSVC}))
    set(GRAPHITE_SOURCE ${GRAPHITE_SOURCE} ${GRAPHITE_SOURCE_DIR}/src/call_machine.cpp)
else()
    set(GRAPHITE_SOURCE ${GRAPHITE_SOURCE} ${GRAPHITE_SOURCE_DIR}/src/direct_machine.cpp)
endif()
godot_add_library(graphite thirdparty STATIC ${GRAPHITE_SOURCE})
target_include_directories(graphite PUBLIC ${GRAPHITE_SOURCE_DIR}/include)
target_include_directories(graphite PRIVATE ${GRAPHITE_SOURCE_DIR}/src)

