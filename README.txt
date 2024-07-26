UPDATE July 2024

We have found that the neighbour list used in the water coordination number switching functions such as 
L1: COORDINATION GROUPA=l1 GROUPB=WO SWITCH={RATIONAL D_0=0.0 R_0=0.25 NN=6 MM=10} NLIST NL_CUTOFF=1.0 NL_STRIDE=5
determines a systematic error on the estimated binding free energy. 
This is due to a small discontinuity of the switching function itself at NL_CUTOFF.

We have replaced the affected switching functions with stretched versions that go smoothly to zero thanks to the D_MAX parameter
L1: COORDINATION GROUPA=l1 GROUPB=WO SWITCH={RATIONAL D_0=0.0 R_0=0.25 NN=6 MM=10 D_MAX=1.3} NLIST NL_CUTOFF=1.4 NL_STRIDE=5.

The new input files have been tested on more recent code versions than the original paper, i.e. GROMACS 202.5 and PLUMED 2.8.4 with Pytorch library 1.4.
The Pytorch Model to be included in the src/function folder of the Plumed sorce code is PytorchModel.cpp.

------------------------------------

The role of water in host-guest interaction - DOI:10.1038/s41467-020-20310-0
http://www.nature.com/articles/s41467-020-20310-0 
https://arxiv.org/abs/2006.13274

This archive contains all the input files needed to reproduce the results of the paper.
In each folder the following files are available:
- NVT.mdp, topol.top and topol.tpr are the GROMACS input.
- b.gro contains a binding pose configuration and u.gro a configuration with the solvated guest molecule.
- plumed.dat is the PLUMED input, conf_template.pdb is a coordinate alignment file and the model*.pt files contain the neural network models that produce the Deep-LDA CVs.

The OAMe_G* folders contain the files for simulations using the host OAMe in conjuction with all ligands (G1,...,G6).
Similarly, the OAH_G* folders contain the files pertaining to host OAH.
The folders OAMe_alone and OAH_alone contain the files for ligand-free simulations with the two hosts.

The folder code contains the codes for OPES and the Pytorch model to be used in conjunction with PLUMED.
More information about using PLUMED with Pytorch can be found at https://github.com/luigibonati/data-driven-CVs.
More information about OPES can be found at https://github.com/invemichele/opes.

The simulations were performed with PLUMED 2.5, Pytorch 1.4 and GROMACS 2019.4.
