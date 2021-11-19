#!/bin/bash
#BSUB -P mbe326
#BSUB -J softclip
#BSUB -q normal
#BSUB -W 3:00
#BSUB -n 10
#BSUB -e /scratch/mbe326/MKD/err_and_out/softclip_map_wgs.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/softclip_map_wgs.out

# load env
module load anaconda3/biohpc

# identify sam files
IDS=/scratch/mbe326/ids.txt
FILTERED_BAMS=/scratch/mbe326/MKD/filt_bams/{}_paired_filtered.bam
FILTERED_BAMS_SINGLE=/scratch/mbe326/MKD/filt_bams/{}_single_filtered.bam
BWA_BAMS=/scratch/mbe326/sjh/bam_sort/{}.pair.sort.bam 
BWA_BAMS_SINGLE=/scratch/mbe326/sjh/bam_sort/{}.pair.sort.bam 
CLIPPED_BAMS=/scratch/mbe326/MKD/clipped_bams/{}_paired_clip_filt.bam
CLIPPED_BAMS_SINGLE=/scratch/mbe326/MKD/clipped_bams/{}_singles_clip_filt.bam
CLIPPED_BWA=/scratch/mbe326/MKD/clipped_bams_bwa/{}_paired_clip_filt.bam
CLIPPED_BWA_SINGLE=/scratch/mbe326/MKD/clipped_bams_bwa/{}_singles_clip_filt.bam
CLIPPED_MAPPED=/scratch/mbe326/MKD/clipped_bams/{}_paired_clip_mapONLY_filt.bam
CLIPPED_MAPPED_SINGLES=/scratch/mbe326/MKD/clipped_bams/{}_singles_clip_mapONLY_filt.bam
CLIPPED_MAPPED_BWA=/scratch/mbe326/MKD/clipped_bams_bwa/{}_paired_clip_mapONLY_filt.bam
CLIPPED_MAPPED_SINGLES_BWA=/scratch/mbe326/MKD/clipped_bams_bwa/{}_singles_clip_mapONLY_filt.bam

# remove mapped reads with quality score <20 and with non-unique mappings
cat $IDS | parallel bam clipOverlap --in $FILTERED_BAMS --out $CLIPPED_BAMS --unmapped --storeOrig OC --stats
cat $IDS | parallel bam clipOverlap --in $FILTERED_BAMS_SINGLE --out $CLIPPED_BAMS_SINGLE --unmapped --storeOrig OC --stats
cat $IDS | parallel bam clipOverlap --in $BWA_BAMS --out $CLIPPED_BWA --unmapped --storeOrig OC --stats
cat $IDS | parallel bam clipOverlap --in $BWA_BAMS_SINGLE --out $CLIPPED_BWA_SINGLE --unmapped --storeOrig OC --stats

# Remove the reads that became unmapped in the clipping
cat $IDS | parallel "samtools view -hb -F 4 $CLIPPED_BAMS > $CLIPPED_MAPPED"
cat $IDS | parallel "samtools view -hb -F 4 $CLIPPED_BAMS_SINGLE > $CLIPPED_MAPPED_SINGLES"
cat $IDS | parallel "samtools view -hb -F 4 $CLIPPED_BWA  > $CLIPPED_MAPPED_BWA"
cat $IDS | parallel "samtools view -hb -F 4 $CLIPPED_BWA_SINGLE > $CLIPPED_MAPPED_SINGLES_BWA"
