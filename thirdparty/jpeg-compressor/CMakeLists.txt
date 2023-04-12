#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

set(JPEG_COMPRESSOR_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/jpeg-compressor)
set(JPEG_COMPRESSOR_SOURCE
    ${JPEG_COMPRESSOR_SOURCE_DIR}/jpgd.cpp
    ${JPEG_COMPRESSOR_SOURCE_DIR}/jpgd.h
    ${JPEG_COMPRESSOR_SOURCE_DIR}/jpgd_idct.h
    ${JPEG_COMPRESSOR_SOURCE_DIR}/jpge.cpp
    ${JPEG_COMPRESSOR_SOURCE_DIR}/jpge.h
    )

godot_add_library(jpeg-compressor thirdparty STATIC ${JPEG_COMPRESSOR_SOURCE})
target_include_directories(jpeg-compressor PUBLIC ${JPEG_COMPRESSOR_SOURCE_DIR})
