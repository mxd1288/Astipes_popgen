#!/bin/bash
#BSUB -P mbe326
#BSUB -J wgs_snps
#BSUB -q normal
#BSUB -W 48:00
#BSUB -n 15
#BSUB -e /scratch/mbe326/MKD/err_and_out/snps_BT.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/snps_BT.out

# load environment
module load anaconda3/biohpc

# set ids
#IDS=/scratch/mbe326/ids.txt
#INX=/scratch/mbe326/bowtie2_dedup/{}_marked_duplicates.bam

# index bams
#cat $IDS | parallel "samtools index $INX"

# LOAD NEW ENV
conda activate freebayes_snps

# identify sam files
REF=/scratch/mbe326/genome_ref/astipes_masked_ref.fasta
BAMS=/scratch/mbe326/bowtie2_dedup/bams.txt
OUT=/scratch/mbe326/MKD/wgs_snps

cd /scratch/mbe326/bowtie2_dedup

# call SNPs with freebayes
freebayes -f $REF --bam-list $BAMS > $OUT/Astipes_wgs_SNPs.vcf
