#!/bin/bash

mkdir build_charls && cd build_charls

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_CXX_FLAGS='-fPIC' \
      $SRC_DIR

make -j$CPU_COUNT
make install -j$CPU_COUNT

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
