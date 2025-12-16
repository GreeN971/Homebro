########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND mosquitto_COMPONENT_NAMES mosquitto::libmosquitto mosquitto::libmosquittopp)
list(REMOVE_DUPLICATES mosquitto_COMPONENT_NAMES)
if(DEFINED mosquitto_FIND_DEPENDENCY_NAMES)
  list(APPEND mosquitto_FIND_DEPENDENCY_NAMES OpenSSL)
  list(REMOVE_DUPLICATES mosquitto_FIND_DEPENDENCY_NAMES)
else()
  set(mosquitto_FIND_DEPENDENCY_NAMES OpenSSL)
endif()
set(OpenSSL_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(mosquitto_PACKAGE_FOLDER_DEBUG "/home/patrik/.conan2/p/b/mosquf0626929e3dfa/p")
set(mosquitto_BUILD_MODULES_PATHS_DEBUG )


set(mosquitto_INCLUDE_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/include")
set(mosquitto_RES_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/res")
set(mosquitto_DEFINITIONS_DEBUG "-DLIBMOSQUITTO_STATIC")
set(mosquitto_SHARED_LINK_FLAGS_DEBUG )
set(mosquitto_EXE_LINK_FLAGS_DEBUG )
set(mosquitto_OBJECTS_DEBUG )
set(mosquitto_COMPILE_DEFINITIONS_DEBUG "LIBMOSQUITTO_STATIC")
set(mosquitto_COMPILE_OPTIONS_C_DEBUG )
set(mosquitto_COMPILE_OPTIONS_CXX_DEBUG )
set(mosquitto_LIB_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/lib")
set(mosquitto_BIN_DIRS_DEBUG )
set(mosquitto_LIBRARY_TYPE_DEBUG STATIC)
set(mosquitto_IS_HOST_WINDOWS_DEBUG 0)
set(mosquitto_LIBS_DEBUG mosquittopp_static mosquitto_static)
set(mosquitto_SYSTEM_LIBS_DEBUG pthread m)
set(mosquitto_FRAMEWORK_DIRS_DEBUG )
set(mosquitto_FRAMEWORKS_DEBUG )
set(mosquitto_BUILD_DIRS_DEBUG )
set(mosquitto_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(mosquitto_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${mosquitto_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${mosquitto_COMPILE_OPTIONS_C_DEBUG}>")
set(mosquitto_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${mosquitto_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${mosquitto_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${mosquitto_EXE_LINK_FLAGS_DEBUG}>")


set(mosquitto_COMPONENTS_DEBUG mosquitto::libmosquitto mosquitto::libmosquittopp)
########### COMPONENT mosquitto::libmosquittopp VARIABLES ############################################

set(mosquitto_mosquitto_libmosquittopp_INCLUDE_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/include")
set(mosquitto_mosquitto_libmosquittopp_LIB_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/lib")
set(mosquitto_mosquitto_libmosquittopp_BIN_DIRS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_LIBRARY_TYPE_DEBUG STATIC)
set(mosquitto_mosquitto_libmosquittopp_IS_HOST_WINDOWS_DEBUG 0)
set(mosquitto_mosquitto_libmosquittopp_RES_DIRS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_DEFINITIONS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_OBJECTS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_COMPILE_DEFINITIONS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_COMPILE_OPTIONS_C_DEBUG "")
set(mosquitto_mosquitto_libmosquittopp_COMPILE_OPTIONS_CXX_DEBUG "")
set(mosquitto_mosquitto_libmosquittopp_LIBS_DEBUG mosquittopp_static)
set(mosquitto_mosquitto_libmosquittopp_SYSTEM_LIBS_DEBUG pthread m)
set(mosquitto_mosquitto_libmosquittopp_FRAMEWORK_DIRS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_FRAMEWORKS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_DEPENDENCIES_DEBUG mosquitto::libmosquitto)
set(mosquitto_mosquitto_libmosquittopp_SHARED_LINK_FLAGS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_EXE_LINK_FLAGS_DEBUG )
set(mosquitto_mosquitto_libmosquittopp_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(mosquitto_mosquitto_libmosquittopp_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${mosquitto_mosquitto_libmosquittopp_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${mosquitto_mosquitto_libmosquittopp_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${mosquitto_mosquitto_libmosquittopp_EXE_LINK_FLAGS_DEBUG}>
)
set(mosquitto_mosquitto_libmosquittopp_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${mosquitto_mosquitto_libmosquittopp_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${mosquitto_mosquitto_libmosquittopp_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT mosquitto::libmosquitto VARIABLES ############################################

set(mosquitto_mosquitto_libmosquitto_INCLUDE_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/include")
set(mosquitto_mosquitto_libmosquitto_LIB_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/lib")
set(mosquitto_mosquitto_libmosquitto_BIN_DIRS_DEBUG )
set(mosquitto_mosquitto_libmosquitto_LIBRARY_TYPE_DEBUG STATIC)
set(mosquitto_mosquitto_libmosquitto_IS_HOST_WINDOWS_DEBUG 0)
set(mosquitto_mosquitto_libmosquitto_RES_DIRS_DEBUG "${mosquitto_PACKAGE_FOLDER_DEBUG}/res")
set(mosquitto_mosquitto_libmosquitto_DEFINITIONS_DEBUG "-DLIBMOSQUITTO_STATIC")
set(mosquitto_mosquitto_libmosquitto_OBJECTS_DEBUG )
set(mosquitto_mosquitto_libmosquitto_COMPILE_DEFINITIONS_DEBUG "LIBMOSQUITTO_STATIC")
set(mosquitto_mosquitto_libmosquitto_COMPILE_OPTIONS_C_DEBUG "")
set(mosquitto_mosquitto_libmosquitto_COMPILE_OPTIONS_CXX_DEBUG "")
set(mosquitto_mosquitto_libmosquitto_LIBS_DEBUG mosquitto_static)
set(mosquitto_mosquitto_libmosquitto_SYSTEM_LIBS_DEBUG pthread m)
set(mosquitto_mosquitto_libmosquitto_FRAMEWORK_DIRS_DEBUG )
set(mosquitto_mosquitto_libmosquitto_FRAMEWORKS_DEBUG )
set(mosquitto_mosquitto_libmosquitto_DEPENDENCIES_DEBUG openssl::openssl)
set(mosquitto_mosquitto_libmosquitto_SHARED_LINK_FLAGS_DEBUG )
set(mosquitto_mosquitto_libmosquitto_EXE_LINK_FLAGS_DEBUG )
set(mosquitto_mosquitto_libmosquitto_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(mosquitto_mosquitto_libmosquitto_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${mosquitto_mosquitto_libmosquitto_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${mosquitto_mosquitto_libmosquitto_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${mosquitto_mosquitto_libmosquitto_EXE_LINK_FLAGS_DEBUG}>
)
set(mosquitto_mosquitto_libmosquitto_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${mosquitto_mosquitto_libmosquitto_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${mosquitto_mosquitto_libmosquitto_COMPILE_OPTIONS_C_DEBUG}>")