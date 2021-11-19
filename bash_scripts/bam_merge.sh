#!/bin/bash
#BSUB -P mbe326
#BSUB -J merge_bams
#BSUB -q normal
#BSUB -W 3:00
#BSUB -n 10
#BSUB -e /scratch/mbe326/MKD/err_and_out/merge_bams_wgs.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/merge_bams_wgs.out

# load env
module load anaconda3/biohpc

# identify sam files
IDS=/scratch/mbe326/ids.txt
CLIPPED_MAPPED=/scratch/mbe326/MKD/clipped_bams/{}_paired_clip_mapONLY_filt.bam
CLIPPED_MAPPED_SINGLES=/scratch/mbe326/MKD/clipped_bams/{}_singles_clip_mapONLY_filt.bam
CLIP_MAP_BWA=/scratch/mbe326/MKD/clipped_bams_bwa/{}_paired_clip_mapONLY_filt.bam
CLIP_MAP_SINGLES_BWA=/scratch/mbe326/MKD/clipped_bams_bwa/{}_singles_clip_mapONLY_filt.bam

FINAL_BAM=/scratch/mbe326/MKD/final_bams/{}_final.bam
FINAL_BAM_BWA=/scratch/mbe326/MKD/final_bams_bwa/{}_final.bam

# merge paired and singles into one BAM file
# list outbam FIRST, then files to merge
cat $IDS | parallel "samtools merge -f $FINAL_BAM $CLIPPED_MAPPED $CLIPPED_MAPPED_SINGLES"
cat $IDS | parallel "samtools merge -f $FINAL_BAM_BWA $CLIP_MAP_BWA $CLIP_MAP_SINGLES_BWA"
