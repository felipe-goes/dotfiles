add_library(Modulo teste.cpp)

target_include_directories(Modulo PUBLIC "${CMAKE_SOURCE_DIR}/include")
# state that anybody linking to us needs to include the source dir to find
# teste.hpp
target_include_directories(
  Modulo INTERFACE $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
                   $<INSTALL_INTERFACE:include>)

# link Modulo to tutorial_compiler_flags
target_link_libraries(Modulo PUBLIC tutorial_compiler_flags)

# install libs
set(installable_libs Modulo tutorial_compiler_flags)
install(
  TARGETS ${installable_libs}
  EXPORT Modulo
  DESTINATION lib)
