#!/usr/bin/env bash

set -eux

TORCH_CMAKE_PREFIX=$(python -c "import torch; print(torch.utils.cmake_prefix_path)")
METATENSOR_CMAKE_PREFIX=$(python -c "import metatensor; print(metatensor.utils.cmake_prefix_path)")
METATENSOR_TORCH_CMAKE_PREFIX=$(python -c "import metatensor.torch; print(metatensor.torch.utils.cmake_prefix_path)")
RASCALINE_CMAKE_PREFIX=$(python -c "import rascaline; print(rascaline.utils.cmake_prefix_path)")
RASCALINE_TORCH_CMAKE_PREFIX=$(python -c "import rascaline.torch; print(rascaline.torch.utils.cmake_prefix_path)")


rm -rf lammps
git clone --depth 1 https://github.com/Luthaf/lammps --branch ml-metatensor --single-branch
cd lammps


mkdir build && cd build
cmake \
    -DMKL_INCLUDE_DIR=/usr/include \
    -DPKG_ML-METATENSOR=ON \
    -DPKG_MOLECULE=ON \
    -DPKG_KSPACE=ON \
    -DCMAKE_PREFIX_PATH="$TORCH_CMAKE_PREFIX;$METATENSOR_CMAKE_PREFIX;$METATENSOR_TORCH_CMAKE_PREFIX;$RASCALINE_CMAKE_PREFIX;$RASCALINE_TORCH_CMAKE_PREFIX" \
    -DCMAKE_INSTALL_PREFIX="$(realpath "$(dirname "$(which python)")"/..)" \
    ../cmake

cmake --build . --target install -j 10
