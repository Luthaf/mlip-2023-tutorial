# Training a Machine Learning Interatomic Potential with metatensor

This repository contains the notebook for the tutorial on training fully custom
MLIP using metatensor, presented during the CECAM/Psi-k school on MLIP of 2023
(https://www.mlip-workshop.xyz).


## Running the tutorials

You should go through the different notebooks in this repository in order.
Everytime you see this icon

![TASK](images/clipboard.png)

This means you need to modify the code to make it work and make a small test
pass. All the modifications should only require basic Python knowledge, and no
specific PyTorch/Metatensor/Rascaline knowledge.

## Installation

You don't need to install the code if you are participating to the school
on-site, we are already providing you with an environment for this on the Puhti
supercalculator.

If you are joining the school remotely, or want to re-run this tutorial after
the school ends, here is how you can install everything needed!

You'll need a working conda installation, and to run the following commands:

```bash
git clone https://github.com/Luthaf/mlip-2023-tutorial
cd mlip-2023-tutorial

conda env create --file install/environment.yaml
conda activate metatensor-mlip-2023
./install/extra-pip-packages.sh

# if you want to run the LAMMPS-md notebook
./install/build-lammps.sh
```
