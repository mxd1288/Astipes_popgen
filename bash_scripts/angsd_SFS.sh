#!/bin/bash
#BSUB -P mbe326
#BSUB -J sfs
#BSUB -q normal
#BSUB -W 72:00
#BSUB -n 15
#BSUB -e /scratch/mbe326/MKD/err_and_out/sfs.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/sfs.out

# load environment
module load anaconda3/biohpc
BAMS_dir=/scratch/mbe326/bowtie2_dedup
BAMS_bwa_dir=/scratch/mbe326/bwa_dedup_bams
BAMS=/scratch/mbe326/bowtie2_dedup/bams.txt
BAMS_bwa=/scratch/mbe326/bwa_dedup_bams/bams.txt
ANGSD=/home/mxd1288/software/angsd/angsd
OUT=/scratch/mbe326/MKD/SFS_angsd
REF=/scratch/mbe326/genome_ref/astipes_masked_ref.fasta

# load env
module load anaconda3/biohpc

cd $BAMS_dir
$ANGSD -bam $BAMS -doSaf 1 -out $OUT/astipes_sfs_bowtie -anc $REF -GL 2 -P 15

cd $BAMS_bwa_dir
$ANGSD -bam $BAMS_bwa -doSaf 1 -out $OUT/astipes_sfs_bwa -anc $REF -GL 2 -P 15 
