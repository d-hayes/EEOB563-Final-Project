#!/bin/bash

for file in ../nucleotide/*.fa.aln; do

    # Extract the gene name from the file name
    gene=$(basename ${file} .fa.aln)

    # Create an associative array to store the concatenated gene sequences for each species
    declare -A species_seqs

    # Loop through each line of the input file
    while read line; do
        if [[ "${line}" == ">"* ]]; then
            # Extract the species name from the line
            species=${line#>}

            # Initialize an empty string for the gene sequence for the species
            species_seq=""

        elif [[ -n "${line}" ]]; then
            # Concatenate the gene sequence for the species
            species_seq="${species_seq}${line}"
        fi

        # Store the concatenated gene sequence for the species in the associative array
        species_seqs[${species}]=${species_seq}

    done < ${file}

    # Loop through the species in the associative array
    for species in "${!species_seqs[@]}"; do
        # Write the concatenated gene sequence for the species to the output file
        echo ">${species}\n${species_seqs[${species}]}" > ${gene}.${species}.fa.aln
    done

done

