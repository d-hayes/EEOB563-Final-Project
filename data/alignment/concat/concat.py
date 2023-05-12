#!/usr/bin/python3

with open("concat_by_gene_aa.fa", "r") as f:
    fa_lines = f.readlines()

fa_dict = {}
for line in fa_lines:
    if line.startswith(">"):
        species = line.strip()[1:]
        if species not in fa_dict:
            fa_dict[species] = ""
    else:
        fa_dict[species] += line.strip()

with open("species_concat_aa.fa", "w") as f:
    for species, seq in fa_dict.items():
        f.write(">{}\n{}\n".format(species, seq))
