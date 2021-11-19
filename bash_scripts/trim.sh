#!/bin/bash

#BSUB -P mbe326
#BSUB -J trimming
#BSUB -q normal
#BSUB -n 8
#BSUB -W 10:00
#BSUB -o /scratch/mbe326/MKD/err_and_out/trim.out
#BSUB -e /scratch/mbe326/MKD/err_and_out/trim.err

#trim off adapters
cd $SCR
cat ids.txt| parallel "java -jar ~/software/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 $SCR/../raw_reads/{}1_001.fastq.gz $SCR/../raw_reads/{}2_001.fastq.gz {}.fw_paired.fq.gz {}.fw_unpaired.fq.gz {}.rv_paired.fq.gz {}.rv_unpaired.fq.gz ILLUMINACLIP:Nextera-PE.fa:2:30:10:1:TRUE LEADING:10 SLIDINGWINDOW:4:15 MINLEN:50"
