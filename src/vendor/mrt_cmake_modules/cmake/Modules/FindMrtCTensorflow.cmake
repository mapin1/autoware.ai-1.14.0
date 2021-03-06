# try to find tensorflow
find_package(PkgConfig)
find_path(TENSORFLOW_C_INCLUDE_DIR tensorflow/tensorflow/c/c_api.h
        PATH_SUFFIXES tensorflow
        )

set(TENSORFLOW_C_INCLUDE_DIR ${TENSORFLOW_C_INCLUDE_DIR})

find_library(TENSORFLOW_C_LIBRARY
        NAMES tensorflow
        )
find_library(TENSORFLOW_FRAMEWORK_LIBRARY
        NAMES tensorflow_framework
        )

if(TENSORFLOW_FRAMEWORK_LIBRARY)
    set(TENSORFLOW_LIBRARY ${TENSORFLOW_C_LIBRARY} ${TENSORFLOW_FRAMEWORK_LIBRARY})
else()
    set(TENSORFLOW_LIBRARY ${TENSORFLOW_C_LIBRARY})
endif(TENSORFLOW_FRAMEWORK_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MrtCTensorflow DEFAULT_MSG
        TENSORFLOW_LIBRARY TENSORFLOW_C_INCLUDE_DIR)

mark_as_advanced(TENSORFLOW_LIBRARY TENSORFLOW_C_INCLUDE_DIR)
set(TENSORFLOW_LIBRARIES ${TENSORFLOW_LIBRARY} )
set(TENSORFLOW_C_INCLUDE_DIRS ${TENSORFLOW_C_INCLUDE_DIR} )
