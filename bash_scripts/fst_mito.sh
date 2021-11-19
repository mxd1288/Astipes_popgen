#!/bin/bash
#BSUB -P mbe326
#BSUB -J fst_mito
#BSUB -q normal
#BSUB -W 2:00
#BSUB -n 10
#BSUB -e /scratch/mbe326/MKD/err_and_out/fst_mito%J.err
#BSUB -o /scratch/mbe326/MKD/err_and_out/fst_mito%J.out

# load env
module load anaconda3/biohpc

# set variables
VCF=/scratch/mbe326/mito_snps/ALL_astipes_mito_SNPs.vcf
OUTDIR=/scratch/mbe326/MKD/mitogenome_scan

# command to list sample names
#bcftools query -l $VCF | grep "BK" > $OUTDIR/broadkey
#bcftools query -l $VCF | grep "CP" > $OUTDIR/crandon
#bcftools query -l $VCF | grep "M-2\|M-3" > $OUTDIR/M87_pop  
#bcftools query -l $VCF | grep "M-6\|M-7" > $OUTDIR/M26_pop  
#bcftools query -l $VCF | grep "M-0\|M-1" > $OUTDIR/M61_pop 
#bcftools query -l $VCF | grep "R" > $OUTDIR/reef

# MUST BE PAIRWISE
# all output will have .weir.fst

cd $OUTDIR
parallel vcftools --vcf $VCF --weir-fst-pop {1} --weir-fst-pop {2} --out {1}_{2} ::: broadkey crandon M87_pop M26_pop M61_pop reef ::: broadkey crandon M87_pop M26_pop M61_pop reef
