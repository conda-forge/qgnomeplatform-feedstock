set -ex

mkdir -p build
cd build

# Remove private dependencies since they aren't linked anyway
# We thus "remove them" outright to avoid burdening the recipe with unecessary
# dependencies
# https://github.com/conda-forge/conda-forge.github.io/issues/1880
find "${PREFIX}/lib/pkgconfig" -type f -name '*.pc' -exec sed -i.bak \
    -e '/^Requires\.private/d' \
    -e '/^Libs\.private/d' \
    {} +
find "${PREFIX}/lib/pkgconfig" -type f -name '*.bak' -delete

cmake ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE="Release"    \
    -DCMAKE_PREFIX_PATH=${PREFIX}   \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    ..

make -j${CPU_COUNT}
make install
