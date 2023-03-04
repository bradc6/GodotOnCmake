#Detect and enable all the possible libraries
#DO NOT MARK THINGS REQUIRED, break within the module that requires it

####################################
#DBUS
####################################
find_package(DBUS)

####################################
#ALSA
#Found: ${ALSA_FOUND}
#Include: ${ALSA_INCLUDE_DIR}
#Linker: ${ALSA_LIBRARY}
####################################
find_package(ALSA)

####################################
#PulseAudio
####################################
find_package(PulseAudio)

####################################
#PulseAudio
####################################
find_package(X11)

####################################
#mntent
####################################
CHECK_INCLUDE_FILE("mntent.h" FOUND_MNTENT)

####################################
#Vulkan
####################################
find_package(Vulkan)

####################################
#OpenGL
####################################
find_package(OpenGL)

####################################
#X11
####################################
find_package(X11)

####################################
#Fontconfig
####################################
find_package(Fontconfig)