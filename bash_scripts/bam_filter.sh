#!/bin/bash
#BSUB -P mbe326
#BSUB -J bam_filter
#BSUB -q normal
#BSUB -W 3:00
#BSUB -n 10
#BSUB -e /scratch/mbe326/MKD/err_and_out/wgs_bam_filter.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/wgs_bam_filter.out

# load env
module load anaconda3/biohpc

# identify sam files
IDS=/scratch/mbe326/ids.txt
PAIRED_BAMS=/scratch/mbe326/MKD/bowtie_map/{}_paired.bam
SINGLE_BAMS=/scratch/mbe326/MKD/bowtie_map/{}_singles.bam
FILTERED_BAMS=/scratch/mbe326/MKD/filt_bams/{}_paired_filtered.bam
FILTERED_BAMS_SINGLE=/scratch/mbe326/MKD/filt_bams/{}_single_filtered.bam

# remove mapped reads with quality score <20 and with non-unique mappings
cat $IDS | parallel "samtools view -h -q 20 $PAIRED_BAMS | grep -v XS:i | samtools view -buS - | samtools sort - -o $FILTERED_BAMS"
cat $IDS | parallel "samtools view -h -q 20 $SINGLE_BAMS | grep -v XS:i | samtools view -buS - | samtools sort - -o $FILTERED_BAMS_SINGLE"
