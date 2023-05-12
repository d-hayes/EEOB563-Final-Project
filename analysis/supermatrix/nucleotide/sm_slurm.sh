#!/bin/bash

#SBATCH --time=24:0:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=8   # number of nodes
#SBATCH --ntasks-per-node=36   # 36 processor core(s) per node 
#SBATCH --mem=350G   # maximum memory per node
#SBATCH --job-name="supermatrix_nt"
#SBATCH --mail-user=hayesd@iastate.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END

module load raxml-ng

raxml-ng --msa ../../data/alignment/concat/species_concat_nt.fa.aln --model GTR+G --prefix supermatrix_nt --seed 951
