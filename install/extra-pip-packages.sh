#!/usr/bin/env bash

set -eux

pip install --extra-index-url https://download.pytorch.org/whl/cpu torch

pip uninstall -y metatensor metatensor-core metatensor-operations metatensor-torch
pip uninstall -y rascaline rascaline-torch

pip cache remove "metatensor*"
pip cache remove "rascaline*"

pip install --no-build-isolation "metatensor-core @ git+https://github.com/Luthaf/metatensor@7d095c9#subdirectory=python/metatensor-core"
pip install --no-build-isolation "metatensor-torch @ git+https://github.com/Luthaf/metatensor@7d095c9#subdirectory=python/metatensor-torch"
pip install --no-build-isolation "metatensor-operations @ git+https://github.com/Luthaf/metatensor@7d095c9#subdirectory=python/metatensor-operations"

pip install --no-deps --no-build-isolation "rascaline @ git+https://github.com/Luthaf/rascaline@6eda441"
pip install --no-deps --no-build-isolation "rascaline-torch @ git+https://github.com/Luthaf/rascaline@6eda441#subdirectory=python/rascaline-torch"
