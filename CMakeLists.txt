# Copyright (C) Sebastian Bialobrzecki <sbb@openmailbox.org>
# -- names --
cmake_minimum_required(VERSION 3.1)
project(virt-htop)

# -- load custom cmake modules --
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# -- requirements --
find_package(Libvirt REQUIRED)
include_directories(${LIBVIRT_INCLUDE_DIRS})

find_package(Curses REQUIRED)
include_directories(${CURSES_INCLUDE_DIRS})

find_package(Menu REQUIRED)
include_directories(${MENU_INCLUDE_DIRS})

# -- directories --
set(DIR_SRC "${CMAKE_CURRENT_SOURCE_DIR}/src")

set(INCLUDES ${INCLUDES} ${DIR_SRC})
add_subdirectory(${DIR_SRC})

# -- targets --
add_executable(${PROJECT_NAME} ${SOURCES})

# -- includes --
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDES})

# -- linking --
target_link_libraries(${PROJECT_NAME} ${CURSES_LIBRARIES} ${MENU_LIBRARIES} ${LIBVIRT_LIBRARIES})

# -- compiler flags --
target_compile_options(${PROJECT_NAME} PUBLIC -Wall -Werror)
