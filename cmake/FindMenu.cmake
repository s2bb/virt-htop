# Copyright (C) Sebastian Bialobrzecki <sbb@openmailbox.org>
# - Try to find menu
# Once done this will define
#  MENU_FOUND - System has menu
#  MENU_INCLUDE_DIRS - The menu include directories
#  MENU_LIBRARIES - The libraries needed to use menu
#  MENU_DEFINITIONS - Compiler switches required for using menu

find_package(PkgConfig)
pkg_check_modules(PC_MENU REQUIRED menu)
set(MENU_DEFINITIONS ${PC_MENU_CFLAGS_OTHER})

find_path(MENU_INCLUDE_DIR menu.h
    HINTS ${PC_MENU_INCLUDEDIR} ${PC_MENU_INCLUDE_DIRS}
    PATH_SUFFIXES menu)

if (MENU_INCLUDE_DIR)
    find_library(MENU_LIBRARY NAMES menu
        HINTS ${PC_MENU_LIBDIR} ${PC_MENU_LIBRARY_DIRS})

    if (MENU_LIBRARY)
        include(FindPackageHandleStandardArgs)
        find_package_handle_standard_args(menu
            "Could not find menu library"
            MENU_LIBRARY MENU_INCLUDE_DIR)

        if (MENU_FOUND)
            mark_as_advanced(MENU_INCLUDE_DIR MENU_LIBRARY)

            set(MENU_LIBRARIES ${MENU_LIBRARY})
            set(MENU_INCLUDE_DIRS ${MENU_INCLUDE_DIR})
        endif()
    endif()
endif()
