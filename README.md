# game-project

[![codecov](https://codecov.io/gh/lefticus/cpp_starter_project/branch/master/graph/badge.svg)](https://codecov.io/gh/lefticus/cpp_starter_project)

[![Build Status](https://travis-ci.org/lefticus/cpp_starter_project.svg?branch=master)](https://travis-ci.org/lefticus/cpp_starter_project)

[![Build status](https://ci.appveyor.com/api/projects/status/ro4lbfoa7n0sy74c/branch/master?svg=true)](https://ci.appveyor.com/project/lefticus/cpp-starter-project/branch/master)

## Prerequisites
The following programs need to be installed prior to building this code.

### cmake-format
A tool used to format Cmake code. Formatting specifications are found in .cmake-format file in the root of this project. If you are using VSCode, also install the cmake-format extension. Formatting shortcut is `CTRL+SHIFT+I`.
```
pip install cmake-format
cmake-format --version
```
Last command should output `0.6.9`.

### clang-9
C/C++ compiler
```
sudo apt install llvm-9
sudo apt install clang-9
clang --version
```
Last command should output:
```
clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
```
If you are unable to run `clang --version` check if there is a clang binary with the command `ls -al /usr/bin | grep clang`. If the command outputs something like this:
```
lrwxrwxrwx  1 root root           23 sij  31 17:26 clang-9 -> ../lib/llvm-9/bin/clang
# Some other output...
```
then we need to create a symbolic link to clang-tidy using the following command:
```
sudo ln -s /usr/bin/clang-9 /usr/bin/clang
```

### clang-format
A tool used to format C++ code. Formatting specifications are found in .clang-format file in the root of this project. If you are using VSCode, also install the clang-format extension. Formatting shortcut is `CTRL+SHIFT+I`.
```
sudo apt install clang-format
clang-format --version
```
Last command should output `clang-format version 6.0.0`.

### clang-tidy-9
A tool for  diagnosing and fixing typical programming errors, like style violations, interface misuse, or bugs that can be deduced via static analysis. If you are using VSCode, also install the clang-tidy extension.
Firstly, uninstall any previous clang-tidy versions using `sudo apt purge clang-tidy*`.
```
sudo apt install llvm-9
sudo apt install clang-tidy-9
clang-tidy --version
```
Last command should state something like this:
```
LLVM (http://llvm.org/):
  LLVM version 9.0.0
  
  Optimized build.
  Default target: x86_64-pc-linux-gnu
  Host CPU: skylake
```
If you are unable to run `clang-tidy --version` check if there is a clang-tidy binary with the command `ls -al /usr/bin | grep clang-tidy`. If the command outputs something like this:
```
lrwxrwxrwx  1 root root           28 sij  31 17:26 clang-tidy-9 -> ../lib/llvm-9/bin/clang-tidy
lrwxrwxrwx  1 root root           44 sij  31 17:26 clang-tidy-diff-9.py -> ../lib/llvm-9/share/clang/clang-tidy-diff.py
lrwxrwxrwx  1 root root           43 sij  31 17:26 run-clang-tidy-9 -> ../lib/llvm-9/share/clang/run-clang-tidy.py
lrwxrwxrwx  1 root root           43 sij  31 17:26 run-clang-tidy-9.py -> ../lib/llvm-9/share/clang/run-clang-tidy.py
```
then we need to create a symbolic link to clang-tidy using the following command:
```
sudo ln -s /usr/bin/clang-tidy-9 /usr/bin/clang-tidy
```
