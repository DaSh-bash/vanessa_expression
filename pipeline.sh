# Analysis pipiline

## Project taken over from Venkat
#Continue working from his folder:
cd /proj/uppstore2017185/b2014034/nobackup/Venkat/vanessa_cardui_project/RNA_seq

#Checking pipeline documentation
# https://github.com/nf-core/rnaseq
# https://nf-co.re/rnaseq/usage

#Checking folder
#       (base) [daria@rackham3 RNA_seq]$ ls
#       genome_data  RNA_Seq  Scripts  tophat2

#Recovering steps done by Venkat


module load bioinfo-tools Nextflow/21.10.6

#Note that NXF_HOME is set to $HOME/.nextflow
#Please change NXF_HOME to a place in your project directory (export #NXF_HOME=yourprojectfolder)

NXF_HOME=/proj/uppstore2017185/b2014034/nobackup/Venkat/vanessa_cardui_project/RNA_seq

#You will need to create a samplesheet with information about the samples you would like to analyse before running the pipeline. Use this parameter to specify its location. It has to be a comma-separated file with 4 columns, and a header row as shown in the examples below.

#Venkat's samplesheet
bash Create_samplesheet.sh
less sample_sheet.csv

#Planning to run pipeline with -resume function
#Execution
#Launch directory
# /crex/proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/Scripts
#Work directory
# /crex/proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/Scripts/work

cd /crex/proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/Scripts
nextflow run nf-core/rnaseq -profile uppmax --project snic2022-5-34 --fasta /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna --gff /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/genes.gff --outdir /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/RNA_Seq/ --input sample_sheet.csv -resume

#7ad7f994-a6a9-4534-90f8-a992279b046c
