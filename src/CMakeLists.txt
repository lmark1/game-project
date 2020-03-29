# Generic test that uses conan libs
add_executable(game main.cpp)

# PRIVATE(keyword) represents that these dependancies are private. i.e. if someone would rely on game, he would not need
# to know and/or include all these dependancies
target_link_libraries(game PRIVATE project_options project_warnings CONAN_PKG::docopt.cpp CONAN_PKG::fmt
                                   CONAN_PKG::spdlog CONAN_PKG::imgui-sfml)
