#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

# Godot comments out a lot of theora files since most games don't care about encoding.

set(LIBTHEORA_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/libtheora)
set(LIBTHEORA_SOURCE
    # ${LIBTHEORA_SOURCE_DIR}/analyze.c
    # ${LIBTHEORA_SOURCE_DIR}/apiwrapper.c
    ${LIBTHEORA_SOURCE_DIR}/apiwrapper.h
    ${LIBTHEORA_SOURCE_DIR}/bitpack.c
    ${LIBTHEORA_SOURCE_DIR}/bitpack.h
    # ${LIBTHEORA_SOURCE_DIR}/collect.c
    ${LIBTHEORA_SOURCE_DIR}/collect.h
    ${LIBTHEORA_SOURCE_DIR}/dct.h
    # ${LIBTHEORA_SOURCE_DIR}/decapiwrapper.c
    ${LIBTHEORA_SOURCE_DIR}/decinfo.c
    ${LIBTHEORA_SOURCE_DIR}/decint.h
    ${LIBTHEORA_SOURCE_DIR}/decode.c
    ${LIBTHEORA_SOURCE_DIR}/dequant.c
    ${LIBTHEORA_SOURCE_DIR}/dequant.h
    # ${LIBTHEORA_SOURCE_DIR}/encapiwrapper.c
    # ${LIBTHEORA_SOURCE_DIR}/encfrag.c
    # ${LIBTHEORA_SOURCE_DIR}/encinfo.c
    ${LIBTHEORA_SOURCE_DIR}/encint.h
    # ${LIBTHEORA_SOURCE_DIR}/encode.c
    # ${LIBTHEORA_SOURCE_DIR}/encoder_disabled.c
    # ${LIBTHEORA_SOURCE_DIR}/enquant.c
    ${LIBTHEORA_SOURCE_DIR}/enquant.h
    # ${LIBTHEORA_SOURCE_DIR}/fdct.c
    ${LIBTHEORA_SOURCE_DIR}/fragment.c
    ${LIBTHEORA_SOURCE_DIR}/huffdec.c
    ${LIBTHEORA_SOURCE_DIR}/huffdec.h
    # ${LIBTHEORA_SOURCE_DIR}/huffenc.c
    ${LIBTHEORA_SOURCE_DIR}/huffenc.h
    ${LIBTHEORA_SOURCE_DIR}/huffman.h
    ${LIBTHEORA_SOURCE_DIR}/idct.c
    ${LIBTHEORA_SOURCE_DIR}/info.c
    ${LIBTHEORA_SOURCE_DIR}/internal.c
    ${LIBTHEORA_SOURCE_DIR}/internal.h
    # ${LIBTHEORA_SOURCE_DIR}/mathops.c
    ${LIBTHEORA_SOURCE_DIR}/mathops.h
    # ${LIBTHEORA_SOURCE_DIR}/mcenc.c
    ${LIBTHEORA_SOURCE_DIR}/modedec.h
    ${LIBTHEORA_SOURCE_DIR}/ocintrin.h
    ${LIBTHEORA_SOURCE_DIR}/quant.c
    ${LIBTHEORA_SOURCE_DIR}/quant.h
    # ${LIBTHEORA_SOURCE_DIR}/rate.c
    ${LIBTHEORA_SOURCE_DIR}/state.c
    ${LIBTHEORA_SOURCE_DIR}/state.h
    ${LIBTHEORA_SOURCE_DIR}/theora/theoradec.h
    ${LIBTHEORA_SOURCE_DIR}/theora/codec.h
    ${LIBTHEORA_SOURCE_DIR}/theora/theora.h
    ${LIBTHEORA_SOURCE_DIR}/theora/theoraenc.h
    # ${LIBTHEORA_SOURCE_DIR}/tokenize.c
    )

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(LIBTHEORA_SOURCE ${LIBTHEORA_SOURCE}
        # ${LIBTHEORA_SOURCE_DIR}/x86_vc/mmxfdct.c
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/x86int.h
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/x86state.c
        # ${LIBTHEORA_SOURCE_DIR}/x86_vc/x86enc.c
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/mmxstate.c
        # ${LIBTHEORA_SOURCE_DIR}/x86_vc/mmxencfrag.c
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/x86enc.h
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/x86cpu.h
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/mmxfrag.c
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/x86zigzag.h
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/mmxloop.h
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/mmxidct.c
        ${LIBTHEORA_SOURCE_DIR}/x86_vc/x86cpu.c
    )
else()
    set(LIBTHEORA_SOURCE ${LIBTHEORA_SOURCE} 
        # ${LIBTHEORA_SOURCE_DIR}/x86/mmxfdct.c
        ${LIBTHEORA_SOURCE_DIR}/x86/x86int.h
        # ${LIBTHEORA_SOURCE_DIR}/x86/x86enquant.c
        ${LIBTHEORA_SOURCE_DIR}/x86/x86state.c
        # ${LIBTHEORA_SOURCE_DIR}/x86/x86enc.c
        ${LIBTHEORA_SOURCE_DIR}/x86/mmxstate.c
        # ${LIBTHEORA_SOURCE_DIR}/x86/mmxencfrag.c
        ${LIBTHEORA_SOURCE_DIR}/x86/x86enc.h
        ${LIBTHEORA_SOURCE_DIR}/x86/sse2trans.h
        ${LIBTHEORA_SOURCE_DIR}/x86/x86cpu.h
        ${LIBTHEORA_SOURCE_DIR}/x86/mmxfrag.c
        ${LIBTHEORA_SOURCE_DIR}/x86/x86zigzag.h
        # ${LIBTHEORA_SOURCE_DIR}/x86/sse2fdct.c
        ${LIBTHEORA_SOURCE_DIR}/x86/mmxloop.h
        # ${LIBTHEORA_SOURCE_DIR}/x86/sse2encfrag.c
        ${LIBTHEORA_SOURCE_DIR}/x86/mmxidct.c
        ${LIBTHEORA_SOURCE_DIR}/x86/x86cpu.c
        ${LIBTHEORA_SOURCE_DIR}/x86/sse2idct.c
        )
endif()
godot_add_library(theora thirdparty STATIC ${LIBTHEORA_SOURCE})
target_include_directories(theora PUBLIC ${LIBTHEORA_SOURCE_DIR})
target_link_libraries(theora PUBLIC ogg)
set_property(TARGET theora PROPERTY C_STANDARD 17)
set_property(TARGET theora PROPERTY LANGUAGE CXX)
