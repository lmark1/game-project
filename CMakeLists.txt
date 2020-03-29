cmake_minimum_required(VERSION 3.15)

# Set the project name to your project name, my project isn't very descriptive
project(myproject CXX)
include(cmake/StandardProjectSettings.cmake)

# An INTERFACE library target does not directly create build output (SHARED OBJECT / STATIC OBJECT file), it does not
# have any source files, though it may have properties set on it and it may be installed, exported and imported.  It
# lets us pass specified requirements to other targets using target_link_libraries() command.

# Link this 'library' to set the c++ standard / compile-time options requested. 'project_options' is a target
# representing general compiler options needed to compile this project.
add_library(project_options INTERFACE)

# target_compil_features() - The INTERFACE, PUBLIC and PRIVATE keywords are required to specify the scope of the
# features. PRIVATE and PUBLIC items will populate the COMPILE_FEATURES property of <target>. PUBLIC and INTERFACE items
# will populate the INTERFACE_COMPILE_FEATURES property of <target>. The named <target> must have been created by a
# command such as add_executable() or add_library()

# Specifies compiler features required when compiling a given target.
target_compile_features(project_options INTERFACE cxx_std_20)

# Link this 'library' to use the warnings specified in CompilerWarnings.cmake
add_library(project_warnings INTERFACE)

# standard compiler warnings
include(cmake/CompilerWarnings.cmake)
set_project_warnings(project_warnings)

# SANITIZERS - tools for clang / gcc that can do a RUNTIME analysis of your code. Clang has most complete support for
# sanitizers. AdressSanitizer - checks for adresses that you access in the code that are out of bounds. ThreadSanitizer
# - detect if you have a multi-threaded program that is doing thread-unsafe things at runtime. MemorySanitizer - checks
# if you are accessing uninitialized memory. UndefinedBehaviour - check if the code exhibits undefined behaviour at
# runtime. There are many more sanitizer. Jason Turner, C++ Weekly EP 84 - C++ Sanitizer
# (https://www.youtube.com/watch?v=MB6NPkB4YVs)

# sanitizer options if supported by compiler
include(cmake/Sanitizers.cmake)
enable_sanitizers(project_options)

# enable doxygen
include(cmake/Doxygen.cmake)
enable_doxygen()

# allow for static analysis options
include(cmake/StaticAnalyzers.cmake)

option(BUILD_SHARED_LIBS "Enable compilation of shared libraries" OFF)
option(ENABLE_TESTING "Enable Test Builds" ON)
option(ENABLE_FUZZING "Enable Fuzz Test Builds" OFF)

# A precompiled header is a (C or C++) header file that is compiled into an intermediate form that is faster to process
# for the compiler. Usage of precompiled headers may significantly reduce compilation time, especially when applied to
# large header files, header files that include many other header files, or header files that are included in many
# translation units. Very basic PCH example

# Precompiling header files can speed up compilation by creating a partially processed version of some header files, and
# then using that version during compilations rather than repeatedly parsing the original headers.

option(ENABLE_PCH "Enable Precompiled Headers" OFF)
if(ENABLE_PCH)
  # This sets a global PCH parameter, each project will build its own PCH, which is a good idea if any #define's change
  #
  target_precompile_headers(project_options INTERFACE <vector> <string> <map> <utility>)
endif()

# Set up some extra Conan dependencies based on our needs before loading Conan

set(CONAN_EXTRA_REQUIRES ${CONAN_EXTRA_REQUIRES} imgui-sfml/2.1@bincrafters/stable)

# set(CONAN_EXTRA_OPTIONS ${CONAN_EXTRA_OPTIONS} sfml:shared=False sfml:graphics=True sfml:audio=False sfml:window=True
# libalsa:disable_python=True)

include(cmake/Conan.cmake)
run_conan()

if(ENABLE_TESTING)
  enable_testing()
  message("Building Tests. Be sure to check out test/constexpr_tests for constexpr testing")
  add_subdirectory(test)
endif()

if(ENABLE_FUZZING)
  message("Building Fuzz Tests, using fuzzing sanitizer https://www.llvm.org/docs/LibFuzzer.html")
  add_subdirectory(fuzz_test)
endif()

add_subdirectory(src)
