#!/bin/bash
#BSUB -P mbe326
#BSUB -J wg_bowtie
#BSUB -q normal
#BSUB -W 48:00
#BSUB -n 15
#BSUB -e /scratch/mbe326/MKD/err_and_out/bowtie_wgs.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/bowtie_wgs.out

# load environment
module load anaconda3/biohpc

# Define Variables
REF=/scratch/mbe326/genome_ref/astipes_masked_ref.fasta
IDS=/scratch/mbe326/ids.txt
R1=/scratch/mbe326/Flash/{}.notCombined_1.fastq
R2=/scratch/mbe326/Flash/{}.notCombined_2.fastq
SINGLETS=/scratch/mbe326/singlet/{}_singlet.fastq.gz
BOWTIE_OUT=/scratch/mbe326/MKD/bowtie_map/{}.bowtie_paired.sam
BOWTIE_SINGLES_OUT=/scratch/mbe326/MKD/bowtie_map/{}.bowtie_singles.sam

# align one at a time
cat $IDS | parallel bowtie2 -q --phred33 --very-sensitive-local -p 10 -I 0 -X 1500 --fr --rg-id {} --rg SM:{} --rg LB:{} --rg PU:1 --rg PL:ILLUMINA -x $REF -1 $R1 -2 $R2 -S $BOWTIE_OUT
cat $IDS | parallel bowtie2 -q --phred33 --very-sensitive-local -p 10 --rg-id {} --rg SM:{} --rg LB:{} --rg PU:1 --rg PL:ILLUMINA -x $REF -U $SINGLETS -S $BOWTIE_SINGLES_OUT
