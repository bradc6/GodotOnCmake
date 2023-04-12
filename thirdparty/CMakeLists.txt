#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

####################################
#amd-fsr
####################################
set(AMD_FSR_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/amd-fsr)
set(AMD_FSR_SOURCE
    ${AMD_FSR_SOURCE_DIR}/ffx_a.h
    ${AMD_FSR_SOURCE_DIR}/ffx_fsr1.h
    )

godot_add_library(amd-fsr thirdparty INTERFACE)
target_include_directories(amd-fsr INTERFACE ${AMD_FSR_SOURCE_DIR})

####################################
#astcenc
####################################
set(ASTCENC_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/astcenc)
set(ASTCENC_SOURCE
    ${ASTCENC_SOURCE_DIR}/astcenc_averages_and_directions.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_block_sizes.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_color_quantize.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_color_unquantize.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_compress_symbolic.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_compute_variance.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_decompress_symbolic.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_diagnostic_trace.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_diagnostic_trace.h
    ${ASTCENC_SOURCE_DIR}/astcenc_entry.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_find_best_partitioning.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc.h
    ${ASTCENC_SOURCE_DIR}/astcenc_ideal_endpoints_and_weights.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_image.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_integer_sequence.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_internal_entry.h
    ${ASTCENC_SOURCE_DIR}/astcenc_internal.h
    ${ASTCENC_SOURCE_DIR}/astcenc_mathlib.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_mathlib.h
    ${ASTCENC_SOURCE_DIR}/astcenc_mathlib_softfloat.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_partition_tables.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_percentile_tables.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_pick_best_endpoint_format.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_platform_isa_detection.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_quantization.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_symbolic_physical.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_vecmathlib_avx2_8.h
    ${ASTCENC_SOURCE_DIR}/astcenc_vecmathlib_common_4.h
    ${ASTCENC_SOURCE_DIR}/astcenc_vecmathlib.h
    ${ASTCENC_SOURCE_DIR}/astcenc_vecmathlib_neon_4.h
    ${ASTCENC_SOURCE_DIR}/astcenc_vecmathlib_none_4.h
    ${ASTCENC_SOURCE_DIR}/astcenc_vecmathlib_sse_4.h
    ${ASTCENC_SOURCE_DIR}/astcenc_weight_align.cpp
    ${ASTCENC_SOURCE_DIR}/astcenc_weight_quant_xfer_tables.cpp
    )

godot_add_library(astcenc thirdparty STATIC ${ASTCENC_SOURCE})
target_include_directories(astcenc PUBLIC ${ASTCENC_SOURCE_DIR})

####################################
#basis_universal
####################################
set(BASIS_UNIVERSAL_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/basis_universal)
set(BASIS_UNIVERSAL_SOURCE_ENCODER_DIR ${BASIS_UNIVERSAL_SOURCE_DIR}/encoder)
set(BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR ${BASIS_UNIVERSAL_SOURCE_DIR}/transcoder)
set(BASIS_UNIVERSAL_SOURCE
    #Encoder
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_backend.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_backend.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_basis_file.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_basis_file.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_bc7enc.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_bc7enc.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_comp.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_comp.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_enc.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_enc.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_etc.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_etc.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_frontend.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_frontend.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_gpu_texture.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_gpu_texture.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_kernels_declares.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_kernels_imp.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_kernels_sse.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_miniz.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_ocl_kernels.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_opencl.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_opencl.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_pvrtc1_4.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_pvrtc1_4.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_resample_filters.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_resampler.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_resampler_filters.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_resampler.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_ssim.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_ssim.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_uastc_enc.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/basisu_uastc_enc.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/cppspmd_flow.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/cppspmd_math_declares.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/cppspmd_math.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/cppspmd_sse.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/cppspmd_type_aliases.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/jpgd.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/jpgd.h
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/pvpngreader.cpp
    ${BASIS_UNIVERSAL_SOURCE_ENCODER_DIR}/pvpngreader.h
    #Transcode
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_containers.h
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_containers_impl.h
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_file_headers.h
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu.h
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder.cpp
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder.h
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_internal.h
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_astc_0_255.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_astc.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_atc_55.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_atc_56.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_bc7_m5_alpha.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_bc7_m5_color.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_dxt1_5.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_dxt1_6.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_pvrtc2_45.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_tables_pvrtc2_alpha_33.inc
    ${BASIS_UNIVERSAL_SOURCE_TRANSCODER_DIR}/basisu_transcoder_uastc.h
    )
godot_add_library(basis_universal thirdparty STATIC ${BASIS_UNIVERSAL_SOURCE})
target_link_libraries(basis_universal PUBLIC zstd)
target_include_directories(basis_universal PRIVATE ${BASIS_UNIVERSAL_SOURCE_DIR})
target_include_directories(basis_universal PUBLIC ${BASIS_UNIVERSAL_SOURCE_DIR})

####################################
#brotil
####################################
set(BROTLI_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/brotli)
set(BROTLI_SOURCE
    ${BROTLI_SOURCE_DIR}/common/platform.c
    ${BROTLI_SOURCE_DIR}/common/version.h
    ${BROTLI_SOURCE_DIR}/common/constants.h
    ${BROTLI_SOURCE_DIR}/common/context.c
    ${BROTLI_SOURCE_DIR}/common/dictionary.c
    ${BROTLI_SOURCE_DIR}/common/shared_dictionary.c
    ${BROTLI_SOURCE_DIR}/common/transform.h
    ${BROTLI_SOURCE_DIR}/common/transform.c
    ${BROTLI_SOURCE_DIR}/common/platform.h
    ${BROTLI_SOURCE_DIR}/common/constants.c
    ${BROTLI_SOURCE_DIR}/common/context.h
    ${BROTLI_SOURCE_DIR}/common/shared_dictionary_internal.h
    ${BROTLI_SOURCE_DIR}/common/dictionary.h
    ${BROTLI_SOURCE_DIR}/dec/bit_reader.h
    ${BROTLI_SOURCE_DIR}/dec/prefix.h
    ${BROTLI_SOURCE_DIR}/dec/huffman.h
    ${BROTLI_SOURCE_DIR}/dec/bit_reader.c
    ${BROTLI_SOURCE_DIR}/dec/decode.c
    ${BROTLI_SOURCE_DIR}/dec/state.c
    ${BROTLI_SOURCE_DIR}/dec/state.h
    ${BROTLI_SOURCE_DIR}/dec/huffman.c
    ${BROTLI_SOURCE_DIR}/include/brotli
    ${BROTLI_SOURCE_DIR}/include/brotli/encode.h
    ${BROTLI_SOURCE_DIR}/include/brotli/port.h
    ${BROTLI_SOURCE_DIR}/include/brotli/shared_dictionary.h
    ${BROTLI_SOURCE_DIR}/include/brotli/types.h
    ${BROTLI_SOURCE_DIR}/include/brotli/decode.h
    )

godot_add_library(brotli thirdparty STATIC ${BROTLI_SOURCE})
target_include_directories(brotli PUBLIC ${BROTLI_SOURCE_DIR}/include)

####################################
#cvtt
####################################
set(CVTT_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/cvtt)
set(CVTT_SOURCE
    ${CVTT_SOURCE_DIR}/ConvectionKernels_AggregatedError.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_API.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BC67.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BC67.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BC6H_IO.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BC6H_IO.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BC7_PrioData.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BC7_Prio.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BC7_SingleColor.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BCCommon.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_BCCommon.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_Config.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_EndpointRefiner.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_EndpointSelector.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_ETC1.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_ETC2.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_ETC2_Rounding.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_ETC.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_ETC.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_FakeBT709_Rounding.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_IndexSelector.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_IndexSelector.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_IndexSelectorHDR.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_PackedCovarianceMatrix.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_ParallelMath.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_S3TC.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_S3TC.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_S3TC_SingleColor.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_SingleFile.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_UnfinishedEndpoints.h
    ${CVTT_SOURCE_DIR}/ConvectionKernels_Util.cpp
    ${CVTT_SOURCE_DIR}/ConvectionKernels_Util.h
    )
godot_add_library(cvtt thirdparty STATIC ${CVTT_SOURCE})
target_include_directories(cvtt PUBLIC ${CVTT_SOURCE_DIR})

####################################
#embree
####################################
add_subdirectory(embree)

####################################
#enet
####################################
add_subdirectory(enet)

####################################
#etcpak
####################################
set(ETCPAK_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/etcpak)
set(ETCPAK_SOURCE
    ${ETCPAK_SOURCE_DIR}/Dither.cpp
    ${ETCPAK_SOURCE_DIR}/Dither.hpp
    ${ETCPAK_SOURCE_DIR}/ForceInline.hpp
    ${ETCPAK_SOURCE_DIR}/Math.hpp
    ${ETCPAK_SOURCE_DIR}/ProcessCommon.hpp
    ${ETCPAK_SOURCE_DIR}/ProcessDxtc.cpp
    ${ETCPAK_SOURCE_DIR}/ProcessDxtc.hpp
    ${ETCPAK_SOURCE_DIR}/ProcessRGB.cpp
    ${ETCPAK_SOURCE_DIR}/ProcessRGB.hpp
    ${ETCPAK_SOURCE_DIR}/Tables.cpp
    ${ETCPAK_SOURCE_DIR}/Tables.hpp
    ${ETCPAK_SOURCE_DIR}/Vector.hpp
)
godot_add_library(etcpak thirdparty STATIC ${ETCPAK_SOURCE})
target_include_directories(etcpak PUBLIC ${ETCPAK_SOURCE_DIR})

####################################
#freetype
####################################
set(FREETYPE_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/freetype)
set(FREETYPE_SOURCE
	${FREETYPE_SOURCE_DIR}/include/freetype/ftmm.h
        ${FREETYPE_SOURCE_DIR}/src/autofit/autofit.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftbase.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftbbox.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftbdf.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftbitmap.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftcid.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftdebug.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftfstype.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftgasp.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftglyph.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftgxval.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftinit.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftmm.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftotval.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftpatent.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftpfr.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftstroke.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftsynth.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftsystem.c
        ${FREETYPE_SOURCE_DIR}/src/base/fttype1.c
        ${FREETYPE_SOURCE_DIR}/src/base/ftwinfnt.c
        ${FREETYPE_SOURCE_DIR}/src/bdf/bdf.c
        ${FREETYPE_SOURCE_DIR}/src/bzip2/ftbzip2.c
        ${FREETYPE_SOURCE_DIR}/src/cache/ftcache.c
        ${FREETYPE_SOURCE_DIR}/src/cff/cff.c
        ${FREETYPE_SOURCE_DIR}/src/cid/type1cid.c
        ${FREETYPE_SOURCE_DIR}/src/gxvalid/gxvalid.c
        ${FREETYPE_SOURCE_DIR}/src/gzip/ftgzip.c
        ${FREETYPE_SOURCE_DIR}/src/lzw/ftlzw.c
        ${FREETYPE_SOURCE_DIR}/src/otvalid/otvalid.c
        ${FREETYPE_SOURCE_DIR}/src/pcf/pcf.c
        ${FREETYPE_SOURCE_DIR}/src/pfr/pfr.c
        ${FREETYPE_SOURCE_DIR}/src/psaux/psaux.c
        ${FREETYPE_SOURCE_DIR}/src/pshinter/pshinter.c
        ${FREETYPE_SOURCE_DIR}/src/psnames/psnames.c
        ${FREETYPE_SOURCE_DIR}/src/raster/raster.c
        ${FREETYPE_SOURCE_DIR}/src/sdf/sdf.c
        ${FREETYPE_SOURCE_DIR}/src/svg/svg.c
        ${FREETYPE_SOURCE_DIR}/src/smooth/smooth.c
        ${FREETYPE_SOURCE_DIR}/src/truetype/truetype.c
        ${FREETYPE_SOURCE_DIR}/src/type1/type1.c
        ${FREETYPE_SOURCE_DIR}/src/type42/type42.c
        ${FREETYPE_SOURCE_DIR}/src/winfonts/winfnt.c

        #sfnt
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/pngshim.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/pngshim.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfdriver.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfdriver.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sferrors.h
        ${FREETYPE_SOURCE_DIR}/src/sfnt/sfnt.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfobjs.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfobjs.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfwoff2.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfwoff2.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfwoff.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/sfwoff.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttbdf.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttbdf.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttcmap.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttcmapc.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttcmap.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttcolr.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttcolr.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttcpal.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttcpal.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttkern.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttkern.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttload.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttload.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttmtx.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttmtx.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttpost.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttpost.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttsbit.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttsbit.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttsvg.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/ttsvg.h
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/woff2tags.c
        # ${FREETYPE_SOURCE_DIR}/src/sfnt/woff2tags.h

	)
godot_add_library(freetype thirdparty STATIC ${FREETYPE_SOURCE})
target_include_directories(freetype PUBLIC ${FREETYPE_SOURCE_DIR}/include)
target_compile_definitions(freetype PUBLIC FT_CONFIG_OPTION_USE_BROTLI FT2_BUILD_LIBRARY FT_CONFIG_OPTION_USE_PNG FT_CONFIG_OPTION_SYSTEM_ZLIB)
target_link_libraries(freetype png zlib brotli)

####################################
#glad
####################################
add_subdirectory(glad)

####################################
#godot glslang (It's a mix of three libs)
####################################
set(GLSLANG_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/glslang)
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(GLSLANG_PLATFORM "Windows")
else()
    set(GLSLANG_PLATFORM "Unix")
endif()
set(GLSLANG_SOURCE
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/attribute.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/Constant.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/glslang_tab.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/InfoSink.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/Initialize.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/Intermediate.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/intermOut.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/IntermTraverse.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/iomapper.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/limits.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/linkValidate.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/parseConst.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/ParseContextBase.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/ParseHelper.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/PoolAlloc.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/preprocessor/PpAtom.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/preprocessor/PpContext.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/preprocessor/Pp.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/preprocessor/PpScanner.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/preprocessor/PpTokens.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/propagateNoContraction.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/reflection.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/RemoveTree.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/Scan.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/ShaderLang.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/SpirvIntrinsics.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/SymbolTable.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/MachineIndependent/Versions.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/GenericCodeGen/CodeGen.cpp
        ${GLSLANG_SOURCE_DIR}/glslang/GenericCodeGen/Link.cpp
        ${GLSLANG_SOURCE_DIR}/OGLCompilersDLL/InitializeDll.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/disassemble.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/doc.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/GlslangToSpv.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/InReadableOrder.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/Logger.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/SpvBuilder.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/SpvPostProcess.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/SPVRemapper.cpp
        ${GLSLANG_SOURCE_DIR}/SPIRV/SpvTools.cpp

        #HACK - UNIX
        ${GLSLANG_SOURCE_DIR}/glslang/OSDependent/${GLSLANG_PLATFORM}/ossource.cpp
    )
godot_add_library(godot-glslang thirdparty STATIC ${GLSLANG_SOURCE})
target_include_directories(godot-glslang PUBLIC ${GLSLANG_SOURCE_DIR} ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR})

####################################
#graphite
####################################
add_subdirectory(graphite)

####################################
#harfbuzz
####################################
set(HARFBUZZ_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/harfbuzz)
set(HARFBUZZ_SOURCE
    ${HARFBUZZ_SOURCE_DIR}/src/hb-coretext.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-cff1-interp-cs.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-number-parser.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-khmer-machine.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-number.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-face.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-icu.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color-colr-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-blob.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-meta.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-os2-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shaper.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-hmtx-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-cplusplus.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-map.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-unicode.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-null.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-face-table-list.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout-jstf-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-tag-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shape-normalize.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-hangul.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-fallback-shape.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-draw.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shaper.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout-gpos-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-arabic-fallback.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-indic.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-head-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-icu.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shape-normalize.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-cmap-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-kern-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-multimap.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-config.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-coretext.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-vector.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-blob.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-arabic.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-post-table-v2subset.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-math.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-cff2.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shape.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-cff2-interp-cs.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-gobject.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-uniscribe.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-cff1-table.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-draw.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-khmer.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-myanmar.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-meta.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-math.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shape-plan.cc
    #${HARFBUZZ_SOURCE_DIR}/src/graph/test-classdef-graph.cc
    ${HARFBUZZ_SOURCE_DIR}/src/graph/classdef-graph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/serialize.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/gsubgpos-context.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/coverage-graph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/gsubgpos-context.cc
    ${HARFBUZZ_SOURCE_DIR}/src/graph/markbasepos-graph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/gsubgpos-graph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/graph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/split-helpers.hh
    ${HARFBUZZ_SOURCE_DIR}/src/graph/pairpos-graph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-ankr-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-gobject-structs.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-kern.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-hhea-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-arabic-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-use-machine.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-deprecated.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-open-file.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-tag.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-cff-interp-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-buffer-verify.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ft.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shape-plan.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-name-language-static.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/coord-setter.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/glyf.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/SimpleGlyph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/SubsetGlyph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/Glyph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/loca.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/composite-iter.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/GlyphHeader.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/path-builder.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/CompositeGlyph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/glyf-helpers.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/glyf/VarCompositeGlyph.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/Common/CoverageFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/Common/RangeRecord.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/Common/CoverageFormat2.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/Common/Coverage.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/ChainContextPos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/PairPosFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkRecord.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkBasePosFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/PairSet.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkBasePos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/CursivePosFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/GPOS.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/PairPos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/SinglePosFormat2.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/ExtensionPos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/SinglePosFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/LigatureArray.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkArray.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkMarkPosFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/AnchorFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/AnchorMatrix.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/PairPosFormat2.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/Anchor.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/Common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/PosLookupSubTable.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/CursivePos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/PairValueRecord.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/ValueFormat.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/ContextPos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/PosLookup.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/AnchorFormat3.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/SinglePos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkMarkPos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkLigPosFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/AnchorFormat2.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GPOS/MarkLigPos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/types.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/SingleSubstFormat2.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/ReverseChainSingleSubstFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/MultipleSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/SubstLookupSubTable.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/ExtensionSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/GSUB.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/ContextSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/AlternateSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/Sequence.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/AlternateSet.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/LigatureSet.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/LigatureSubstFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/AlternateSubstFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/Common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/LigatureSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/ChainContextSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/SingleSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/Ligature.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/SubstLookup.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/ReverseChainSingleSubst.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/MultipleSubstFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/OT/Layout/GSUB/SingleSubstFormat1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-use-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-repacker.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-set-digest.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-graphite2.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-buffer.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-syllabic.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-font.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-myanmar-machine.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-metrics.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shape.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-ltag-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-post-macroman.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-default.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-draw.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-cff-common.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-machinery.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-buffer.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-just-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-set.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var-fvar-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-name.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-trak-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-cff-interp-cs-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-priority-queue.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-repacker.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-blob.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shape-fallback.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-metrics.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout-gdef-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-version.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-directwrite.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-buffer-deserialize-json.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-repacker.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ms-feature-ranges.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shape.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-array.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-name.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var-hvar-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-unicode-emoji-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-morx-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color-cbdt-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var-avar-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-math-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-set.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-face.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-arabic-joining-list.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-cff2-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-set.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-indic.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-uniscribe.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-bit-set.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-glib.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shaper-list.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-cff-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shape.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-cff1-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-static.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-font.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-utf.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-feat-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-arabic-win1256.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shape-fallback.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-number.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-bsln-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-style.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var-gvar-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-deprecated.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-cff1-std-str.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-kerx-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-map.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var-mvar-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-gobject-structs.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-common.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-vowel-constraints.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-post-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-buffer.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-map.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-maxp-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color-colrv1-closure.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-mutex.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color-cpal-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-indic-machine.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color-svg-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ft.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-sanitize.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-map.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-hdmx-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-bimap.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-face.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-font.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-directwrite.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shape.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-thai.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-input.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-buffer-serialize.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-unicode.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-plan.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-style.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-gdi.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-plan.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-cache.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-face.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-buffer-deserialize-text.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-common.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-input.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-string-array.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-name-language.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shape-plan.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-cff-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-accelerator.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-object.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-bit-page.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout-base-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-open-type.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-face.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-debug.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-gdi.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ucd-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-iter.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-font.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-arabic.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-gasp-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ucd.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-serialize.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-unicode.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-opbd-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout-gsub-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-indic-table.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-cff2.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-bit-set-invertible.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-dispatch.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-algs.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-map.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-cff1.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-font.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-meta-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-layout-gsubgpos.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-atomic.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-cff-interp-dict-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-os2-unicode-ranges.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-shaper-impl.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-glib.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-map.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-vorg-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-name-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-syllabic.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-map.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-arabic-pua.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-use.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-vowel-constraints.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-color-sbix-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-cff2-table.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-pool.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-var-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-metrics.h
    ${HARFBUZZ_SOURCE_DIR}/src/hb-graphite2.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-meta.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-stat-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-aat-layout-common.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-glyf-table.hh
    ${HARFBUZZ_SOURCE_DIR}/src/hb-subset-cff1.cc
    ${HARFBUZZ_SOURCE_DIR}/src/hb-ot-shaper-hebrew.cc
    )
godot_add_library(harfbuzz thirdparty STATIC ${HARFBUZZ_SOURCE})
target_include_directories(harfbuzz PUBLIC ${HARFBUZZ_SOURCE_DIR}/src)
target_compile_definitions(harfbuzz PRIVATE HAVE_FREETYPE=1 HAVE_ICU=1)
target_link_libraries(harfbuzz PUBLIC freetype icu4c)

####################################
#icu4c
####################################
add_subdirectory(icu4c)

####################################
#libogg
####################################
set(LIBOGG_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/libogg)
set(LIBOGG_SOURCE
    ${LIBOGG_SOURCE_DIR}/bitwise.c
    ${LIBOGG_SOURCE_DIR}/crctable.h
    ${LIBOGG_SOURCE_DIR}/framing.c
    ${LIBOGG_SOURCE_DIR}/ogg/config_types.h
    ${LIBOGG_SOURCE_DIR}/ogg/os_types.h
    ${LIBOGG_SOURCE_DIR}/ogg/ogg.h
    )
godot_add_library(ogg thirdparty STATIC ${LIBOGG_SOURCE})
target_include_directories(ogg PUBLIC ${LIBOGG_SOURCE_DIR})

####################################
#libpng
####################################
set(LIBPNG_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/libpng)
set(LIBPNG_SOURCE
    # ${LIBPNG_SOURCE_DIR}/arm/filter_neon_intrinsics.c
    # ${LIBPNG_SOURCE_DIR}/arm/palette_neon_intrinsics.c
    # ${LIBPNG_SOURCE_DIR}/arm/filter_neon.S
    # ${LIBPNG_SOURCE_DIR}/arm/arm_init.c
    ${LIBPNG_SOURCE_DIR}/png.c
    ${LIBPNG_SOURCE_DIR}/pngconf.h
    ${LIBPNG_SOURCE_DIR}/pngdebug.h
    ${LIBPNG_SOURCE_DIR}/pngerror.c
    ${LIBPNG_SOURCE_DIR}/pngget.c
    ${LIBPNG_SOURCE_DIR}/png.h
    ${LIBPNG_SOURCE_DIR}/pnginfo.h
    ${LIBPNG_SOURCE_DIR}/pnglibconf.h
    ${LIBPNG_SOURCE_DIR}/pngmem.c
    ${LIBPNG_SOURCE_DIR}/pngpread.c
    ${LIBPNG_SOURCE_DIR}/pngpriv.h
    ${LIBPNG_SOURCE_DIR}/pngread.c
    ${LIBPNG_SOURCE_DIR}/pngrio.c
    ${LIBPNG_SOURCE_DIR}/pngrtran.c
    ${LIBPNG_SOURCE_DIR}/pngrutil.c
    ${LIBPNG_SOURCE_DIR}/pngset.c
    ${LIBPNG_SOURCE_DIR}/pngstruct.h
    ${LIBPNG_SOURCE_DIR}/pngtrans.c
    ${LIBPNG_SOURCE_DIR}/pngwio.c
    ${LIBPNG_SOURCE_DIR}/pngwrite.c
    ${LIBPNG_SOURCE_DIR}/pngwtran.c
    ${LIBPNG_SOURCE_DIR}/pngwutil.c
    )
godot_add_library(png thirdparty STATIC ${LIBPNG_SOURCE})
target_include_directories(png PUBLIC ${LIBPNG_SOURCE_DIR})
target_link_libraries(png PUBLIC zlib)

####################################
#libtheora
####################################
add_subdirectory(libtheora)

####################################
#libvorbis
####################################
set(LIBVORBIS_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/libvorbis)
set(LIBVORBIS_SOURCE
    ${LIBVORBIS_SOURCE_DIR}/analysis.c
    ${LIBVORBIS_SOURCE_DIR}/backends.h
    #${LIBVORBIS_SOURCE_DIR}/barkmel.c
    ${LIBVORBIS_SOURCE_DIR}/bitrate.c
    ${LIBVORBIS_SOURCE_DIR}/bitrate.h
    ${LIBVORBIS_SOURCE_DIR}/block.c
    ${LIBVORBIS_SOURCE_DIR}/books/uncoupled/res_books_uncoupled.h
    ${LIBVORBIS_SOURCE_DIR}/books/floor/floor_books.h
    ${LIBVORBIS_SOURCE_DIR}/books/coupled/res_books_51.h
    ${LIBVORBIS_SOURCE_DIR}/books/coupled/res_books_stereo.h
    ${LIBVORBIS_SOURCE_DIR}/codebook.c
    ${LIBVORBIS_SOURCE_DIR}/codebook.h
    ${LIBVORBIS_SOURCE_DIR}/codec_internal.h
    ${LIBVORBIS_SOURCE_DIR}/envelope.c
    ${LIBVORBIS_SOURCE_DIR}/envelope.h
    ${LIBVORBIS_SOURCE_DIR}/floor0.c
    ${LIBVORBIS_SOURCE_DIR}/floor1.c
    ${LIBVORBIS_SOURCE_DIR}/highlevel.h
    ${LIBVORBIS_SOURCE_DIR}/info.c
    ${LIBVORBIS_SOURCE_DIR}/lookup.c
    ${LIBVORBIS_SOURCE_DIR}/lookup_data.h
    ${LIBVORBIS_SOURCE_DIR}/lookup.h
    ${LIBVORBIS_SOURCE_DIR}/lpc.c
    ${LIBVORBIS_SOURCE_DIR}/lpc.h
    ${LIBVORBIS_SOURCE_DIR}/lsp.c
    ${LIBVORBIS_SOURCE_DIR}/lsp.h
    ${LIBVORBIS_SOURCE_DIR}/mapping0.c
    ${LIBVORBIS_SOURCE_DIR}/masking.h
    ${LIBVORBIS_SOURCE_DIR}/mdct.c
    ${LIBVORBIS_SOURCE_DIR}/mdct.h
    ${LIBVORBIS_SOURCE_DIR}/misc.h
    ${LIBVORBIS_SOURCE_DIR}/modes/residue_44p51.h
    ${LIBVORBIS_SOURCE_DIR}/modes/psych_44.h
    ${LIBVORBIS_SOURCE_DIR}/modes/floor_all.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_X.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_44u.h
    ${LIBVORBIS_SOURCE_DIR}/modes/residue_44.h
    ${LIBVORBIS_SOURCE_DIR}/modes/psych_16.h
    ${LIBVORBIS_SOURCE_DIR}/modes/residue_16.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_32.h
    ${LIBVORBIS_SOURCE_DIR}/modes/psych_11.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_11.h
    ${LIBVORBIS_SOURCE_DIR}/modes/psych_8.h
    ${LIBVORBIS_SOURCE_DIR}/modes/residue_8.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_16.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_8.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_44p51.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_44.h
    ${LIBVORBIS_SOURCE_DIR}/modes/setup_22.h
    ${LIBVORBIS_SOURCE_DIR}/modes/residue_44u.h
    ${LIBVORBIS_SOURCE_DIR}/os.h
    ${LIBVORBIS_SOURCE_DIR}/psy.c
    ${LIBVORBIS_SOURCE_DIR}/psy.h
    #DEAD code according to documentation
    #${LIBVORBIS_SOURCE_DIR}/psytune.c
    ${LIBVORBIS_SOURCE_DIR}/registry.c
    ${LIBVORBIS_SOURCE_DIR}/registry.h
    ${LIBVORBIS_SOURCE_DIR}/res0.c
    ${LIBVORBIS_SOURCE_DIR}/scales.h
    ${LIBVORBIS_SOURCE_DIR}/sharedbook.c
    ${LIBVORBIS_SOURCE_DIR}/smallft.c
    ${LIBVORBIS_SOURCE_DIR}/smallft.h
    ${LIBVORBIS_SOURCE_DIR}/synthesis.c
    #${LIBVORBIS_SOURCE_DIR}/tone.c
    ${LIBVORBIS_SOURCE_DIR}/vorbis/vorbisenc.h
    ${LIBVORBIS_SOURCE_DIR}/vorbis/codec.h
    ${LIBVORBIS_SOURCE_DIR}/vorbis/vorbisfile.h
    ${LIBVORBIS_SOURCE_DIR}/vorbisenc.c
    ${LIBVORBIS_SOURCE_DIR}/vorbisfile.c
    ${LIBVORBIS_SOURCE_DIR}/window.c
    ${LIBVORBIS_SOURCE_DIR}/window.h
    )
godot_add_library(vorbis thirdparty STATIC ${LIBVORBIS_SOURCE})
target_link_libraries(vorbis PUBLIC ogg)
target_include_directories(vorbis PUBLIC ${LIBVORBIS_SOURCE_DIR})

####################################
#libwebp
####################################
set(LIBWEBP_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/libwebp)
set(LIBWEBP_SOURCE
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_gamma.c
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_sse2.c
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_csp.h
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_dsp.h
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_csp.c
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_gamma.h
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_neon.c
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv.c
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv_dsp.c
    ${LIBWEBP_SOURCE_DIR}/sharpyuv/sharpyuv.h
    ${LIBWEBP_SOURCE_DIR}/src/enc/iterator_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/analysis_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/quant_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/near_lossless_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/vp8l_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/backward_references_enc.h
    ${LIBWEBP_SOURCE_DIR}/src/enc/vp8i_enc.h
    ${LIBWEBP_SOURCE_DIR}/src/enc/histogram_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/tree_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/picture_psnr_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/picture_rescale_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/predictor_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/backward_references_cost_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/filter_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/config_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/alpha_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/picture_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/histogram_enc.h
    ${LIBWEBP_SOURCE_DIR}/src/enc/cost_enc.h
    ${LIBWEBP_SOURCE_DIR}/src/enc/vp8li_enc.h
    ${LIBWEBP_SOURCE_DIR}/src/enc/picture_tools_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/webp_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/picture_csp_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/syntax_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/backward_references_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/token_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/cost_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/enc/frame_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/webp/mux_types.h
    ${LIBWEBP_SOURCE_DIR}/src/webp/encode.h
    ${LIBWEBP_SOURCE_DIR}/src/webp/demux.h
    ${LIBWEBP_SOURCE_DIR}/src/webp/mux.h
    ${LIBWEBP_SOURCE_DIR}/src/webp/types.h
    ${LIBWEBP_SOURCE_DIR}/src/webp/format_constants.h
    ${LIBWEBP_SOURCE_DIR}/src/webp/decode.h
    ${LIBWEBP_SOURCE_DIR}/src/mux/anim_encode.c
    ${LIBWEBP_SOURCE_DIR}/src/mux/muxinternal.c
    ${LIBWEBP_SOURCE_DIR}/src/mux/muxi.h
    ${LIBWEBP_SOURCE_DIR}/src/mux/muxread.c
    ${LIBWEBP_SOURCE_DIR}/src/mux/animi.h
    ${LIBWEBP_SOURCE_DIR}/src/mux/muxedit.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/vp8l_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/idec_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/vp8_dec.h
    ${LIBWEBP_SOURCE_DIR}/src/dec/io_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/buffer_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/tree_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/common_dec.h
    ${LIBWEBP_SOURCE_DIR}/src/dec/quant_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/webp_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/webpi_dec.h
    ${LIBWEBP_SOURCE_DIR}/src/dec/alpha_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/frame_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dec/vp8li_dec.h
    ${LIBWEBP_SOURCE_DIR}/src/dec/vp8i_dec.h
    ${LIBWEBP_SOURCE_DIR}/src/dec/alphai_dec.h
    ${LIBWEBP_SOURCE_DIR}/src/dec/vp8_dec.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/color_cache_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/quant_levels_dec_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/huffman_encode_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/bit_writer_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/filters_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/endian_inl_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/random_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/rescaler_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/huffman_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/random_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/huffman_encode_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/quant_levels_dec_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/bit_writer_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/bit_reader_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/filters_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/thread_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/bit_reader_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/quant_levels_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/color_cache_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/rescaler_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/huffman_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/bit_reader_inl_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/utils/quant_levels_utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/utils.c
    ${LIBWEBP_SOURCE_DIR}/src/utils/thread_utils.h
    ${LIBWEBP_SOURCE_DIR}/src/demux/anim_decode.c
    ${LIBWEBP_SOURCE_DIR}/src/demux/demux.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/yuv_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/filters.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/ssim_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/filters_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/common_sse41.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/enc.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/enc_sse41.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/enc_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/yuv_mips32.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/quant.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/cost_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/rescaler.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/yuv_sse41.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_enc_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec_msa.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/enc_msa.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_enc_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/rescaler_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/neon.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/cpu.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/cpu.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_sse41.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_enc_mips32.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_msa.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/alpha_processing.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/enc_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/common_sse2.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/upsampling_msa.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_common.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/upsampling_sse41.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/upsampling_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/msa_macro.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/rescaler_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/enc_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dsp.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec_sse41.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/alpha_processing_sse41.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_enc_sse41.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/alpha_processing_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/yuv_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec_mips32.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_enc_msa.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/mips_macro.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/filters_msa.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_enc_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/filters_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/rescaler_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/upsampling.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/cost.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/ssim.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/alpha_processing_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/yuv.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/upsampling_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/dec_clip_tables.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/rescaler_mips32.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/cost_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/enc_mips32.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/cost_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_enc.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/lossless_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/filters_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/yuv_neon.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/rescaler_msa.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/yuv.h
    ${LIBWEBP_SOURCE_DIR}/src/dsp/upsampling_sse2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/alpha_processing_mips_dsp_r2.c
    ${LIBWEBP_SOURCE_DIR}/src/dsp/cost_mips32.c
    )
godot_add_library(webp thirdparty STATIC ${LIBWEBP_SOURCE})
target_include_directories(webp PRIVATE ${LIBWEBP_SOURCE_DIR})
target_include_directories(webp PUBLIC ${LIBWEBP_SOURCE_DIR}/src)

####################################
#linuxbsd_headers
####################################
set(LINUX_BSD_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/linuxbsd_headers)
set(LINUX_BSD_SOURCE
    ${LINUX_BSD_SOURCE_DIR}/alsa/seqmid.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/hwdep.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/pcm_ioplug.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/version.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/input.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/patches/use-standard-poll-h.diff
    ${LINUX_BSD_SOURCE_DIR}/alsa/topology.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/pcm_external.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/alisp.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/seq.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/timer.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/asoundef.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/error.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/asoundlib.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/control.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/output.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/conf.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/mixer_abst.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/mixer.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/pcm_plugin.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/seq_event.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/global.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/use-case.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/pcm.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/pcm_rate.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/pcm_extplug.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/pcm_old.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/control_external.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/seq_midi_event.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/asound_fm.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/tlv.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/sb16_csp.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/sscape_ioctl.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/emu10k1.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/hdsp.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/type_compat.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/asoc.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/sound/hdspm.h
    ${LINUX_BSD_SOURCE_DIR}/alsa/rawmidi.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-macros.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-address.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-protocol.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-threads.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-shared.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-pending-call.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-misc.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-connection.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-types.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-arch-deps.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-errors.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-bus.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-server.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-message.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-syntax.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-signature.h
    ${LINUX_BSD_SOURCE_DIR}/dbus/dbus-memory.h
    ${LINUX_BSD_SOURCE_DIR}/fontconfig/fcfreetype.h
    ${LINUX_BSD_SOURCE_DIR}/fontconfig/fcprivate.h
    ${LINUX_BSD_SOURCE_DIR}/fontconfig/fontconfig.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/def.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/volume.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/version.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/pulseaudio.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/operation.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/cdecl.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/sample.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/stream.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/ext-stream-restore.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/thread-mainloop.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/error.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/ext-device-manager.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/mainloop.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/utf8.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/glib-mainloop.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/timeval.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/channelmap.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/scache.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/introspect.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/proplist.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/mainloop-api.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/format.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/util.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/direction.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/gccmacro.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/simple.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/context.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/ext-device-restore.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/xmalloc.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/mainloop-signal.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/subscribe.h
    ${LINUX_BSD_SOURCE_DIR}/pulse/rtclock.h
    ${LINUX_BSD_SOURCE_DIR}/speechd/libspeechd.h
    ${LINUX_BSD_SOURCE_DIR}/speechd/libspeechd_version.h
    ${LINUX_BSD_SOURCE_DIR}/speechd/speechd_types.h
    ${LINUX_BSD_SOURCE_DIR}/speechd/spd_audio_plugin.h
    ${LINUX_BSD_SOURCE_DIR}/speechd/speechd_defines.h
    ${LINUX_BSD_SOURCE_DIR}/udev/libudev.h
    ${LINUX_BSD_SOURCE_DIR}/X11/X.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xdefs.h
    ${LINUX_BSD_SOURCE_DIR}/X11/keysym.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xatom.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xfuncproto.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xfuncs.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xcursor/Xcursor.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xosdefs.h
    ${LINUX_BSD_SOURCE_DIR}/X11/XKBlib.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/XKB.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/shapeconst.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/Xinerama.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/XI2.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/Xrandr.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/randrproto.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/renderproto.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/shape.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/Xext.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/Xrender.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/XInput2.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/render.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/xfixeswire.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/randr.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/XKBstr.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/Xge.h
    ${LINUX_BSD_SOURCE_DIR}/X11/extensions/Xfixes.h
    ${LINUX_BSD_SOURCE_DIR}/X11/XF86keysym.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xlib.h
    ${LINUX_BSD_SOURCE_DIR}/X11/keysymdef.h
    ${LINUX_BSD_SOURCE_DIR}/X11/Xutil.h
    ${LINUX_BSD_SOURCE_DIR}/xkbcommon/xkbcommon-names.h
    ${LINUX_BSD_SOURCE_DIR}/xkbcommon/xkbcommon-keysyms.h
    ${LINUX_BSD_SOURCE_DIR}/xkbcommon/xkbcommon.h
    ${LINUX_BSD_SOURCE_DIR}/xkbcommon/xkbcommon-compat.h
    ${LINUX_BSD_SOURCE_DIR}/xkbcommon/xkbcommon-compose.h
    )
godot_add_library(linuxbsd-headers thirdparty INTERFACE ${LINUX_BSD_SOURCE})

####################################
#mbedtls
####################################
add_subdirectory(mbedtls)

####################################
#meshoptimizer
####################################
set(MESHOPTIMIZER_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/meshoptimizer)
set(MESHOPTIMIZER_SOURCE
    ${MESHOPTIMIZER_SOURCE_DIR}/allocator.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/clusterizer.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/indexcodec.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/indexgenerator.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/meshoptimizer.h
    ${MESHOPTIMIZER_SOURCE_DIR}/overdrawanalyzer.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/overdrawoptimizer.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/simplifier.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/spatialorder.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/stripifier.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/vcacheanalyzer.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/vcacheoptimizer.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/vertexcodec.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/vertexfilter.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/vfetchanalyzer.cpp
    ${MESHOPTIMIZER_SOURCE_DIR}/vfetchoptimizer.cpp
    )
godot_add_library(meshoptimizer thirdparty STATIC ${MESHOPTIMIZER_SOURCE})

####################################
#minimp3
####################################
set(MINIMP3_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/minimp3)
set(MINIMP3_SOURCE
    ${MINIMP3_SOURCE_DIR}/minimp3_ex.h
    ${MINIMP3_SOURCE_DIR}/minimp3.h
    )
godot_add_library(minimp3 thirdparty INTERFACE ${MINIMP3_SOURCE})
target_include_directories(minimp3 INTERFACE ${MINIMP3_SOURCE_DIR})

####################################
#miniupnpc
####################################
add_subdirectory(miniupnpc)

####################################
#minizip
####################################
set(MINIZIP_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/minizip)
set(MINIZIP_SOURCE
    ${MINIZIP_SOURCE_DIR}/crypt.h
    ${MINIZIP_SOURCE_DIR}/ioapi.c
    ${MINIZIP_SOURCE_DIR}/ioapi.h
    ${MINIZIP_SOURCE_DIR}/unzip.c
    ${MINIZIP_SOURCE_DIR}/unzip.h
    ${MINIZIP_SOURCE_DIR}/zip.c
    ${MINIZIP_SOURCE_DIR}/zip.h
    )
godot_add_library(minizip thirdparty STATIC ${MINIZIP_SOURCE})
target_include_directories(minizip PUBLIC ${MINIZIP_SOURCE_DIR})
target_link_libraries(minizip PUBLIC zlib)

####################################
#godot misc
####################################
set(GODOT_THIRD_PARTY_MISC_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/misc)
set(GODOT_THIRD_PARTY_MISC_SOURCE
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/clipper.cpp
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/clipper.hpp
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/cubemap_coeffs.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/fastlz.c
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/fastlz.h
    # ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/ifaddrs-android.cc # Disabled until we support Android
    # ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/ifaddrs-android.h # Disabled until we support Android
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/mikktspace.c
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/mikktspace.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/ok_color.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/ok_color_shader.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/pcg.cpp
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/pcg.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/polypartition.cpp
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/polypartition.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/r128.c
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/r128.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/smaz.c
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/smaz.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/smolv.cpp
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/smolv.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/stb_rect_pack.h
    ${GODOT_THIRD_PARTY_MISC_SOURCE_DIR}/yuv2rgb.h
    )
godot_add_library(godot-thirdparty-misc thirdparty STATIC ${GODOT_THIRD_PARTY_MISC_SOURCE})
target_compile_definitions(godot-thirdparty-misc PUBLIC R128_IMPLEMENTATION=1)
target_compile_options(godot-thirdparty-misc PRIVATE -w)
#HACK Only for linux
target_include_directories(godot-thirdparty-misc PRIVATE ${GODOT_ENGINE_ROOT_DIRECTORY} ${GODOT_ENGINE_ROOT_DIRECTORY}/platform/linuxbsd)

####################################
#msdfgen
####################################
set(MSDFGEN_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/msdfgen)
set(MSDFGEN_SOURCE
    ${MSDFGEN_SOURCE_DIR}/core/sdf-error-estimation.h
    ${MSDFGEN_SOURCE_DIR}/core/save-bmp.h
    ${MSDFGEN_SOURCE_DIR}/core/pixel-conversion.hpp
    ${MSDFGEN_SOURCE_DIR}/core/Shape.h
    ${MSDFGEN_SOURCE_DIR}/core/MSDFErrorCorrection.h
    ${MSDFGEN_SOURCE_DIR}/core/generator-config.h
    ${MSDFGEN_SOURCE_DIR}/core/EdgeColor.h
    ${MSDFGEN_SOURCE_DIR}/core/edge-segments.h
    ${MSDFGEN_SOURCE_DIR}/core/Contour.cpp
    ${MSDFGEN_SOURCE_DIR}/core/render-sdf.h
    ${MSDFGEN_SOURCE_DIR}/core/Contour.h
    ${MSDFGEN_SOURCE_DIR}/core/shape-description.cpp
    ${MSDFGEN_SOURCE_DIR}/core/save-tiff.cpp
    ${MSDFGEN_SOURCE_DIR}/core/arithmetics.hpp
    ${MSDFGEN_SOURCE_DIR}/core/rasterization.cpp
    ${MSDFGEN_SOURCE_DIR}/core/msdf-error-correction.cpp
    ${MSDFGEN_SOURCE_DIR}/core/equation-solver.cpp
    ${MSDFGEN_SOURCE_DIR}/core/edge-segments.cpp
    ${MSDFGEN_SOURCE_DIR}/core/BitmapRef.hpp
    ${MSDFGEN_SOURCE_DIR}/core/MSDFErrorCorrection.cpp
    ${MSDFGEN_SOURCE_DIR}/core/Projection.h
    ${MSDFGEN_SOURCE_DIR}/core/edge-selectors.cpp
    ${MSDFGEN_SOURCE_DIR}/core/edge-coloring.h
    ${MSDFGEN_SOURCE_DIR}/core/Shape.cpp
    ${MSDFGEN_SOURCE_DIR}/core/msdfgen.cpp
    ${MSDFGEN_SOURCE_DIR}/core/EdgeHolder.h
    ${MSDFGEN_SOURCE_DIR}/core/ShapeDistanceFinder.h
    ${MSDFGEN_SOURCE_DIR}/core/Scanline.h
    ${MSDFGEN_SOURCE_DIR}/core/Vector2.cpp
    ${MSDFGEN_SOURCE_DIR}/core/ShapeDistanceFinder.hpp
    ${MSDFGEN_SOURCE_DIR}/core/equation-solver.h
    ${MSDFGEN_SOURCE_DIR}/core/msdf-error-correction.h
    ${MSDFGEN_SOURCE_DIR}/core/EdgeHolder.cpp
    ${MSDFGEN_SOURCE_DIR}/core/sdf-error-estimation.cpp
    ${MSDFGEN_SOURCE_DIR}/core/contour-combiners.h
    ${MSDFGEN_SOURCE_DIR}/core/SignedDistance.cpp
    ${MSDFGEN_SOURCE_DIR}/core/save-tiff.h
    ${MSDFGEN_SOURCE_DIR}/core/contour-combiners.cpp
    ${MSDFGEN_SOURCE_DIR}/core/Bitmap.h
    ${MSDFGEN_SOURCE_DIR}/core/shape-description.h
    ${MSDFGEN_SOURCE_DIR}/core/bitmap-interpolation.hpp
    ${MSDFGEN_SOURCE_DIR}/core/SignedDistance.h
    ${MSDFGEN_SOURCE_DIR}/core/Bitmap.hpp
    ${MSDFGEN_SOURCE_DIR}/core/Projection.cpp
    ${MSDFGEN_SOURCE_DIR}/core/edge-selectors.h
    ${MSDFGEN_SOURCE_DIR}/core/rasterization.h
    ${MSDFGEN_SOURCE_DIR}/core/Vector2.h
    ${MSDFGEN_SOURCE_DIR}/core/edge-coloring.cpp
    ${MSDFGEN_SOURCE_DIR}/core/Scanline.cpp
    ${MSDFGEN_SOURCE_DIR}/core/render-sdf.cpp
    ${MSDFGEN_SOURCE_DIR}/core/save-bmp.cpp
    ${MSDFGEN_SOURCE_DIR}/msdfgen.h
    )
godot_add_library(msdfgen thirdparty STATIC ${MSDFGEN_SOURCE})
target_include_directories(msdfgen PUBLIC ${MSDFGEN_SOURCE_DIR})

####################################
#noise
####################################
godot_add_library(noise thirdparty INTERFACE ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/noise/FastNoiseLite.h)

####################################
#oidn
####################################
add_subdirectory(oidn)

####################################
#openxr
####################################
add_subdirectory(openxr)

####################################
#pcre
####################################
add_subdirectory(pcre2)

####################################
#recastnavigation
####################################
set(RECAST_NAVIGATION_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/recastnavigation)
set(RECAST_NAVIGATION_SOURCE
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Include/RecastAssert.h
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Include/RecastAlloc.h
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Include/Recast.h
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastRegion.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastLayers.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastAlloc.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/Recast.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastMeshDetail.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastArea.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastContour.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastMesh.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastAssert.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastRasterization.cpp
    ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Source/RecastFilter.cpp
    )
godot_add_library(recast-navigation thirdparty STATIC ${RECAST_NAVIGATION_SOURCE})
target_include_directories(recast-navigation PUBLIC ${RECAST_NAVIGATION_SOURCE_DIR}/Recast/Include)

####################################
#rvo
####################################
set(RVO2_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/rvo2)
set(RVO2_SOURCE
    ${RVO2_SOURCE_DIR}/Agent.cpp
    ${RVO2_SOURCE_DIR}/Agent.h
    ${RVO2_SOURCE_DIR}/Definitions.h
    ${RVO2_SOURCE_DIR}/KdTree.cpp
    ${RVO2_SOURCE_DIR}/KdTree.h
    ${RVO2_SOURCE_DIR}/Vector3.h
    )
godot_add_library(rvo2 thirdparty STATIC ${RVO2_SOURCE})
target_include_directories(rvo2 PUBLIC ${RVO2_SOURCE_DIR})


####################################
#spirv-reflect
####################################
set(SPIRV_REFLECT_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/spirv-reflect)
set(SPIRV_REFLECT_SOURCE
    ${SPIRV_REFLECT_SOURCE_DIR}/include/spirv/unified1/spirv.h
    ${SPIRV_REFLECT_SOURCE_DIR}/spirv_reflect.c
    ${SPIRV_REFLECT_SOURCE_DIR}/spirv_reflect.h
    )
godot_add_library(spirv-reflect thirdparty STATIC ${SPIRV_REFLECT_SOURCE})
target_include_directories(spirv-reflect PUBLIC ${SPIRV_REFLECT_SOURCE_DIR}/include)

####################################
#squish
####################################
set(SQUISH_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/squish)
set(SQUISH_SOURCE
    ${SQUISH_SOURCE_DIR}/alpha.cpp
    ${SQUISH_SOURCE_DIR}/alpha.h
    ${SQUISH_SOURCE_DIR}/clusterfit.cpp
    ${SQUISH_SOURCE_DIR}/clusterfit.h
    ${SQUISH_SOURCE_DIR}/colourblock.cpp
    ${SQUISH_SOURCE_DIR}/colourblock.h
    ${SQUISH_SOURCE_DIR}/colourfit.cpp
    ${SQUISH_SOURCE_DIR}/colourfit.h
    ${SQUISH_SOURCE_DIR}/colourset.cpp
    ${SQUISH_SOURCE_DIR}/colourset.h
    ${SQUISH_SOURCE_DIR}/config.h
    ${SQUISH_SOURCE_DIR}/maths.cpp
    ${SQUISH_SOURCE_DIR}/maths.h
    ${SQUISH_SOURCE_DIR}/rangefit.cpp
    ${SQUISH_SOURCE_DIR}/rangefit.h
    ${SQUISH_SOURCE_DIR}/simd_float.h
    ${SQUISH_SOURCE_DIR}/simd.h
    ${SQUISH_SOURCE_DIR}/simd_sse.h
    ${SQUISH_SOURCE_DIR}/simd_ve.h
    ${SQUISH_SOURCE_DIR}/singlecolourfit.cpp
    ${SQUISH_SOURCE_DIR}/singlecolourfit.h
    ${SQUISH_SOURCE_DIR}/squish.cpp
    ${SQUISH_SOURCE_DIR}/squish.h
    )
godot_add_library(squish thirdparty STATIC ${SQUISH_SOURCE})
target_include_directories(squish PUBLIC ${SQUISH_SOURCE_DIR})

####################################
#thorvg
####################################
set(THORVG_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/thorvg)
set(THORVG_SOURCE
    ${THORVG_SOURCE_DIR}/inc/config.h
    ${THORVG_SOURCE_DIR}/inc/thorvg.h
    ${THORVG_SOURCE_DIR}/src/savers/tvg/tvgTvgSaver.h
    ${THORVG_SOURCE_DIR}/src/savers/tvg/tvgTvgSaver.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgLoader.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgLoadModule.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgInitializer.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgBinaryDesc.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgTaskScheduler.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgCommon.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgLzw.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgGlCanvas.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgRender.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgLoader.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgSwCanvas.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgShape.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgLzw.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgSaver.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgScene.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgBezier.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgCanvas.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgRender.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgLinearGradient.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwStroke.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRasterAvx.h
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwMemPool.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRaster.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRenderer.h
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRle.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRasterNeon.h
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRenderer.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwShape.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwMath.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwFill.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwCommon.h
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRasterC.h
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwImage.cpp
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRasterTexmap.h
    ${THORVG_SOURCE_DIR}/src/lib/sw_engine/tvgSwRasterTexmapInternal.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgSceneImpl.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgSaveModule.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgPaint.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgPaint.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgArray.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgFill.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgPictureImpl.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgMath.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgIteratorAccessor.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgCanvasImpl.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgAccessor.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgTaskScheduler.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgPicture.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgFill.cpp
    ${THORVG_SOURCE_DIR}/src/lib/tvgBezier.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgShapeImpl.h
    ${THORVG_SOURCE_DIR}/src/lib/tvgRadialGradient.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/tvg/tvgTvgCommon.h
    ${THORVG_SOURCE_DIR}/src/loaders/tvg/tvgTvgBinInterpreter.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/tvg/tvgTvgLoader.h
    ${THORVG_SOURCE_DIR}/src/loaders/tvg/tvgTvgLoader.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/external_png/tvgPngLoader.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/external_png/tvgPngLoader.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgUtil.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgSceneBuilder.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgSceneBuilder.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgLoaderCommon.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgUtil.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgLoader.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgCssStyle.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgCssStyle.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgPath.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgXmlParser.h
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgPath.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgSvgLoader.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/svg/tvgXmlParser.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/raw/tvgRawLoader.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/raw/tvgRawLoader.h
    ${THORVG_SOURCE_DIR}/src/loaders/jpg/tvgJpgd.h
    ${THORVG_SOURCE_DIR}/src/loaders/jpg/tvgJpgLoader.cpp
    ${THORVG_SOURCE_DIR}/src/loaders/jpg/tvgJpgLoader.h
    ${THORVG_SOURCE_DIR}/src/loaders/jpg/tvgJpgd.cpp
    )
godot_add_library(thorvg thirdparty STATIC ${THORVG_SOURCE})
target_include_directories(thorvg PUBLIC ${THORVG_SOURCE_DIR}/inc)
target_include_directories(thorvg PUBLIC
                                ${THORVG_SOURCE_DIR}/src/lib
                                ${THORVG_SOURCE_DIR}/src/lib/sw_engine
                                ${THORVG_SOURCE_DIR}/src/savers/tvg
                                #Loaders
                                ${THORVG_SOURCE_DIR}/src/loaders/svg
                                ${THORVG_SOURCE_DIR}/src/loaders/jpg
                                ${THORVG_SOURCE_DIR}/src/loaders/raw
                                ${THORVG_SOURCE_DIR}/src/loaders/tvg
                                ${THORVG_SOURCE_DIR}/src/loaders/external_png)
target_link_libraries(thorvg PUBLIC png)

####################################
#tinyexr
####################################
set(TINY_EXR_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/tinyexr)
SET(TINY_EXR_SOURCE
    ${TINY_EXR_SOURCE_DIR}/tinyexr.h
    ${TINY_EXR_SOURCE_DIR}/tinyexr.cc
    )
godot_add_library(tinyexr thirdparty STATIC ${TINY_EXR_SOURCE})
target_compile_definitions(tinyexr PRIVATE -DTINYEXR_USE_MINIZ=0)
target_include_directories(tinyexr PUBLIC ${TINY_EXR_SOURCE_DIR})
target_link_libraries(tinyexr PRIVATE zlib)

####################################
#vhacd
####################################
set(VHACD_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/vhacd)
set(VHACD_SOURCE
    ${VHACD_SOURCE_DIR}/inc/vhacdRaycastMesh.h
    ${VHACD_SOURCE_DIR}/inc/vhacdICHull.h
    ${VHACD_SOURCE_DIR}/inc/btMinMax.h
    ${VHACD_SOURCE_DIR}/inc/vhacdManifoldMesh.h
    ${VHACD_SOURCE_DIR}/inc/vhacdTimer.h
    ${VHACD_SOURCE_DIR}/inc/vhacdVolume.h
    ${VHACD_SOURCE_DIR}/inc/vhacdCircularList.inl
    ${VHACD_SOURCE_DIR}/inc/btVector3.h
    ${VHACD_SOURCE_DIR}/inc/vhacdVHACD.h
    ${VHACD_SOURCE_DIR}/inc/btAlignedObjectArray.h
    ${VHACD_SOURCE_DIR}/inc/vhacdSArray.h
    ${VHACD_SOURCE_DIR}/inc/vhacdCircularList.h
    ${VHACD_SOURCE_DIR}/inc/FloatMath.h
    ${VHACD_SOURCE_DIR}/inc/vhacdVector.inl
    ${VHACD_SOURCE_DIR}/inc/vhacdMesh.h
    ${VHACD_SOURCE_DIR}/inc/vhacdMutex.h
    ${VHACD_SOURCE_DIR}/inc/btAlignedAllocator.h
    ${VHACD_SOURCE_DIR}/inc/vhacdVector.h
    ${VHACD_SOURCE_DIR}/inc/btScalar.h
    ${VHACD_SOURCE_DIR}/inc/btConvexHullComputer.h
    ${VHACD_SOURCE_DIR}/LICENSE
    ${VHACD_SOURCE_DIR}/public/VHACD.h
    ${VHACD_SOURCE_DIR}/src/vhacdVolume.cpp
    ${VHACD_SOURCE_DIR}/src/VHACD-ASYNC.cpp
    ${VHACD_SOURCE_DIR}/src/FloatMath.inl
    ${VHACD_SOURCE_DIR}/src/vhacdRaycastMesh.cpp
    ${VHACD_SOURCE_DIR}/src/btAlignedAllocator.cpp
    ${VHACD_SOURCE_DIR}/src/btConvexHullComputer.cpp
    ${VHACD_SOURCE_DIR}/src/vhacdICHull.cpp
    ${VHACD_SOURCE_DIR}/src/vhacdMesh.cpp
    ${VHACD_SOURCE_DIR}/src/FloatMath.cpp
    ${VHACD_SOURCE_DIR}/src/VHACD.cpp
    ${VHACD_SOURCE_DIR}/src/vhacdManifoldMesh.cpp
    )
godot_add_library(vhacd thirdparty STATIC ${VHACD_SOURCE})
target_include_directories(vhacd PUBLIC ${VHACD_SOURCE_DIR}/inc)

####################################
#volk
####################################
add_subdirectory(volk)

####################################
#vulkan
####################################
add_subdirectory(vulkan)

####################################
#wslay
####################################
set(WSLAY_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/wslay)
set(WSLAY_SOURCE
    ${WSLAY_SOURCE_DIR}/config.h
    ${WSLAY_SOURCE_DIR}/wslay/wslayver.h
    ${WSLAY_SOURCE_DIR}/wslay/wslay.h
    ${WSLAY_SOURCE_DIR}/wslay_event.c
    ${WSLAY_SOURCE_DIR}/wslay_event.h
    ${WSLAY_SOURCE_DIR}/wslay_frame.c
    ${WSLAY_SOURCE_DIR}/wslay_frame.h
    ${WSLAY_SOURCE_DIR}/wslay_macro.h
    ${WSLAY_SOURCE_DIR}/wslay_net.c
    ${WSLAY_SOURCE_DIR}/wslay_net.h
    ${WSLAY_SOURCE_DIR}/wslay_queue.c
    ${WSLAY_SOURCE_DIR}/wslay_queue.h
    )
godot_add_library(wslay thirdparty STATIC ${WSLAY_SOURCE})
target_include_directories(wslay PUBLIC ${WSLAY_SOURCE_DIR})
target_compile_definitions(wslay PRIVATE -DHAVE_CONFIG_H=1)
target_compile_options(wslay PRIVATE -w)

####################################
#xatlas
####################################
set(XATLAS_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/xatlas)
set(XATLAS_SOURCE
    ${XATLAS_SOURCE_DIR}/xatlas.h
    ${XATLAS_SOURCE_DIR}/xatlas.cpp
    )
godot_add_library(xatlas thirdparty STATIC ${XATLAS_SOURCE})

####################################
#zlib
####################################
set(ZLIB_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/zlib)
set(ZLIB_SOURCE
    ${ZLIB_SOURCE_DIR}/adler32.c
    ${ZLIB_SOURCE_DIR}/compress.c
    ${ZLIB_SOURCE_DIR}/crc32.c
    ${ZLIB_SOURCE_DIR}/crc32.h
    ${ZLIB_SOURCE_DIR}/deflate.c
    ${ZLIB_SOURCE_DIR}/deflate.h
    ${ZLIB_SOURCE_DIR}/gzclose.c
    ${ZLIB_SOURCE_DIR}/gzguts.h
    ${ZLIB_SOURCE_DIR}/gzlib.c
    ${ZLIB_SOURCE_DIR}/gzread.c
    ${ZLIB_SOURCE_DIR}/gzwrite.c
    ${ZLIB_SOURCE_DIR}/infback.c
    ${ZLIB_SOURCE_DIR}/inffast.c
    ${ZLIB_SOURCE_DIR}/inffast.h
    ${ZLIB_SOURCE_DIR}/inffixed.h
    ${ZLIB_SOURCE_DIR}/inflate.c
    ${ZLIB_SOURCE_DIR}/inflate.h
    ${ZLIB_SOURCE_DIR}/inftrees.c
    ${ZLIB_SOURCE_DIR}/inftrees.h
    ${ZLIB_SOURCE_DIR}/trees.c
    ${ZLIB_SOURCE_DIR}/trees.h
    ${ZLIB_SOURCE_DIR}/uncompr.c
    ${ZLIB_SOURCE_DIR}/zconf.h
    ${ZLIB_SOURCE_DIR}/zlib.h
    ${ZLIB_SOURCE_DIR}/zutil.c
    ${ZLIB_SOURCE_DIR}/zutil.h
    )
godot_add_library(zlib thirdparty STATIC ${ZLIB_SOURCE})
target_include_directories(zlib PUBLIC ${ZLIB_SOURCE_DIR})
target_compile_options(zlib PRIVATE -w)

####################################
#zstd
####################################
set(ZSTD_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/zstd)
set(ZSTD_SOURCE
    ${ZSTD_SOURCE_DIR}/common/zstd_trace.h
    ${ZSTD_SOURCE_DIR}/common/pool.h
    ${ZSTD_SOURCE_DIR}/common/mem.h
    ${ZSTD_SOURCE_DIR}/common/compiler.h
    ${ZSTD_SOURCE_DIR}/common/debug.c
    ${ZSTD_SOURCE_DIR}/common/entropy_common.c
    ${ZSTD_SOURCE_DIR}/common/huf.h
    ${ZSTD_SOURCE_DIR}/common/error_private.c
    ${ZSTD_SOURCE_DIR}/common/error_private.h
    ${ZSTD_SOURCE_DIR}/common/zstd_internal.h
    ${ZSTD_SOURCE_DIR}/common/cpu.h
    ${ZSTD_SOURCE_DIR}/common/zstd_deps.h
    ${ZSTD_SOURCE_DIR}/common/fse_decompress.c
    ${ZSTD_SOURCE_DIR}/common/zstd_common.c
    ${ZSTD_SOURCE_DIR}/common/bitstream.h
    ${ZSTD_SOURCE_DIR}/common/xxhash.c
    ${ZSTD_SOURCE_DIR}/common/portability_macros.h
    ${ZSTD_SOURCE_DIR}/common/threading.h
    ${ZSTD_SOURCE_DIR}/common/pool.c
    ${ZSTD_SOURCE_DIR}/common/threading.c
    ${ZSTD_SOURCE_DIR}/common/debug.h
    ${ZSTD_SOURCE_DIR}/common/fse.h
    ${ZSTD_SOURCE_DIR}/common/xxhash.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress_internal.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_ldm.c
    ${ZSTD_SOURCE_DIR}/compress/zstdmt_compress.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_opt.c
    ${ZSTD_SOURCE_DIR}/compress/fse_compress.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_fast.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_double_fast.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_fast.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress_sequences.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_double_fast.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress_superblock.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_cwksp.h
    ${ZSTD_SOURCE_DIR}/compress/hist.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress_literals.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_ldm.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_lazy.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_ldm_geartab.h
    ${ZSTD_SOURCE_DIR}/compress/huf_compress.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress_sequences.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_opt.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress_superblock.h
    ${ZSTD_SOURCE_DIR}/compress/zstd_lazy.h
    ${ZSTD_SOURCE_DIR}/compress/hist.h
    ${ZSTD_SOURCE_DIR}/compress/zstdmt_compress.c
    ${ZSTD_SOURCE_DIR}/compress/zstd_compress_literals.h
    ${ZSTD_SOURCE_DIR}/compress/clevels.h
    ${ZSTD_SOURCE_DIR}/decompress/zstd_decompress_block.h
    ${ZSTD_SOURCE_DIR}/decompress/zstd_ddict.c
    ${ZSTD_SOURCE_DIR}/decompress/huf_decompress_amd64.S
    ${ZSTD_SOURCE_DIR}/decompress/zstd_decompress_block.c
    ${ZSTD_SOURCE_DIR}/decompress/zstd_ddict.h
    ${ZSTD_SOURCE_DIR}/decompress/zstd_decompress_internal.h
    ${ZSTD_SOURCE_DIR}/decompress/zstd_decompress.c
    ${ZSTD_SOURCE_DIR}/decompress/huf_decompress.c
    ${ZSTD_SOURCE_DIR}/zstd_errors.h
    ${ZSTD_SOURCE_DIR}/zstd.h
    )
godot_add_library(zstd thirdparty STATIC ${ZSTD_SOURCE})
target_include_directories(zstd PUBLIC ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR} ${ZSTD_SOURCE_DIR})
#HACK
target_compile_definitions(zstd PRIVATE ZSTD_DISABLE_ASM=1)

####################################
#jpeg-compressor
####################################
add_subdirectory(jpeg-compressor)