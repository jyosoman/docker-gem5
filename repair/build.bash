#!/bin/bash
# Build and Clean in one step to keep image manageable

scons -j4 build/ARM/gem5.fast
rm -f /usr/local/bin/gem5.fast
mv build/ARM/gem5.fast /usr/local/bin
rm -rf build
mkdir -p build/ARM
ln -s /usr/local/bin/gem5.fast build/ARM/gem5.fast
