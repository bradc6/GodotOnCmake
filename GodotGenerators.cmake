###
### CMake script for running code generators
###

find_package (Python COMPONENTS Interpreter REQUIRED)

#Python script for generating sources
set(GLSL_GENERATOR_SCRIPT ${ENGINE_EXTERNAL_PROJECT_DIRECTORY}/glsl_builders.py)

function(GENERATE_SHADER_SOURCES _buildType _input _output)
    foreach(_inputFile _outputFile IN ZIP_LISTS _input _output)
        add_custom_command(
            OUTPUT ${_outputFile}
            COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
            ARGS --buildType ${_buildType} --input ${_inputFile} --output ${_outputFile}
            DEPENDS ${_inputFile}
            COMMENT "Generating ${_buildType} from ${_inputFile}"
            )
        set_source_files_properties(${_outputFile} PROPERTIES GENERATED TRUE)

    endforeach()
endfunction()


#Core Methods are those encapsulated within the Core methods.py that generates things
#like the authors and donors list
function(GENERATE_CORE_SOURCES _buildType _input _output)
    foreach(_inputFile _outputFile IN ZIP_LISTS _input _output)
        add_custom_command(
            OUTPUT ${_outputFile}
            COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
            ARGS --buildType ${_buildType} --input ${_inputFile} --output ${_outputFile}
            DEPENDS ${_inputFile}
            COMMENT "Generating ${_buildType} from ${_inputFile}"
            )
        set_source_files_properties(${_outputFile} PROPERTIES GENERATED TRUE)
    endforeach()
endfunction()

function(GENERATE_CORE_DISABLED_CLASSES _disabledClasses _output)
        add_custom_command(
            OUTPUT ${_output}
            COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
            ARGS --buildType disabled_classes --output ${_output}
            COMMENT "Generating disabled_classes from ${_inputFile}"
            )
        set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_CORE_CONTROLLER_MAPPINGS_SOURCES _gameControllerDB _godotControllerDB _output)
    foreach(_inputFile _outputFile IN ZIP_LISTS _input _output)
        add_custom_command(
            OUTPUT ${_outputFile}
            COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
            ARGS --buildType controller_mappings --input ${_gameControllerDB} --input2 ${_godotControllerDB} --output ${_outputFile}
            DEPENDS ${_gameControllerDB} ${_godotControllerDB}
            COMMENT "Generating controller_mappings from ${_inputFile}"
            )
        set_source_files_properties(${_outputFile} PROPERTIES GENERATED TRUE)
    endforeach()
endfunction()

#Main Builders Methods are those encapsulated within the Core methods.py that generates things
#like the authors and donors list
function(GENERATE_MAIN_EXECUTABLE_SOURCES _buildType _input _output)
    foreach(_inputFile _outputFile IN ZIP_LISTS _input _output)
        add_custom_command(
            OUTPUT ${_outputFile}
            COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
            ARGS --buildType ${_buildType} --input ${_inputFile} --output ${_outputFile}
            DEPENDS ${_inputFile}
            COMMENT "Generating ${_buildType} from ${_inputFile}"
            )
        set_source_files_properties(${_outputFile} PROPERTIES GENERATED TRUE)
    endforeach()
endfunction()

function(GENERATE_LICENSE_FILE _copyrightFile _licenseFile _output)
    add_custom_command(
        OUTPUT ${_output}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType license_header --input ${_licenseFile} --input2 ${_copyrightFile} --output ${_output}
        DEPENDS ${_copyrightFile} ${_licenseFile}
        COMMENT "Generating license file to ${_output}"
        )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_RESOURCE_SCENE_SOURCES _buildType _input _output)
    foreach(_inputFile _outputFile IN ZIP_LISTS _input _output)
        add_custom_command(
            OUTPUT ${_outputFile}
            COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
            ARGS --buildType ${_buildType} --input ${_inputFile} --output ${_outputFile}
            DEPENDS ${_inputFile}
            COMMENT "Generating ${_buildType} from ${_inputFile}"
            )
        set_source_files_properties(${_outputFile} PROPERTIES GENERATED TRUE)
    endforeach()
endfunction()

function(GENERATE_RESOURCE_THEME_ICONS _input _output)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType resource_make_default_theme_icons --output ${_output} --input ${SOURCE_SVG_INPUT_STRING}
    DEPENDS ${_input}
    COMMENT "Generating default theme apps to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_PLATFORM_LOGOS_AND_RUN_ICON _platformName _svgType _inputFileName _outputFileName)
    add_custom_command(
    OUTPUT ${_outputFileName}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType platform_svg_exporter_generator --input ${_platformName} --input2 ${_svgType} --input3 ${_inputFileName} --output ${_outputFileName}
    DEPENDS ${_input}
    COMMENT "Generating default theme apps to  ${_outputFileName}"
    VERBATIM
    )
    set_source_files_properties(${_outputFileName} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_ICU_FONT_DATA _input _output)
    add_custom_command(
        OUTPUT ${_output}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType make_icu_data --input ${_input} --output ${_output}
        DEPENDS ${_input}
        COMMENT "Generating license file to ${_output}"
        )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_DENOISE_TZA_TO_CPP _input _output)
    add_custom_command(
        OUTPUT ${_output}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType denoise_tza_to_cpp --input ${_input} --output ${_output}
        DEPENDS ${_input}
        COMMENT "Generating tza to cpp file to ${_output}"
        )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_EDITOR_BUILTIN_FONTS _input _output)
    set(SOURCE_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_INPUT_STRING ${SOURCE_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType godot_editor_builtin_fonts --output ${_output} --input ${SOURCE_INPUT_STRING}
    DEPENDS ${_input}
    COMMENT "Generating default theme apps to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_DOCUMENTATION_COMPRESSED _input _output _tempFileOutput)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    file(WRITE ${_tempFileOutput} ${SOURCE_SVG_INPUT_STRING})

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_documentation_header_compressed --output ${_output} --input ${_tempFileOutput}
    DEPENDS ${_input}
    COMMENT "Generating documentation compressed to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_EDITOR_ICONS_HEADER _input _output _tempFileOutput)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    file(WRITE ${_tempFileOutput} ${SOURCE_SVG_INPUT_STRING})

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_editor_icons_action --output ${_output} --input ${_tempFileOutput}
    DEPENDS ${_input}
    COMMENT "Generating documentation compressed to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_EDITOR_TRANSLATIONS_HEADER _input _output)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_editor_translations --output ${_output} --input ${SOURCE_SVG_INPUT_STRING}
    DEPENDS ${_input}
    COMMENT "Generating documentation compressed to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_EDITOR_TRANSLATIONS_PROPERTIES_HEADER _input _output)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_editor_properties_translations --output ${_output} --input ${SOURCE_SVG_INPUT_STRING}
    DEPENDS ${_input}
    COMMENT "Generating documentation compressed to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_EDITOR_TRANSLATIONS_DOCUMENTATIONS_HEADER _input _output)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_editor_documentation_translations --output ${_output} --input ${SOURCE_SVG_INPUT_STRING}
    DEPENDS ${_input}
    COMMENT "Generating documentation compressed to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_VERSION_INFORMATION _output _output2)
    add_custom_command(
    OUTPUT ${_output} ${_output2}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_version_data_headers --output ${_output} --output2 ${_output2}
    COMMENT "Generating documentation compressed to  ${_output} + ${_output2}"
    WORKING_DIRECTORY ${GODOT_ENGINE_ROOT_DIRECTORY}
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
    set_source_files_properties(${_output2} PROPERTIES GENERATED TRUE)
endfunction()


function(GENERATE_SCRIPT_ENCRYPTION_HEADER _encryptionKey _output)
    add_custom_command(
    OUTPUT ${_output} ${_output2}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    #TODO add input back in
    ARGS --buildType make_script_encryption_header  --output ${_output}
    COMMENT "Generating documentation compressed to  ${_output}"
    WORKING_DIRECTORY ${GODOT_ENGINE_ROOT_DIRECTORY}
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_GODOT_SCRIPT_INTERFACE_DUMP _input _output)
    add_custom_command(
        OUTPUT ${_output}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType gdextension_interface_dumper --input ${_input} --output ${_output}
        DEPENDS ${_input}
        COMMENT "Generating gdextension file to ${_output}"
        )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_GODOT_EXTENSION_WRAPPERS _output)
    add_custom_command(
        OUTPUT ${_output}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType make_extension_wrapper --output ${_output}
        DEPENDS ${_input}
        COMMENT "Generating gdextension wrappers file to ${_output}"
        WORKING_DIRECTORY ${GODOT_ENGINE_ROOT_DIRECTORY}
        )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_GODOT_GDSCRIPT_VIRTUALS _output)
    add_custom_command(
        OUTPUT ${_output}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType make_gdscript_virtuals --output ${_output}
        DEPENDS ${_input}
        COMMENT "Generating gdscript virtuals file to ${_output}"
        WORKING_DIRECTORY ${GODOT_ENGINE_ROOT_DIRECTORY}
        )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_GODOT_GDSCRIPT_EDITOR_TEMPLATES _input _output)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_editor_gdscript_templates --output ${_output} --input ${SOURCE_SVG_INPUT_STRING}
    DEPENDS ${_input}
    COMMENT "Generating gdscript templates to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_GODOT_REGISTER_PLATFORM_APIS _output)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_input})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
    OUTPUT ${_output}
    COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
    ARGS --buildType make_register_platform_apis --output ${_output}
    #DEPENDS ${_input}
    COMMENT "Generating gdscript templates to  ${_output}"
    VERBATIM
    )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_GODOT_EDITOR_PLATFORM_EXPORTERS _inputPlatforms _output)
    set(SOURCE_SVG_INPUT_STRING "")
    foreach(_inputFile IN ITEMS ${_inputPlatforms})
        string(CONCAT SOURCE_SVG_INPUT_STRING ${SOURCE_SVG_INPUT_STRING} "${_inputFile} ")
    endforeach()

    add_custom_command(
        OUTPUT ${_output}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType make_editor_platform_exporters --output ${_output} --input ${SOURCE_SVG_INPUT_STRING}
        #DEPENDS ${_inputPlatforms}
        COMMENT "Generating godot editor platform exporters file to ${_output}"
        WORKING_DIRECTORY ${GODOT_ENGINE_ROOT_DIRECTORY}
        )
    set_source_files_properties(${_output} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_ENABLED_MODULES_AND_REGISTER _inputGodotRootEngineDir _customGodotEngineModulesDirectory _modulesEnabledHeader _registerModuleTypeCPP)
    add_custom_command(
        OUTPUT ${_modulesEnabledHeader} ${_registerModuleTypeCPP}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType make_modules_enabled_and_types --input ${_inputGodotRootEngineDir} --input2 ${_customGodotEngineModulesDirectory} --output ${_registerModuleTypeCPP} --output2 ${_modulesEnabledHeader}
        #DEPENDS ${_inputPlatforms}
        COMMENT "Generating godot editor platform exporters file to ${_output}"
        WORKING_DIRECTORY ${GODOT_ENGINE_ROOT_DIRECTORY}
        )
    set_source_files_properties(${_modulesEnabledHeader} PROPERTIES GENERATED TRUE)
    set_source_files_properties(${_registerModuleTypeCPP} PROPERTIES GENERATED TRUE)
endfunction()

function(GENERATE_DOCUMENT_CLASS_PATHS _outputGeneratedDocClassPaths)
    add_custom_command(
        OUTPUT ${_outputGeneratedDocClassPaths}
        COMMAND ${Python_EXECUTABLE} ${GLSL_GENERATOR_SCRIPT}
        ARGS --buildType make_data_class_path --input "${GODOT_ENGINE_ROOT_DIRECTORY}/" --output ${_outputGeneratedDocClassPaths}
        #DEPENDS ${_inputPlatforms}
        COMMENT "Generating document data class file to ${_output}"
        WORKING_DIRECTORY ${GODOT_ENGINE_ROOT_DIRECTORY}
        )
    set_source_files_properties(${_outputGeneratedDocClassPaths} PROPERTIES GENERATED TRUE)
endfunction()