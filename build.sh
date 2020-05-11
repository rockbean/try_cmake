#!/bin/bash

mkdir -p build && cd build

#Configure
cmake -DCMAKE_BUILD_TYPE=debug ..

#Build
cmake --build . -- -j $(nproc)