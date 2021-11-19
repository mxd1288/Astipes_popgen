#!/bin/bash
#BSUB -P mbe326
#BSUB -J markdups
#BSUB -q normal
#BSUB -W 3:00
#BSUB -n 10
#BSUB -e /scratch/mbe326/MKD/err_and_out/markdups_wgs_bwa.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/markdups_wgs_bwa.out

# load env
module load anaconda3/biohpc

# identify sam files
IDS=/scratch/mbe326/ids.txt
#FINAL_BAM=/scratch/mbe326/MKD/final_bams/{}_final.bam
FINAL_BAM_BWA=/scratch/mbe326/bwa_merge/{}.merge.bam
#DUPS_BAM=/scratch/mbe326/MKD/picard_dedup/{}_marked_duplicates.bam
DUPS_BAM_BWA=/scratch/mbe326/bwa_dedup_bams/{}_marked_duplicates.bam
#METRICS=/scratch/mbe326/MKD/picard_dedup/{}_dupstat.txt
METRICS_BWA=/scratch/mbe326/bwa_dedup_bams/{}_dupstat.txt

# mark and remove duplicates with picard -- can inflate depth 
#cat $IDS | parallel "picard MarkDuplicates I=$FINAL_BAM O=$DUPS_BAM M=$METRICS VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=true MAX_FILE_HANDLES=1000"
cat $IDS | parallel "picard MarkDuplicates I=$FINAL_BAM_BWA O=$DUPS_BAM_BWA M=$METRICS_BWA VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=true MAX_FILE_HANDLES=1000"
