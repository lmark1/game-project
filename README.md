# game-project

[![codecov](https://codecov.io/gh/lefticus/cpp_starter_project/branch/master/graph/badge.svg)](https://codecov.io/gh/lefticus/cpp_starter_project)

[![Build Status](https://travis-ci.org/lefticus/cpp_starter_project.svg?branch=master)](https://travis-ci.org/lefticus/cpp_starter_project)

[![Build status](https://ci.appveyor.com/api/projects/status/ro4lbfoa7n0sy74c/branch/master?svg=true)](https://ci.appveyor.com/project/lefticus/cpp-starter-project/branch/master)

## Prerequisites
The following programs need to be installed prior to building this code.
* gcc-9
* clang-9
* clang-tidy-9
* clang-format
* cmake-3.17
* cmake-format
* ccmake
* ccache
* conan
* doxygen

### gcc-9
C/C++ compiler using the C++20 standard. It is assumed the user has gcc version 7.5 installed, however this installation is applicable for other versions as well. Firstly, install gcc-9 in the following way.
```
sudo add-apt-repository ppa:jonathonf/gcc-9.0
sudo apt update
sudo apt install gcc-9
```
Next, we will configure the gcc symbolic link to switch between gcc-9 and gcc-7 as needed.
```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50 --slave /usr/bin/g++ g++ /usr/bin/g++-7
```
We test out this functionality in the following way.
```
~$ sudo update-alternatives --config gcc
# In the menu, please select the number next to the path to gcc-7
~$ gcc --version
gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

~$ sudo update-alternatives --config gcc
# In the menu, please select the number next to the path to gcc-9
~$ gcc --version
gcc (Ubuntu 9-20190428-1ubuntu1~18.04.york0) 9.0.1 20190428 (prerelease) [gcc-9-branch revision 270630]
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```
For the remainder of this project we will use gcc-9 compiler.

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
A tool for  diagnosing and fixing typical programming errors, like style violations, interface misuse, or bugs that can be deduced via **STATIC** analysis. If you are using VSCode, also install the clang-tidy extension.
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
### cmake-3.17 (With ROS)
Assuming the user is using ROS, cmake is unable to update past the 3.10 version as seen by command `cmake --version`. Solution used here is using 2 cmake programs; one installed globally (3.10) and one installed locally (3.17).
```
cd ~/Downloads
wget https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0.tar.gz
tar -xzf cmake-3.17.0.tar.gz
cd cmake-3.17.0
./bootstrap --prefix=$HOME/cmake-install
make
make install
```
Now cmake-3.17 lives in the `$HOME/cmake-install` folder. Only thing we need to do now is make an alias command towards the new cmake binary.
```
echo alias cmake-3.17='$HOME/cmake_install/bin/cmake' >> ~/.bashrc
source ~/.bashrc
```
Lastly, check if we got the correct version using the command `cmake-3.17 --version`. It should output:
```
cmake version 3.17.0

CMake suite maintained and supported by Kitware (kitware.com/cmake).
```
**IMPORTANT!** When building this project **ALWAYS** use cmake-3.17 command. Cmake versions <3.15 will be automatically rejected.

### cmake-format
A tool used to format Cmake code. Formatting specifications are found in .cmake-format file in the root of this project. If you are using VSCode, also install the cmake-format extension. Formatting shortcut is `CTRL+SHIFT+I`.
```
pip install cmake-format
cmake-format --version
```
Last command should output `0.6.9`.

### ccmake
The “ccmake” executable is the CMake curses interface. Project configuration settings may be specified interactively through this GUI. Brief instructions are provided at the bottom of the terminal when the program is running.
```
sudo apt install cmake-curses-gui
```
### ccache
Ccache (or “ccache”) is a compiler cache. It speeds up recompilation by caching previous compilations and detecting when the same compilation is being done again.
```
sudo apt install ccache
```

### Conan
Conan is a dependency and package manager for C and C++ languages. Dependancies listed for this project can be seen in the cmake/Conan.cmake file.
```
pip install conan
```

### Doxygen
Doxygen is the de facto standard tool for generating documentation from annotated C++ sources, but it also supports other popular programming languages such as C, Objective-C, C#, PHP, Java, Python, IDL (Corba, Microsoft, and UNO/OpenOffice flavors), Fortran, VHDL and to some extent D.
```
sudo apt install doxygen
```
### Cppcheck
Cppcheck is a **STATIC** analysis tool for C/C++ code. It provides unique code analysis to detect bugs and focuses on detecting undefined behaviour and dangerous coding constructs. The goal is to detect only real errors in the code (i.e. have very few false positives).
```
sudo apt install cppcheck
```

## VSCode setup
`.vscode` folder is intentionally left in this repository to ease the user experience when using this IDE with this project.
However, there are some issues.
* TODO: Hardcoded paths in .vscode/c_cpp_properties.json - Change accordingly
* TODO: Hardcoded paths in .vscode/settings.json - Change - accordingly

## Build
To build this code position yourself at the root of this project and execute following commands.
```
cd ..
mkdir game-project-build
cd game-project-build
cmake-3.17 ../game-project
make
```
All executable files are located in `game-project-build/bin` folder. 
Alternatively building with VSCode is a bit easier. `CTRL+SHIFT+B -> Select CmakeRun/build`.
