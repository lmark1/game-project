# game-project

[![codecov](https://codecov.io/gh/lefticus/cpp_starter_project/branch/master/graph/badge.svg)](https://codecov.io/gh/lefticus/cpp_starter_project)

[![Build Status](https://travis-ci.org/lefticus/cpp_starter_project.svg?branch=master)](https://travis-ci.org/lefticus/cpp_starter_project)

[![Build status](https://ci.appveyor.com/api/projects/status/ro4lbfoa7n0sy74c/branch/master?svg=true)](https://ci.appveyor.com/project/lefticus/cpp-starter-project/branch/master)

## Prerequisites
The following programs need to be installed prior to building this code.

### clang-format
A tool used to format code. Formatting specifications are found in .clang-format file in the root of this project. If you are using VSCode, also install the clang-format extension. Formatting shortcut is `CTRL+SHIFT+I`.
```
sudo apt install clang-format
clang-format --version
```
Last command should output `clang-format version 6.0.0`.

### cmake-format
A tool used to format Cmake code. Formatting specifications are found in .cmake-format file in the root of this project. If you are using VSCode, also install the cmake-format extension. Formatting shortcut is `CTRL+SHIFT+I`.
```
pip install cmake-format
cmake-format --version
```
Last command should output `0.6.9`.
