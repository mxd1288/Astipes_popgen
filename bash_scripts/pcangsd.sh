#!/bin/bash
#BSUB -J admix
#BSUB -q normal
#BSUB -W 10:00
#BSUB -n 15
#BSUB -e /scratch/mbe326/MKD/err_and_out/pca_gl.err 
#BSUB -o /scratch/mbe326/MKD/err_and_out/pca_gl.out

# load env
module load anaconda3
conda activate pcangsd

# define variables
BGL=/scratch/mbe326/GL_angsd/genolike_bwa.beagle.gz
OUT=/scratch/mbe326/MKD/pcangsd/pca2mil
PCA=~/software/pcangsd/pcangsd.py

# run PCA
python $PCA -beagle $BGL -out $OUT -threads 15
