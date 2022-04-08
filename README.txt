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
