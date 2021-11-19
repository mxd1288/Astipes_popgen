#!/bin/bash
#BSUB -P mbe326
#BSUB -J genolike
#BSUB -q normal
#BSUB -W 72:00
#BSUB -n 15
#BSUB -e /scratch/mbe326/MKD/err_and_out/genolike_2.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/genolike_2.out

BAMS_bwa_dir=/scratch/mbe326/bwa_dedup_bams2
BAMS_bwa=/scratch/mbe326/bwa_dedup_bams2/bams.txt
ANGSD=/home/mxd1288/software/angsd/angsd
OUT=/scratch/mbe326/MKD/GL_angsd
REF=/scratch/mbe326/genome_ref/astipes_masked_ref.fasta

# load env
module load anaconda3/biohpc

cd $BAMS_bwa_dir
$ANGSD -GL 1 -doGlf 2 -doMajorMinor 1 -doMaf 1 -doPost 1 -doCounts 1 -doGeno 2 -doDepth 1 -dumpCounts 1 -out $OUT/genolike_bwa -minInd 32 -minQ 20 -minMaf 0.2 -baq 1 -SNP_pval 1e-6 -nThreads 15 -ref $REF -bam $BAMS_bwa
