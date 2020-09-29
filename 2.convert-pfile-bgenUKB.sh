
#This script requires high amounts of memory. Always check output logs and make sure the job ran to completion!


#module load PLINK2
cd # your directory


chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21)


for i in ${chr[*]}
	do

#maj-ref to fix A1/A2 problem..

for i in ${chr[@]}
        do

plink2 \
--pfile filtered_plink2_pfile_imputation/plink-filtered-chr"$i" \
--maf 0.01 \
--mind 0.05 \
--geno 0.02 \
--hwe 1e-06 \
--maj-ref \
--export bgen-1.2 \
--out filtered-QC-maj-ref-bgen/chr"$i"

done
