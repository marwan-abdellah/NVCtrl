# -----------------------------------------------------------------------------
# Author: Marwan Abdellah <marwan-abdellah@epfl.ch>
# Blue Brain Project, Ecole Polytechnique Federal Du Lausanne (EPFL)
# Copyright (c) BBP/EPFL 2011-2012.  
# All rights reserved. 

# General CPack configuration 
# Info: http://www.itk.org/Wiki/CMake:Component_Install_With_CPack
# ----------------------------------------------------------------------------- 

# Minimum required CMake version 
cmake_minimum_required (VERSION 2.6)

# NVCtrl 
PROJECT(NVCtrl)

# X11 
FIND_PACKAGE(X11 REQUIRED)

ADD_LIBRARY(XNVCtrl SHARED NVCtrl.c)
TARGET_LINK_LIBRARIES(XNVCtrl ${X11_Xext_LIB} ${X11_X11_LIB})

# Installation  
install(TARGETS XNVCtrl LIBRARY DESTINATION ${CMAKE_BINARY_DIR}/lib)
install(FILES NVCtrl.h DESTINATION ${CMAKE_BINARY_DIR}/include/NVCtrl)
install(FILES NVCtrlLib.h DESTINATION ${CMAKE_BINARY_DIR}/include/NVCtrl)

# Packaging
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake) 
include(CPackConfig)
