macro(run_conan)
# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(
    STATUS
      "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
       "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

# Setup a remote repository
conan_add_remote(NAME bincrafters URL
                 https://api.bintray.com/conan/bincrafters/public-conan)

conan_cmake_run(
  REQUIRES
  ${CONAN_EXTRA_REQUIRES} # Optional dependancies, initialized outside of this script
  catch2/2.11.0 # A modern, C++-native, header-only, test framework for unit-tests
  docopt.cpp/0.6.2 # A popular command line option processing library
  fmt/6.0.0 # {fmt} is an open-source formatting library providing a fast and safe alternative to C stdio and C++ iostreams.
  spdlog/1.5.0 # Speed log - a relatively fast logger
  OPTIONS
  ${CONAN_EXTRA_OPTIONS} # Extra options, initialized outisde of this scribt
  BASIC_SETUP
  CMAKE_TARGETS # This allows Conan to generate cmake linker targets
  BUILD
  missing)
endmacro()
