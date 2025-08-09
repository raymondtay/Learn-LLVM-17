#!/bin/bash

mkdir build
cd build
cmake ../ && cmake --build .
echo '1. Compiler built'
./tools/driver/tinylang --filetype=obj ../examples/Gcd.mod
echo '2. Compiler translated and built "Gcd.mod"'
echo '3. Compiler integrated with Gcd.o object file'
clang ../examples/callgcd.c ../examples/Gcd.o -o gcd
echo '4. Running final program'
./gcd
