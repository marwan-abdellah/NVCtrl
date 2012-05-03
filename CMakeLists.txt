# -----------------------------------------------------------------------------
# Author : Marwan Abdellah <marwan.abdellah@epfl.ch>
# Blue Brain Project, Ecole Polytechnique Federal Du Lausanne (EPFL)
# ----------------------------------------------------------------------------- 

# Minimum required CMake version 
cmake_minimum_required (VERSION 2.6)

# NVCtrl 
PROJECT(NVCtrl)

# X11 
FIND_PACKAGE(X11 REQUIRED)

ADD_LIBRARY(XNVCtrl SHARED NVCtrl.c)
TARGET_LINK_LIBRARIES(XNVCtrl)

install(TARGETS XNVCtrl LIBRARY DESTINATION lib)
install(FILES NVCtrl.h DESTINATION include)
install(FILES NVCtrlLib.h DESTINATION include)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake)

# Packaging 
include(CPackConfig)


