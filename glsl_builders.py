#!/usr/local/bin/python3.10
# See bottom of file for command examples

# System Modules
import os
import sys
import pathlib
import argparse

# Ensure that we have the required module paths to run our script
def _ImportSystemPath(newModulesSearchDirectory : str) -> bool:
    # Check if it's even valid
    if not os.path.isdir(newModulesSearchDirectory):
        return False

    absoluteModuleDirectory = os.path.abspath(newModulesSearchDirectory)

    if absoluteModuleDirectory not in sys.path:
        sys.path.insert(0, absoluteModuleDirectory)

# Setup system paths to correctly import the modules
_currentScriptDirectory = str(pathlib.Path(__file__).parent.resolve().as_posix())
_engineDirectory = str(pathlib.Path(_currentScriptDirectory).parent.resolve().as_posix())
_engineModulesDirectoryPath = f'{_engineDirectory}/Engine/'
_ImportSystemPath(_engineModulesDirectoryPath)

# Engine Modules
from glsl_builders import *
from gles3_builders import *
from core.core_builders import *
from methods import *
from core.input.input_builders import *
import core.extension.make_interface_dumper
import core.extension.make_wrappers

import core.object.make_virtuals
from main.main_builders import *
from scene.resources.default_theme.default_theme_builders import *
from scene.resources.default_theme.default_theme_icons_builders import *
from modules.denoise.resource_to_cpp import tza_to_cpp
from editor.editor_builders import *
from editor.icons.editor_icons_builders import *
import editor.template_builders
from modules.modules_builders import generate_modules_enabled

import glob as Glob

# Use simple std logging 
class log:
    scriptName = os.path.basename(sys.argv[0])
    def info(msg):
        print(f'{log.scriptName}: {msg}', file=sys.stdout)
    def error(msg):
        print(f'{log.scriptName}: {msg}', file=sys.stderr)

buildModeChoices = [
    'glsl',
    'gles3',
    'glsl_raw',
    'certs_header',
    'authors_header',
    'donors_header',
    'license_header',
    'disabled_classes',
    'controller_mappings',
    'gdextension_interface_dumper',
    'make_app_icon',
    'make_app_splash',
    'resource_scene_make_fonts_header',
    'resource_make_default_theme_icons',
    'platform_svg_exporter_generator',
    'make_icu_data',
    'denoise_tza_to_cpp',
    'godot_editor_builtin_fonts',
    'make_documentation_header_compressed',
    'make_editor_icons_action',
    'make_editor_translations',
    'make_editor_properties_translations',
    'make_editor_documentation_translations',
    'make_version_data_headers',
    'make_script_encryption_header',
    'make_extension_wrapper',
    'make_gdscript_virtuals',
    'make_editor_gdscript_templates',
    'make_register_platform_apis',
    'make_editor_platform_exporters',
    'make_modules_enabled_and_types',
    'make_data_class_path'
]

def _ParseArguments() -> (bool, argparse.Namespace):
    # Generate our parser
    parser = argparse.ArgumentParser()
    # Service configuration
    parser.add_argument('--buildType', dest="buildType", choices=buildModeChoices, required=True, action='store', help='Which type to build')
    parser.add_argument('--input', dest="inputFile", required=False, action='store', help='What file to use')
    parser.add_argument('--input2', dest="inputFile2", required=False, action='store', help='What file to use')
    parser.add_argument('--input3', dest="inputFile3", required=False, action='store', help='What file to use')
    parser.add_argument('--input4', dest="inputFile4", required=False, action='store', help='What file to use')
    parser.add_argument('--output', dest="outputFile", required=False, action='store', help='Where to output')
    parser.add_argument('--output2', dest="outputFile2", required=False, action='store', help='Where to output')
    # Parse what we got
    parsedArguments = parser.parse_args()

    # DEBUG - Print the raw args
    log.info("****************Found Arguments****************")
    for arg in vars(parsedArguments):
        log.info(f'{arg} : {getattr(parsedArguments, arg)}')
    log.info("***********************************************")

    log.info("Successfully parsed command line arguments")
    return (True, parsedArguments)

def _EntryPointAsScript() -> int:
    # Parse the arguments
    operationSuccess, parsedArguments = _ParseArguments()
    if not operationSuccess:
        log.error('Failed to parse command line arguments')
        return _ConsoleCodes.FailedToParseArguments 
    buildType = parsedArguments.buildType
    if parsedArguments.inputFile:
        inputFile = parsedArguments.inputFile
    else:
        inputFile = ""

    if parsedArguments.inputFile2:
        inputFile2 = parsedArguments.inputFile2
    else:
        inputFile2 = ""


    outputFile = parsedArguments.outputFile
    outputDir = pathlib.Path(outputFile).parent

    #HACK - bradc6
    # Check if it's even a valid file
    # inputPath = pathlib.Path(inputFile)
    # if not inputPath.is_file():
    #     log.error('Failed to find input file')
    #     return _ConsoleCodes.FailedToFindFile

    # Ensure output directory exists
    if not outputDir.exists():
        log.info(f'Creating directory: {outputDir.as_posix()}')
        try:
            outputDir.mkdir(parents=True, exist_ok=True)
        except:
            log.error(f'Unable to create directory: {outputDir.as_posix()}')
            return _ConsoleCodes.FailedToCreateDirectory

    # Check which type we're building
    if buildType == 'glsl':
        log.info('Starting building RD headers')
        build_rd_header(inputFile, outputFile, None)
        log.info('Finished building RD headers')
        log.info(f'Output: {outputFile}')

    if buildType == 'gles3':
        log.info('Starting building GLES3 headers')
        build_gles3_header(inputFile, include="drivers/gles3/shader_gles3.h", class_suffix="GLES3", optional_output_filename=outputFile)
        log.info('Finished building GLES3 headers')
        log.info(f'Output: {outputFile}')

    if buildType == 'glsl_raw':
        log.info('Starting building GLSL RAW headers')
        build_raw_header(filename=inputFile, optional_output_filename=outputFile)
        log.info('Finished building GLSL RAW headers')
        log.info(f'Output: {outputFile}')

    if buildType == 'certs_header':
        log.info('Starting building CERTS header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        #HACK - These need to be controlled
        environmentConfiguration = {}
        environmentConfiguration["builtin_certs"] = True
        environmentConfiguration["system_certs_path"] = ""

        make_certs_header(target=targetOutput, source=sourceInput, env=environmentConfiguration)
        log.info('Finished building CERTS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'authors_header':
        log.info('Starting building AUTHORS headers')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        make_authors_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building AUTHORS headers')
        log.info(f'Output: {outputFile}')

    if buildType == 'donors_header':
        log.info('Starting building DONORS header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        make_donors_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building DONORS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'license_header':
        log.info('Starting building LICENSE header')
        sourceInput = [inputFile2, inputFile]
        targetOutput = [outputFile]
        make_license_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building LICENSE header')
        log.info(f'Output: {outputFile}')

    if buildType == 'disabled_classes':
        log.info('Starting building DISABLED CLASSES header')
        disabledClasses = []
        write_disabled_classes(class_list=disabledClasses, output_filepath=str(outputFile))
        log.info('Finished building DISABLED CLASSES header')
        log.info(f'Output: {outputFile}')

    if buildType == 'controller_mappings':
        log.info('Starting building DEFAULT_CONTROLLER_MAPPINGS header')
        sourceInput = [inputFile, inputFile2]
        targetOutput = [outputFile]
        make_default_controller_mappings(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building DEFAULT_CONTROLLER_MAPPINGS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'gdextension_interface_dumper':
        log.info('Starting building GDEXTENSION header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        core.extension.make_interface_dumper.run(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building GDEXTENSION header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_app_icon':
        log.info('Starting building APPICON header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        make_app_icon(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building APPICON header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_app_splash':
        log.info('Starting building APPSPLASH EDITOR header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        make_splash(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building APPSPLASH EDITOR header')
        log.info(f'Output: {outputFile}')

    if buildType == 'resource_scene_make_fonts_header':
        log.info('Starting building SCENE RESOURCE DEFAULT FONT header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        make_fonts_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building SCENE RESOURCE DEFAULT FONT header')
        log.info(f'Output: {outputFile}')

    if buildType == 'resource_make_default_theme_icons':
        log.info('Starting building DEFAULT ICONS header')
        sourceInput = inputFile.split()
        targetOutput = [outputFile]
        make_default_theme_icons_action(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building DEFAULT ICONS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'platform_svg_exporter_generator':
        log.info('Starting building PLATFORM SVG header')
        write_active_platform_svg(platform_name=parsedArguments.inputFile, svg_type_name=parsedArguments.inputFile2, source_svg_filepath=parsedArguments.inputFile3, output_generated_header_filepath=parsedArguments.outputFile)
        log.info('Finished building PLATFORM SVG header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_icu_data':
        log.info('Starting building ICU DATA header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        make_icu_data(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building ICU DATA header')
        log.info(f'Output: {outputFile}')

    if buildType == 'denoise_tza_to_cpp':
        log.info('Starting building DENOISE RTLIGHTMAP HDR header')
        sourceInput = [inputFile]
        targetOutput = [outputFile]
        tza_to_cpp(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building DENOISE RTLIGHTMAP HDR header')
        log.info(f'Output: {outputFile}')

    if buildType == 'godot_editor_builtin_fonts':
        log.info('Starting building GODOT EDITOR FONT BUILTIN header')
        sourceInput = inputFile.split()
        targetOutput = [outputFile]
        make_fonts_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building GODOT EDITOR FONT BUILTIN header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_documentation_header_compressed':
        log.info('Starting building DOCUMENTATION HEADER COMPRESSED header')
        sourceInput = ""

        with open(inputFile, 'r') as file:
            sourceInput = file.read()
        
        sourceInput = sourceInput.split()
        targetOutput = [outputFile]
        make_doc_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building DOCUMENTATION HEADER COMPRESSED header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_editor_icons_action':
        log.info('Starting building EDITOR ICONS header')

        sourceInput = ""
        with open(inputFile, 'r') as file:
            sourceInput = file.read()

        sourceInput = sourceInput.split()
        targetOutput = [outputFile]
        make_editor_icons_action(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building EDITOR ICONS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_editor_translations':
        log.info('Starting building EDITOR TRANSLATIONS header')
        sourceInput = inputFile.split()
        targetOutput = [outputFile]
        make_editor_translations_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building EDITOR TRANSLATIONS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_editor_properties_translations':
        log.info('Starting building EDITOR PROPERTIES TRANSLATIONS header')
        sourceInput = inputFile.split()
        targetOutput = [outputFile]
        make_property_translations_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building EDITOR PROPERTIES TRANSLATIONS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_editor_documentation_translations':
        log.info('Starting building EDITOR DOCUMENTATION TRANSLATIONS header')
        sourceInput = inputFile.split()
        targetOutput = [outputFile]
        make_doc_translations_header(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building EDITOR DOCUMENTATION PROPERTIES TRANSLATIONS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_version_data_headers':
        log.info('Starting building VERSION DATA header')
        generate_version_header(module_version_string="", optional_version_outpath=parsedArguments.outputFile, optional_version_hash_output=parsedArguments.outputFile2)
        log.info('Finished building VERSION DATA header')
        log.info(f'Output: {parsedArguments.outputFile} {parsedArguments.outputFile2}')

    if buildType == 'make_script_encryption_header':
        log.info('Starting building SCRIPT ENCRYPTION header')
        write_script_encryption_key(target=parsedArguments.outputFile, txt="")
        log.info('Finished building SCRIPT ENCRYPTION header')
        log.info(f'Output: {parsedArguments.outputFile}')

    if buildType == 'make_extension_wrapper':
        log.info('Starting building SCRIPT EXTENSION WRAPPER header')
        targetOutput = [outputFile]
        core.extension.make_wrappers.run(target=targetOutput, source=None, env=None)
        log.info('Finished building SCRIPT EXTENSION WRAPPER header')
        log.info(f'Output: {parsedArguments.outputFile}')

    if buildType == 'make_gdscript_virtuals':
        log.info('Starting building SCRIPT EXTENSION WRAPPER header')
        targetOutput = [outputFile]
        core.object.make_virtuals.run(target=targetOutput, source=None, env=None)
        log.info('Finished building SCRIPT GD objects header')
        log.info(f'Output: {parsedArguments.outputFile}')

    if buildType == 'make_editor_gdscript_templates':
        log.info('Starting building EDITOR ICONS header')
        sourceInput = inputFile.split()
        targetOutput = [outputFile]
        editor.template_builders.make_templates(target=targetOutput, source=sourceInput, env=None)
        log.info('Finished building EDITOR ICONS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_register_platform_apis':
        log.info('Starting building REGISTER PLATFORM API HEADER header')
        sourceInput = [] #inputFile.split()
        make_platform_apis(target=outputFile, platforms=sourceInput)
        log.info('Finished building REGISTER PLATFORM API HEADER header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_editor_platform_exporters':
        log.info('Starting building EDITOR PLATFORM EXPORTERS header')
        #All the possible platforms 
        #FIXME!!
        #platform_exporters_input = ['android', 'ios', 'linuxbsd', 'macos', 'uwp', 'web', 'windows']
        platform_exporters_input = inputFile.split()
        make_platform_exporters_register(target=outputFile, platform_exporters=platform_exporters_input)
        log.info('Finished building EDITOR PLATFORM EXPORTERS header')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_modules_enabled_and_types':
        log.info('Detect all the Godot Modules to generate the module data')
        baseGodotEngineDir = str(pathlib.Path(inputFile).parent) + "/"
        unorderedModules = detect_modules_within_searchpath(inputFile)
        #Strip paths based on the output
        for dictKey, dictItem in unorderedModules.items():
            unorderedModules[dictKey] = dictItem.replace(baseGodotEngineDir, "")


        #If a custom path is provided apply it
        if inputFile2:
            customModules = detect_modules_within_searchpath(inputFile2)
            # #Strip paths based on the output
            # for dictKey, dictItem in customModules.items():
            #     customModules[dictKey] = dictItem.replace(parsedArguments.inputFile3, "")
            unorderedModules.update(customModules)

        modules = OrderedDict()
        for key, value in sorted(unorderedModules.items()):
            modules[key] = value

        originalCWD = os.getcwd()
        os.chdir(baseGodotEngineDir)


        #Write out the results
        generate_modules_enabled(target=str(parsedArguments.outputFile2), source=modules.keys(), env=None)
        write_modules(modules, str(parsedArguments.outputFile))
        

        os.chdir(originalCWD)

        #print(modules)
        log.info('Finished building the module headers')
        log.info(f'Output: {outputFile}')

    if buildType == 'make_data_class_path':
        log.info('Detect all the Godot Modules to generate the module data')
        modules = detect_modules_within_searchpath((inputFile + "modules/"))

        #Push the current working directory
        originalCWD = os.getcwd()
        baseGodotEngineDir = str(pathlib.Path(inputFile).parent) + "/"
        os.chdir(baseGodotEngineDir)

        def GenerateDocsFromPath(baseDirectory, relativeBasePath):
            print("BaseDirectory: %s   %s " % (baseDirectory, relativeBasePath))
            foundDocs = {}
            searchString = baseDirectory + "*.xml"
            foundXMLDocFiles = Glob.glob(searchString, recursive=True)

            relativeDocClassDirectory = baseDirectory.replace(relativeBasePath, "")
            relativeDocClassDirectory = relativeDocClassDirectory[:-1]

            for currentXMLDoc in foundXMLDocFiles:
                currentDocModule = str(pathlib.Path(currentXMLDoc).stem)
                foundDocs[currentDocModule] = relativeDocClassDirectory

            return foundDocs

        docs = {}
        modulesRelativeBaseDirectory = inputFile
        for d in modules:
            modulesBaseDirectory = ((inputFile + "modules/") + d + "/doc_classes/")
            newEntries = GenerateDocsFromPath(modulesBaseDirectory, modulesRelativeBaseDirectory)
            docs.update(newEntries)


        make_doc_data_class_path(to_path=outputFile, doc_class_path=docs)

        #Pop it back
        os.chdir(originalCWD)
        log.info('Finished building the module headers')
        log.info(f'Output: {outputFile}')


    return _ConsoleCodes.Success

class _ConsoleCodes():
    Success = 0
    FailedToParseArguments = -1
    FailedToFindFile = -2
    FailedToCreateDirectory = -3

 # Since we are running as a script; go ahead and run the entry point
if __name__ == '__main__':
    if sys.version_info.major < 3:
        log.error(f'Script requires Python3')

    exitCode = _EntryPointAsScript()

    if exitCode < 0:
        raise Exception(f'Something went wrong, check the logs for more details. Status: {exitCode}')
