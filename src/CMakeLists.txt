# Copyright (C) Sebastian Bialobrzecki <sbb@openmailbox.org>
# -- subdirectories and includes --
set(SUBDIRS
    virt
    tui)

foreach(SUBDIR ${SUBDIRS})
    add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/${SUBDIR}")
    set(INCLUDES ${INCLUDES} "${CMAKE_CURRENT_SOURCE_DIR}/${SUBDIR}")
endforeach(SUBDIR)
set(INCLUDES ${INCLUDES} PARENT_SCOPE)

# -- sources --
set(SOURCE_FILES
    arguments.c
    main.c
    utils.c)

foreach(SOURCE_FILE ${SOURCE_FILES})
    set(SOURCES ${SOURCES} "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_FILE}")
endforeach(SOURCE_FILE)
set(SOURCES ${SOURCES} PARENT_SCOPE)
