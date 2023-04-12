#Enforce the highest possible version that the current Ubuntu LTS provides
#by default. We want to be sure to have the ability to attach as many things
#to the target as modern cmake code affords us
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

####################################
#pcre
####################################
set(PCRE2_SOURCE_DIR ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/pcre2)
set(PCRE2_SOURCE
    ${PCRE2_SOURCE_DIR}/src/pcre2_convert.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_auto_possess.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_jit_neon_inc.h
    ${PCRE2_SOURCE_DIR}/src/pcre2_xclass.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_newline.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_extuni.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_ucd.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_substring.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_config.c
    #inlined
    #${PCRE2_SOURCE_DIR}/src/pcre2_jit_misc.c
    #${PCRE2_SOURCE_DIR}/src/pcre2_jit_match.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_maketables.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_ucptables.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_serialize.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_ord2utf.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_pattern_info.c
    ${PCRE2_SOURCE_DIR}/src/config.h
    ${PCRE2_SOURCE_DIR}/src/pcre2_compile.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_context.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_match.c
    ${PCRE2_SOURCE_DIR}/src/pcre2.h
    ${PCRE2_SOURCE_DIR}/src/pcre2_jit_compile.c
    #Unsupported platforms
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeMIPS_32.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeMIPS_64.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeMIPS_common.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeS390X.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeARM_32.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeARM_T2_32.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeSPARC_common.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativePPC_32.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativePPC_common.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeSPARC_32.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativePPC_64.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeARM_64.c
    #Unused
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitExecAllocator.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitProtExecAllocator.c
    #${PCRE2_SOURCE_DIR}/src/pcre2_jit_simd_inc.h
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitLir.h
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitLir.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeX86_32.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeX86_common.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitConfigInternal.h
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitConfig.h
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitWXExecAllocator.c
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitUtils.c
    #Inlined
    #${PCRE2_SOURCE_DIR}/src/sljit/sljitNativeX86_64.c

    ${PCRE2_SOURCE_DIR}/src/pcre2_study.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_internal.h
    ${PCRE2_SOURCE_DIR}/src/pcre2_tables.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_valid_utf.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_chartables.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_match_data.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_ucp.h
    ${PCRE2_SOURCE_DIR}/src/pcre2_dfa_match.c
    
    ${PCRE2_SOURCE_DIR}/src/pcre2_intmodedep.h
    ${PCRE2_SOURCE_DIR}/src/pcre2_substitute.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_script_run.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_error.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_find_bracket.c
    ${PCRE2_SOURCE_DIR}/src/pcre2_string_utils.c
    )
godot_add_library(pcre2 thirdparty STATIC ${PCRE2_SOURCE})
target_precompile_headers(pcre2 PRIVATE ${PCRE2_SOURCE_DIR}/src/config.h ${PCRE2_SOURCE_DIR}/src/sljit/sljitConfigInternal.h)
target_compile_definitions(pcre2 PUBLIC
                                #PCRE2_CODE_UNIT_WIDTH=16
                                #this may also be needed
                                PCRE2_CODE_UNIT_WIDTH=32
                                HAVE_CONFIG_H=1
                                SLJIT_VERBOSE=0
                                PCRE2_STATIC)
target_include_directories(pcre2 PUBLIC ${PCRE2_SOURCE_DIR}/src)
