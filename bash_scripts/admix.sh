#!/bin/bash
#BSUB -J admix
#BSUB -q normal
#BSUB -W 10:00
#BSUB -n 15
#BSUB -e /scratch/mbe326/MKD/err_and_out/admix_gl3.err 
#BSUB -o /scratch/mbe326/MKD/err_and_out/admix_gl3.out

# load env
module load anaconda3/biohpc

# define variables
K=6
BGL=/scratch/mbe326/GL_angsd/genolike_bwa.beagle.gz
OUT=/scratch/mbe326/admix2
NGSAD=~/software/angsd/misc/NGSadmix

# run admixture
$NGSAD -likes $BGL -K 1 -outfiles $OUT/admix_k1.1 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 1 -outfiles $OUT/admix_k1.2 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 1 -outfiles $OUT/admix_k1.3 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 2 -outfiles $OUT/admix_k2.1 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 2 -outfiles $OUT/admix_k2.2 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 2 -outfiles $OUT/admix_k2.3 -P 15 -minMaf 0

$NGSAD -likes $BGL -K 3 -outfiles $OUT/admix_k3.1 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 3 -outfiles $OUT/admix_k3.2 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 3 -outfiles $OUT/admix_k3.3 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 4 -outfiles $OUT/admix_k4.1 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 4 -outfiles $OUT/admix_k4.2 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 4 -outfiles $OUT/admix_k4.3 -P 15 -minMaf 0

$NGSAD -likes $BGL -K 5 -outfiles $OUT/admix_k5.1 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 5 -outfiles $OUT/admix_k5.2 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 5 -outfiles $OUT/admix_k5.3 -P 15 -minMaf 0        

$NGSAD -likes $BGL -K 6 -outfiles $OUT/admix_k6.1 -P 15 -minMaf 0

$NGSAD -likes $BGL -K 6 -outfiles $OUT/admix_k6.2 -P 15 -minMaf 0

$NGSAD -likes $BGL -K 6 -outfiles $OUT/admix_k6.3 -P 15 -minMaf 0

$NGSAD -likes $BGL -K 7 -outfiles $OUT/admix_k7.1 -P 15 -minMaf 0

$NGSAD -likes $BGL -K 7 -outfiles $OUT/admix_k7.2 -P 15 -minMaf 0

$NGSAD -likes $BGL -K 7 -outfiles $OUT/admix_k7.3 -P 15 -minMaf 0

