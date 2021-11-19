#!/bin/bash
#BSUB -J plink_pca
#BSUB -q normal
#BSUB -W 1:00
#BSUB -n 15
#BSUB -e /scratch/mbe326/MKD/err_and_out/plink_noR.err 
#BSUB -o /scratch/mbe326/MKD/err_and_out/plink_noR.out

# load env
module load anaconda3
conda activate plink

# define variables
BCF=/scratch/mbe326/angsd_vcf/genolike_bwa_noReef.bcf
OUT=/scratch/mbe326/MKD/plink
PRUNE=/scratch/mbe326/MKD/plink/hardhead_noR_ld.prune.in

# prune for LD
plink-ng --bcf $BCF --double-id --allow-extra-chr --set-missing-var-ids @:# --indep-pairwise 50 10 0.1 --out $OUT/hardhead_noR_ld

# calculate PCA
plink-ng --bcf $BCF --double-id --allow-extra-chr --set-missing-var-ids @:# --make-bed --pca --out $OUT/HH_noR_pca

# calculate PCA for pruned
plink-ng --bcf $BCF --double-id --allow-extra-chr --set-missing-var-ids @:# --extract $PRUNE --make-bed --pca --out $OUT/HH_noR_pruned_pca

