# Copyright (C) Sebastian Bialobrzecki <sbb@openmailbox.org>
# -- sources --
set(SOURCE_FILES
    tui.c
    tui_domain.c
    tui_node.c)

foreach(SOURCE_FILE ${SOURCE_FILES})
    set(SOURCES ${SOURCES} "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_FILE}")
endforeach(SOURCE_FILE)
set(SOURCES ${SOURCES} PARENT_SCOPE)
