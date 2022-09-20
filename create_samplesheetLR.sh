declare -A groups=(["AL_ADF_H_3"]="P20253_149" ["AL_ADF_A_3"]="P20253_150" ["AL_ADF_H_7"]="P20253_151" ["AL_ADF_A_7"]="P20253_152" ["AL_ADF_H_9"]="P20253_153" ["AL_ADF_A_9"]="P20253_154" ["AL_ADF_H_11"]="P20253_155" ["AL_ADF_A_11"]="P20253_156" ["AL_ADF_A_19"]="P20253_158" ["LI_ADF_H_8"]="P20253_159" ["LI_ADF_A_8"]="P20253_160" ["LI_ADF_H_10"]="P20253_161" ["LI_ADF_A_10"]="P20253_162" ["LI_ADF_H_12"]="P20253_163" ["LI_ADF_A_12"]="P20253_164" ["LI_ADF_H_14"]="P20253_165" ["LI_ADF_A_14"]="P20253_166" ["LI_ADF_H_16"]="P20253_167" ["LI_ADF_A_16"]="P20253_168")


echo 'sample,fastq_1,fastq_2,strandedness'
for files in "${!groups[@]}"; do
        #echo "$files - ${groups[$files]}";
        read1=$(cat /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/sample_info.txt | grep ${groups[$files]} | grep 'R1')
        read2=$(cat /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/sample_info.txt | grep ${groups[$files]} | grep 'R2')
        echo "$files,$read1,$read2,forward"
done
