#!/bin/bash

# Corrected for LLVM@19
BUILD_DIR=build
cmake -DLLVM_DIR=/usr/local/opt/llvm -DCMAKE_BUILD_TYPE=Debug -DLLVM_ENABLE_ASSERTIONS=ON -S . -B $BUILD_DIR && cmake --build $BUILD_DIR

echo '1. Compiler built'
./$BUILD_DIR/tools/driver/tinylang --filetype=obj ./examples/Point.mod
echo '2. Compiler translated and built "Point.mod"'
clang ./examples/callpoint.c ./examples/Point.o -o point
./point
