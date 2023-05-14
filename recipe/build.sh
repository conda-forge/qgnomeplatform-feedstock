set -ex

mkdir -p build
cd build

cmake ${CMAKE_ARGS} \
    -DUSE_QT6=ON                    \
    -DCMAKE_BUILD_TYPE="Release"    \
    -DCMAKE_PREFIX_PATH=${PREFIX}   \
    -DQT_HOST_PATH=${PREFIX}        \
    ..

make -j${CPU_COUNT}
make install
