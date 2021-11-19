#!/bin/bash

#BSUB -J lowqual_clip
#BSUB -P mbe326
#BSUB -q normal
#BSUB -n 10
#RAM per core (Use M and G for Mb and Gb)
#BSUB -R "rusage[mem=4000M]"
#BSUB -W 5:00
#BSUB -o /scratch/mbe326/MKD/err_and_out/qual_trim.out
#BSUB -e /scratch/mbe326/MKD/err_and_out/qual_trim.err
###################################################################
#SETUP

#LOAD ENVIRONMENTS
module load anaconda3/biohpc

#change directory
cd /scratch/mbe326/MKD/adapter_clipped

#CODE
cat ids.txt | parallel "java -jar ~/software/Trimmomatic-0.39/trimmomatic-0.39.jar \
PE -threads 10 -phred33 {}.fw_paired.fq.gz {}.fw_unpaired.fq.gz {}.rv_paired.fq.gz {}.rv_unpaired.fq.gz \
/scratch/mbe326/MKD/qual_trim/{}_QT_fw_paired.fq.gz /scratch/mbe326/MKD/qual_trim/{}.QT_fw_unpaired.fq.gz \
/scratch/mbe326/MKD/qual_trim/{}_QT_rv_paired.fq.gz /scratch/mbe326/MKD/qual_trim/{}.QT_rv_unpaired.fq.gz \
LEADING:10 SLIDINGWINDOW:4:15 MINLEN:50"

#Run fastqc on quality trimmed sections

#change directory to quality trimmed sequences
cd /scratch/mbe326/MKD/qual_trim

cat /scratch/mbe326/raw_reads/ids.txt | parallel fastqc -t 5 -o /scratch/mbe326/agw/HH_rdp/final_trim_fastq \
{}_qualtrim_fw_paired.fg.gz {}_qualtrim_fw_unpaired_fw_unpaired.fg.gz {}_qualtrim_rv_paired.fg.gz {}_qualtrim_rv_unpaired.fg.gz

