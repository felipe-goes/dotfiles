add_subdirectory(modulo)

# compile shared library and install sudo cmake --install . OR make install
find_package(fmt REQUIRED)

# add the executable
add_executable(${PROJECT_NAME} main.cpp)
set_target_properties(${PROJECT_NAME} PROPERTIES DEBUG_POSTFIX
                                                 ${CMAKE_DEBUG_POSTFIX})

# link libraries
target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt)
target_link_libraries(${PROJECT_NAME} PUBLIC Modulo tutorial_compiler_flags)

# add libraries include directories
target_include_directories(${PROJECT_NAME}
                           PUBLIC "${CMAKE_SOURCE_DIR}/libs/fmt/include")

# add the install targets
install(TARGETS ${PROJECT_NAME} DESTINATION bin)

file(GLOB_RECURSE headers CONFIGURE_DEPENDS
     "${CMAKE_CURRENT_SOURCE_DIR}/include/*/*.hpp")
install(FILES ${headers} DESTINATION include)
