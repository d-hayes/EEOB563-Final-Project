#!/bin/bash

#SBATCH --time=6:0:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=8   # number of nodes
#SBATCH --ntasks-per-node=36   # 36 processor core(s) per node 
#SBATCH --mem=350G   # maximum memory per node
#SBATCH --job-name="supermatrix_nt"
#SBATCH --mail-user=hayesd@iastate.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END

module load raxml-ng

raxml-ng --msa ../../../data/alignment/protein/atp6.pep.fasta.fa.aln --model GTR+G --prefix atp6_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/atp8.pep.fasta.fa.aln --model GTR+G --prefix atp8_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/cob.pep.fasta.fa.aln --model GTR+G --prefix cob_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/cox1.pep.fasta.fa.aln --model GTR+G --prefix cox1_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/cox2.pep.fasta.fa.aln --model GTR+G --prefix cox2_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/cox3.pep.fasta.fa.aln --model GTR+G --prefix cox3_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/mutS.pep.fasta.fa.aln --model GTR+G --prefix mutS_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/nad1.pep.fasta.fa.aln --model GTR+G --prefix nad1_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/nad2.pep.fasta.fa.aln --model GTR+G --prefix nad2_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/nad3.pep.fasta.fa.aln --model GTR+G --prefix nad3_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/nad4L.pep.fasta.fa.aln --model GTR+G --prefix nad4L_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/nad4.pep.fasta.fa.aln --model GTR+G --prefix nad4_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/nad5.pep.fasta.fa.aln --model GTR+G --prefix nad5_aa --seed 951
raxml-ng --msa ../../../data/alignment/protein/nad6.pep.fasta.fa.aln --model GTR+G --prefix nad6_aa --seed 951

cat *.bestTree > aa_gene_tree.tre

