#!/bin/bash
#BSUB -P mbe326
#BSUB -J sam2bam
#BSUB -q normal
#BSUB -W 3:00
#BSUB -n 10
#BSUB -e /scratch/mbe326/MKD/err_and_out/wgs_sam2bam.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/wgs_sam2bam.out

# load env
module load anaconda3/biohpc

# identify sam files
IDS=/scratch/mbe326/ids.txt
PAIRED_SAMS=/scratch/mbe326/MKD/bowtie_map/{}.bowtie_paired.sam
SINGLE_SAMS=/scratch/mbe326/MKD/bowtie_map/{}.bowtie_singles.sam
PAIRED_BAMS=/scratch/mbe326/MKD/bowtie_map/{}_paired.bam
SINGLE_BAMS=/scratch/mbe326/MKD/bowtie_map/{}_singles.bam

cat $IDS | parallel "samtools view -bS -F 4 $PAIRED_SAMS > $PAIRED_BAMS"
cat $IDS | parallel "samtools view -bS -F 4 $SINGLE_SAMS > $SINGLE_BAMS"
