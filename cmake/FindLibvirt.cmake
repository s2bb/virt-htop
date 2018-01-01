# Copyright (C) Sebastian Bialobrzecki <sbb@openmailbox.org>
# - Try to find Libvirt
# Once done this will define
#  LIBVIRT_FOUND - System has libvirt
#  LIBVIRT_INCLUDE_DIRS - The libvirt include directories
#  LIBVIRT_LIBRARIES - The libraries needed to use libvirt
#  LIBVIRT_DEFINITIONS - Compiler switches required for using libvirt

find_package(PkgConfig)
pkg_check_modules(PC_LIBVIRT REQUIRED libvirt)
set(LIBVIRT_DEFINITIONS ${PC_LIBVIRT_CFLAGS_OTHER})

find_path(LIBVIRT_INCLUDE_DIR libvirt/libvirt.h
    HINTS ${PC_LIBVIRT_INCLUDEDIR} ${PC_LIBVIRT_INCLUDE_DIRS}
    PATH_SUFFIXES libvirt)

if (LIBVIRT_INCLUDE_DIR)
    find_library(LIBVIRT_LIBRARY NAMES virt
        HINTS ${PC_LIBVIRT_LIBDIR} ${PC_LIBVIRT_LIBRARY_DIRS})

    if (LIBVIRT_LIBRARY)
        include(FindPackageHandleStandardArgs)
        find_package_handle_standard_args(libvirt
            "Could not find Libvirt library"
            LIBVIRT_LIBRARY LIBVIRT_INCLUDE_DIR)

        if (LIBVIRT_FOUND)
            mark_as_advanced(LIBVIRT_INCLUDE_DIR LIBVIRT_LIBRARY)

            set(LIBVIRT_LIBRARIES ${LIBVIRT_LIBRARY})
            set(LIBVIRT_INCLUDE_DIRS ${LIBVIRT_INCLUDE_DIR})
        endif()
    endif()
endif()
