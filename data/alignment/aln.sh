#!/bin/bash

for FILE in ../../raw/protein/*fasta;
    do mafft --auto $FILE > $(basename $FILE .fasta.clean).fa.aln;
done

for FILE in *fa.aln;
    do seqret -sequence $FILE -outseq $(basename $FILE fa.aln).nxs.aln;
done
