#! /usr/bin/env bash

cd $HOME/blender-git/blender && git pull

for i in /tmp/patches/* ; do
    echo "applying" "$i"
    patch -p1 < "$i"
done

cd $HOME/blender-git/blender && \
mkdir buildfolder && \
cd buildfolder && \
cmake \
    -C"$HOME/blender-git/blender/build_files/cmake/config/blender_full.cmake" \
    -DLIBDIR=/opt/blender/lib .. && \
make -j 4 && make install

cd $HOME/blender-git/blender/buildfolder && \
cpack -G TGZ .

