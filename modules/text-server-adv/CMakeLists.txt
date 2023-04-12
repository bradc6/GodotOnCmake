set(GODOT_MODULE_TEXT_SERVER_ADV_DIR ${GODOT_MODULES_BASE_DIR}/text_server_adv)
set(GODOT_MODULE_TEXT_SERVER_ADV_SOURCE
	#Compiled into icu directly
	#${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/icu_data/icudata_stub.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/register_types.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/register_types.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/script_iterator.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/script_iterator.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/text_server_adv.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/text_server_adv.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_bounds_iterator.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_bounds_iterator.h
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_svg_in_ot.cpp
	${GODOT_MODULE_TEXT_SERVER_ADV_DIR}/thorvg_svg_in_ot.h
	)

set(ICU_FONT_DATA_SOURCE ${GODOT_SOURCE_ROOT_THIRDPARTY_DIR}/icu4c/icudt72l.dat)
set(ICU_FONT_DATA_DESTINATION ${CMAKE_BINARY_INCLUDE_DIR}/thirdparty/icu4c/icudata.gen.h)
GENERATE_ICU_FONT_DATA(${ICU_FONT_DATA_SOURCE} ${ICU_FONT_DATA_DESTINATION})

godot_add_library(godot-module-text-server-adv modules STATIC ${GODOT_MODULE_TEXT_SERVER_ADV_SOURCE} ${ICU_FONT_DATA_DESTINATION})
target_link_libraries(godot-module-text-server-adv PUBLIC godot-object thorvg harfbuzz freetype msdfgen icu4c)
target_compile_definitions(godot-module-text-server-adv PUBLIC ICU_STATIC_DATA=1)
target_include_directories(godot-module-text-server-adv PRIVATE ${CMAKE_BINARY_INCLUDE_DIR}/thirdparty/icu4c)
