###
### Common macros for building Godot
###

# Adds a library target named <<LIBRARY_NAME>>. Also adds it to the list of libraries to link against.
# If folders are enabled in output structure, will appear in the <<OUT_PATH>> folder.
# Anything past these arguments is fed directly to add_library -- e.g. STATIC/SHARED/MODULE/INTERFACE and source files.
function(godot_add_library LIBRARY_NAME OUT_PATH)
    add_library(${LIBRARY_NAME} ${ARGN})
    set_target_properties(${LIBRARY_NAME} PROPERTIES FOLDER Godot/${OUT_PATH})
    set(GODOT_LIBRARIES ${GODOT_LIBRARIES} ${LIBRARY_NAME} CACHE STRING "Godot libraries to link" FORCE)
endfunction()
