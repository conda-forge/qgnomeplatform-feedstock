set -ex

mkdir -p build
cd build

cmake ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE="Release"    \
    -DCMAKE_PREFIX_PATH=${PREFIX}   \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    ..

make -j${CPU_COUNT}
make install
