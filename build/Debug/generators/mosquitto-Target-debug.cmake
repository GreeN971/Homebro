# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(mosquitto_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(mosquitto_FRAMEWORKS_FOUND_DEBUG "${mosquitto_FRAMEWORKS_DEBUG}" "${mosquitto_FRAMEWORK_DIRS_DEBUG}")

set(mosquitto_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET mosquitto_DEPS_TARGET)
    add_library(mosquitto_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET mosquitto_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${mosquitto_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${mosquitto_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:openssl::openssl;mosquitto::libmosquitto>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### mosquitto_DEPS_TARGET to all of them
conan_package_library_targets("${mosquitto_LIBS_DEBUG}"    # libraries
                              "${mosquitto_LIB_DIRS_DEBUG}" # package_libdir
                              "${mosquitto_BIN_DIRS_DEBUG}" # package_bindir
                              "${mosquitto_LIBRARY_TYPE_DEBUG}"
                              "${mosquitto_IS_HOST_WINDOWS_DEBUG}"
                              mosquitto_DEPS_TARGET
                              mosquitto_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "mosquitto"    # package_name
                              "${mosquitto_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${mosquitto_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT mosquitto::libmosquittopp #############

        set(mosquitto_mosquitto_libmosquittopp_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(mosquitto_mosquitto_libmosquittopp_FRAMEWORKS_FOUND_DEBUG "${mosquitto_mosquitto_libmosquittopp_FRAMEWORKS_DEBUG}" "${mosquitto_mosquitto_libmosquittopp_FRAMEWORK_DIRS_DEBUG}")

        set(mosquitto_mosquitto_libmosquittopp_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET mosquitto_mosquitto_libmosquittopp_DEPS_TARGET)
            add_library(mosquitto_mosquitto_libmosquittopp_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET mosquitto_mosquitto_libmosquittopp_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_DEPENDENCIES_DEBUG}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'mosquitto_mosquitto_libmosquittopp_DEPS_TARGET' to all of them
        conan_package_library_targets("${mosquitto_mosquitto_libmosquittopp_LIBS_DEBUG}"
                              "${mosquitto_mosquitto_libmosquittopp_LIB_DIRS_DEBUG}"
                              "${mosquitto_mosquitto_libmosquittopp_BIN_DIRS_DEBUG}" # package_bindir
                              "${mosquitto_mosquitto_libmosquittopp_LIBRARY_TYPE_DEBUG}"
                              "${mosquitto_mosquitto_libmosquittopp_IS_HOST_WINDOWS_DEBUG}"
                              mosquitto_mosquitto_libmosquittopp_DEPS_TARGET
                              mosquitto_mosquitto_libmosquittopp_LIBRARIES_TARGETS
                              "_DEBUG"
                              "mosquitto_mosquitto_libmosquittopp"
                              "${mosquitto_mosquitto_libmosquittopp_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET mosquitto::libmosquittopp
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_LIBRARIES_TARGETS}>
                     )

        if("${mosquitto_mosquitto_libmosquittopp_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET mosquitto::libmosquittopp
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         mosquitto_mosquitto_libmosquittopp_DEPS_TARGET)
        endif()

        set_property(TARGET mosquitto::libmosquittopp APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_LINKER_FLAGS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquittopp APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_INCLUDE_DIRS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquittopp APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_LIB_DIRS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquittopp APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_COMPILE_DEFINITIONS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquittopp APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquittopp_COMPILE_OPTIONS_DEBUG}>)


    ########## COMPONENT mosquitto::libmosquitto #############

        set(mosquitto_mosquitto_libmosquitto_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(mosquitto_mosquitto_libmosquitto_FRAMEWORKS_FOUND_DEBUG "${mosquitto_mosquitto_libmosquitto_FRAMEWORKS_DEBUG}" "${mosquitto_mosquitto_libmosquitto_FRAMEWORK_DIRS_DEBUG}")

        set(mosquitto_mosquitto_libmosquitto_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET mosquitto_mosquitto_libmosquitto_DEPS_TARGET)
            add_library(mosquitto_mosquitto_libmosquitto_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET mosquitto_mosquitto_libmosquitto_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_DEPENDENCIES_DEBUG}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'mosquitto_mosquitto_libmosquitto_DEPS_TARGET' to all of them
        conan_package_library_targets("${mosquitto_mosquitto_libmosquitto_LIBS_DEBUG}"
                              "${mosquitto_mosquitto_libmosquitto_LIB_DIRS_DEBUG}"
                              "${mosquitto_mosquitto_libmosquitto_BIN_DIRS_DEBUG}" # package_bindir
                              "${mosquitto_mosquitto_libmosquitto_LIBRARY_TYPE_DEBUG}"
                              "${mosquitto_mosquitto_libmosquitto_IS_HOST_WINDOWS_DEBUG}"
                              mosquitto_mosquitto_libmosquitto_DEPS_TARGET
                              mosquitto_mosquitto_libmosquitto_LIBRARIES_TARGETS
                              "_DEBUG"
                              "mosquitto_mosquitto_libmosquitto"
                              "${mosquitto_mosquitto_libmosquitto_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET mosquitto::libmosquitto
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_LIBRARIES_TARGETS}>
                     )

        if("${mosquitto_mosquitto_libmosquitto_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET mosquitto::libmosquitto
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         mosquitto_mosquitto_libmosquitto_DEPS_TARGET)
        endif()

        set_property(TARGET mosquitto::libmosquitto APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_LINKER_FLAGS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquitto APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_INCLUDE_DIRS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquitto APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_LIB_DIRS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquitto APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_COMPILE_DEFINITIONS_DEBUG}>)
        set_property(TARGET mosquitto::libmosquitto APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${mosquitto_mosquitto_libmosquitto_COMPILE_OPTIONS_DEBUG}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET mosquitto::mosquitto APPEND PROPERTY INTERFACE_LINK_LIBRARIES mosquitto::libmosquittopp)
    set_property(TARGET mosquitto::mosquitto APPEND PROPERTY INTERFACE_LINK_LIBRARIES mosquitto::libmosquitto)

########## For the modules (FindXXX)
set(mosquitto_LIBRARIES_DEBUG mosquitto::mosquitto)
