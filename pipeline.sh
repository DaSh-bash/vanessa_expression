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
#Venkat's running
#nextflow run nf-core/rnaseq -profile uppmax --project snic2022-5-34 --fasta /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna --gff /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/genes.gff --outdir /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/RNA_Seq/ --input sample_sheet.csv

#Updated run with better annotation file

#Copying new file
cp /crex/proj/uppstore2017185/b2014034_nobackup/Jesper/VanessaDNAm/annotation/vcard.gtf /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/vcard.gtf

nextflow run nf-core/rnaseq -profile uppmax --project snic2022-5-34 --fasta /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna --gff /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/vcard.gtf --outdir /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/RNA_Seq/ --input sample_sheet.csv -resume 7ad7f994-a6a9-4534-90f8-a992279b046c

#Nextflow runs
#ERROR: Validation of pipeline parameters failed!


#* --gff: string [/proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/vcard.gtf] does not match pattern ^\S+\.gff(\.gz)?$ (/proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/vcard.gtf)

#Trying to trick the Nextflow
cp genes.gff vcard.gff
nextflow run nf-core/rnaseq -profile uppmax --project snic2022-5-34 --fasta /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna --gff /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/genes.gff --outdir /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/RNA_Seq/ --input sample_sheet.csv -resume 7ad7f994-a6a9-4534-90f8-a992279b046c

#N E X T F L O W  ~  version 21.10.6
#Launching `nf-core/rnaseq` [drunk_venter] - revision: 89bf536ce4 [master]
#Can't find a run with the specified id: 7ad7f994-a6a9-4534-90f8-a992279b046c -- Execution can't be resumed

nextflow run nf-core/rnaseq -profile uppmax --project snic2022-5-34 --fasta /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna --gff /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/genes.gff --outdir /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/RNA_Seq/ --input sample_sheet.csv -resume

#Quick run, checking results

#Running from the screen
#https://linuxize.com/post/how-to-use-linux-screen/
screen -S nextflow_rnaseq

#Reading about the next steps
#https://hbctraining.github.io/DGE_workshop_salmon/lessons/02_DGE_count_normalization.html
#http://bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html

#Run failed
#Checking temporary files
tree /crex/proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/Scripts/work > folder.structure

#Checking failed report
sftp sftp daria@rackham.uppmax.uu.se
get *09-12*

#Making new output folder
cd /crex/proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq
mkdir RNA_Seq_DSh_Mock

#Specifying new output dir

nextflow run nf-core/rnaseq -profile uppmax --project snic2022-5-34 --fasta /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna --gff /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/genome_data/genes.gff --outdir /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/RNA_Seq_DSh_Mock/ --input sample_sheet_mock.csv -resume

#Benchmarking Nextflow using mock dataset
#need new sample_sheet
head -n 2 sample_sheet.csv > sample_sheet_mock.csv

#Reducing size of previous outputs
nohup tar -cvf work.tar work/* &

#Checking gff
cd /proj/uppstore2017185/b2014034_nobackup/Venkat/vanessa_cardui_project/RNA_seq/
cp genes.gtf Vanessa_artif.gff

#fixing header
#Adding

#Checking Jesper's Scripts

#!/bin/bash -l
ml bioinfo-tools Nextflow/21.10.6
export NXF_HOME="/crex/proj/uppstore2017185/b2014034_nobackup/Jesper/VanessaDNAm/rnaseq_pipe"
NXF_OPTS='-Xms1g -Xmx4g'
#Do I need a transcriptome file?
gtf="../annotation/vcard.gtf"
fasta="../reference/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fasta"
nextflow run nf-core/rnaseq -resume "First_try" --input sample_sheet.csv -profile uppmax --project snic2022-5-34 --max_cpus 20 --max_memory 128GB --fasta $fasta --gtf $gtf --outdir ./results --skip_preseq

#Solving strandedness, downloading reports
cd /proj/uppstore2017185/b2014034/private/raw_data/Vanessa/Vcardui_RNA_migration/P20253/00-Reports

#### Make small test
cd /proj/uppstore2017185/b2014034/nobackup/Dasha
mkdir VanessaRNAseq
cp /crex/proj/uppstore2017185/b2014034_nobackup/Jesper/VanessaDNAm/rnaseq_pipe/run_pipe.sh .
cp /proj/uppstore2017185/b2014034/nobackup/Venkat/vanessa_cardui_project/RNA_seq/Scripts/sample_sheet_mock.csv

#Folder organized
#Sample sheet updated manually
#Selected two individuals, passed manual contamination check from NGI reports
head -n 3 sample_sheet.csv > sample_sheet_test.csv
#Manual fix of strandedness
#Creating run pipeline

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/test"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"
nextflow run nf-core/rnaseq --input sample_sheet_test.csv -profile uppmax --project snic2022-5-34 --max_cpus 20 --max_memory 128GB --fasta $fasta --gtf $gtf --outdir .

#Running in the attached screen
screen -r 12709
cd /crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/test
bash run_rnaseq_test.sh
#Running, detach

###Check failed samples
#HDAL_ADM_A_18
#HDLI_III_H_18
#Decided to keep all the samples

###Make new sample_sheet
nano create_samplesheet.sh
bash create_samplesheet.sh > sample_sheet.csv

###Make new scripts

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"
nextflow run nf-core/rnaseq --input sample_sheet.csv -profile uppmax --project snic2022-5-34 --max_cpus 20 --max_memory 128GB --fasta $fasta --gtf $gtf --outdir ./results


###Check small test results
screen -r 12709

###Run big experiment
