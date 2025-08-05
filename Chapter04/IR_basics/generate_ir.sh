#!/usr/local/bin/bash

echo 'Generating the IR...'
clang --target=aarch64-linux-gnu -S -emit-llvm gcd.c
