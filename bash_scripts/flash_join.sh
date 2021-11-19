#!/bin/bash
#BSUB -J flash_join
#BSUB -P mbe326
#BSUB -q normal
#BSUB -n 10
#BSUB -R "rusage[mem=4000M]"
#BSUB -W 4:00
#BSUB -o /scratch/mbe326/MKD/err_and_out/flash_join3.out
#BSUB -e /scratch/mbe326/MKD/err_and_out/flash_join3.err
###################################################################
#SETUP

#change directory to quality trimmed sequences
cd /scratch/mbe326/final_trim
ids=`cat /scratch/mbe326/raw_reads/ids.txt`

for id in $ids
do flash $id\_R.fw_paired.fq.gz $id\_R.rv_paired.fq.gz -o $id -d /scratch/mbe326/MKD/Flash_mkd
done



