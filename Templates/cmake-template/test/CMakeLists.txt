find_package(GTest CONFIG REQUIRED)
enable_testing()

add_executable(TestModulo teste_modulo.cpp)

target_link_libraries(TestModulo PRIVATE Modulo GTest::gtest_main
                                         tutorial_compiler_flags)
target_include_directories(TestModulo
                           PUBLIC "${CMAKE_SOURCE_DIR}/libs/googletest/include")

include(GoogleTest)
gtest_add_tests(TARGET TestModulo SOURCES teste_modulo.cpp)
