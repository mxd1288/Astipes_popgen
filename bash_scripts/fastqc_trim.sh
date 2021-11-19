#!/bin/bash

#BSUB -P mbe326
#BSUB -J fastqc
#BSUB -q normal
#BSUB -W 3:00
#BSUB -n 8
#BSUB -o /scratch/mbe326/MKD/err_and_out/trim_fq.out
#BSUB -e /scratch/mbe326/MKD/err_and_out/trim_fq.err

cd /scratch/mbe326/MKD/adapter_clipped

# make new list of unique file names
ls | grep -o '.*paired' > trim_ids.txt

module load anaconda3/biohpc

cat trim_ids.txt| parallel fastqc -o /scratch/mbe326/MKD/fastqc_trim {}.fq.gz
