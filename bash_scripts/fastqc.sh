#!/bin/bash

#BSUB -P mbe326
#BSUB -J fastqc
#BSUB -q normal
#BSUB -W 3:00
#BSUB -n 8
#BSUB -o /scratch/mbe326/MKD/err_and_out/raw_fq.out
#BSUB -e /scratch/mbe326/MKD/err_and_out/raw_fq.err

cd /scratch/mbe326/MKD

module load anaconda3/biohpc

ls ../raw_reads | grep -o '.*fastq.gz' | uniq > $SCR/files.txt
ls ../raw_reads | grep -o '.*R' | uniq > $SCR/ids.txt


cd /scratch/mbe326/raw_reads
cat /scratch/mbe326/MKD/ids.txt | parallel fastqc -o /scratch/mbe326/MKD/fastqc_raw {}*_001.fastq.gz
