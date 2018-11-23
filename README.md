# zelerius-gui

## About

Welcome to the repository of zelerius gui wallet. Here you will find source code, instructions, wiki resources, and integration tutorials.

## IMPORTANT

**Development branch** is used for active development and can be either unstable or incompatible with release software so **DO NOT USE IT!**

## How to build binaries from source code

### Windows
To build the gui you must have built zelerius network, so please do all steps from [here](https://github.com/zelerius/Zelerius-Network#building-on-windows) before proceed. Install [QtCreator](https://www.qt.io/download-thank-you?os=windows), open the project file zelerius-gui/src/zelerius-gui.pro in QtCreator and build it using MSVS kit (you must have MSVS installed already to build zelerius network).

### MacOS

To build the gui you must have built zelerius network, so please do all steps from [here](https://github.com/zelerius/Zelerius-Network#building-on-mac-osx) before proceed. Install [QtCreator](https://www.qt.io/download-thank-you?os=macos), open the project file zelerius-gui/src/zelerius-gui.pro in QtCreator and build it using clang kit (you must have XCode installed already to build zelerius network).

### Linux
```
# To install all required packages on Ubuntu use the following command:
$ sudo apt install qt5-qmake qtbase5-dev qtbase5-dev-tools

$ git clone https://github.com/zelerius/Zelerius-Network.git
$ cd zelerius
$ mkdir -p build
$ cd build
$ cmake ..
$ make -j4 zelerius-crypto
$ cd ../..
$ git clone https://github.com/zelerius/zelerius-gui.git
$ cd zelerius-gui
$ mkdir -p build
$ cd build
$ cmake ..
$ make -j4
```
Alternative way:
```
# Install QtCreator:
$ sudo apt install qtcreator

$ git clone https://github.com/zelerius/Zelerius-Network.git
$ cd zelerius
$ mkdir -p build
$ cd build
$ cmake ..
$ make -j4 zelerius-crypto
$ cd ../..
$ git clone https://github.com/zelerius/zelerius-gui.git
```
Now open the project file zelerius-gui/src/zelerius-gui.pro in QtCreator and build it.
