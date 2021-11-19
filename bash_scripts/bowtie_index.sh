#!/bin/bash

#BSUB -P fun_gen_1
#BSUB -J index
#BSUB -q bigmem
#BSUB -W 120:00
#BSUB -e /projects2/rsmas/dcrawford/MKD/HHsilverside/subset_illumina/err_and_out/bowtie.err
#BSUB -o /projects2/rsmas/dcrawford/MKD/HHsilverside/subset_illumina/err_and_out/bowtie.out

BOWTIE=~/software/local/bowtie2-2.4.4-linux-x86_64/bowtie2
BASEDIR=/projects2/rsmas/dcrawford/MKD/HHsilverside/subset_illumina
REFERENCE=$BASEDIR/reference/asipes_pilon4.fasta # Path to reference fasta file and file name
REFNAME=astipes_p4 # Reference name to add to output files, e.g. gadMor2
BOWTIEBUILD=~/software/local/bowtie2-2.4.4-linux-x86_64/bowtie2-build

REFERENCE=$BASEDIR/reference/astipes_pilon4.fasta   # This is a fasta file with the reference genome sequence we will map to 
REFBASENAME="${REFERENCE%.*}"
$SAMTOOLS faidx $REFERENCE

java -jar $PICARD CreateSequenceDictionary R=$REFERENCE O=$REFBASENAME'.dict'

$BOWTIEBUILD $REFERENCE $REFBASENAME
