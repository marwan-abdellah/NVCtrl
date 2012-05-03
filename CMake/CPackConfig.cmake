# @author  Marwan Abdellah
# @remarks Copyright (c) BBP/EPFL 2011; All rights reserved. Do not distribute without further notice.

# General CPack configuration 
# Info: http://www.itk.org/Wiki/CMake:Component_Install_With_CPack
# _____________________________________________________________________________

set(CPACK_PACKAGE_NAME "NVCtrl")

if(APPLE)
  set(CPACK_PACKAGE_VENDOR "Blue Brain Project") # PackageMaker doesn't like http://
else()
  set(CPACK_PACKAGE_VENDOR "http://bluebrain.epfl.ch") # deb lintian insists on URL
endif()

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "NVIDIA Control Library ")
set(CPACK_PACKAGE_CONTACT "Marwan Abdellah <marwan.abdellah@epfl.ch>")


#set(CPACK_PACKAGE_VERSION ${VERSION})
#set(CPACK_PACKAGE_VERSION_MAJOR ${VERSION_MAJOR})
#set(CPACK_PACKAGE_VERSION_MINOR ${VERSION_MINOR})
#set(CPACK_PACKAGE_VERSION_PATCH ${VERSION_PATCH})

# Select package generator
if(MSVC)
  set(CPACK_GENERATOR "NSIS")
endif(MSVC)

if(APPLE)
  set(CPACK_GENERATOR "PackageMaker")
  set(CPACK_SET_DESTDIR ON)
  set(CPACK_OSX_PACKAGE_VERSION "10.5")
endif(APPLE)

if (${CMAKE_SYSTEM_NAME} MATCHES Linux)
  find_program(RPM_EXE rpmbuild)
  if(${RPM_EXE} MATCHES RPM_EXE-NOTFOUND)
    set(CPACK_GENERATOR "TGZ;DEB")
  else()
    set(CPACK_GENERATOR "TGZ;DEB;RPM")
  endif()
endif()

# Debian specific configuration (minimum)
# _____________________________________________________________________________

set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_CONTACT}")

# To be set later ... 
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libx11-dev")

# RPM specific configuration (minimum)
# _____________________________________________________________________________
set(CPACK_RPM_PACKAGE_LICENSE "LGPL")
set(CPACK_RPM_PACKAGE_GROUP "Sciences/Biology")
#set(CPACK_RPM_PACKAGE_VERSION ${VERSION})

include(InstallRequiredSystemLibraries)
include(CPack)

