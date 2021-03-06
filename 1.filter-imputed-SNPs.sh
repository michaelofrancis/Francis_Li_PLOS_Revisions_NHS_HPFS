#This script has two parts. First it generates a list of SNPs with quality score >=0.5 from the imputation .mfi file. 
#Then it runs in PLINK to filter out these SNPs.


module load PLINK/2.00-alpha2-x86_64-20191128
cd #add directory here

chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

#A list of SNPs for each chromosome which have quality score >= 0.5 can be generated using this script:

chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)

for i in ${chr[*]}
do
  awk '{if ($8 >=0.5) print $2}' mfi_chr"$i".txt > mfi_keepsnps_chr"$i".txt
done

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#PLINK2 can be used to generate pgen files that have only the SNPs that were found to have score >=0.5 with this script:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


for i in ${chr[*]}
	do

plink2 \
--pfile #imputedchr"$i" \
--make-pgen \
--extract mfi_keepsnps_chr"$i".txt \
--out filtered_plink2_pfile_imputation/plink-filtered-chr"$i"

done
