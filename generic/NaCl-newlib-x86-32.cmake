#
# Toolchain for compiling NaCl applications for x86-32 using newlib.
#
# Modify NACL_PREFIX to your liking. You have to add modules/ directory to
# CMAKE_MODULE_PATH before using the toolchain file so NaCl platform file
# can be found, e.g.:
#
#  mkdir build-nacl-x86-32 && cd build-nacl-x86-32
#  cmake .. \
#       -DCMAKE_MODULE_PATH=/absolute/path/to/toolchains/modules \
#       -DCMAKE_TOOLCHAIN_FILE=../toolchains/generic/NaCl-newlib-x86-32.cmake
#

set(CMAKE_SYSTEM_NAME NaCl)

set(NACL_PREFIX "/usr/nacl")

set(NACL_TOOLCHAIN newlib)
set(NACL_BITS 32)
set(NACL_ARCH i686)

set(NACL_ARCH_GCC -m${NACL_BITS})
set(NACL_ARCH_NMF x86-${NACL_BITS})
set(NACL_TOOLCHAIN_PATH "${NACL_PREFIX}/toolchain/linux_x86_${NACL_TOOLCHAIN}/")
set(CMAKE_C_COMPILER "${NACL_TOOLCHAIN_PATH}/bin/${NACL_ARCH}-nacl-gcc")
set(CMAKE_CXX_COMPILER "${NACL_TOOLCHAIN_PATH}/bin/${NACL_ARCH}-nacl-g++")
set(CMAKE_FIND_ROOT_PATH
    "${NACL_TOOLCHAIN_PATH}/x86_64-nacl"
    "${NACL_PREFIX}")

set(CMAKE_LIBRARY_ARCHITECTURE 32)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

include_directories("${NACL_PREFIX}/include")
