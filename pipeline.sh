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

#Didn't run fully
-resume "reverent_feynman"

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"
nextflow run nf-core/rnaseq --input sample_sheet.csv -profile uppmax --project snic2022-5-34 -resume "reverent_feynman" --fasta $fasta --gtf $gtf --outdir ./results


modest_gates

#StringTie keeps failing, skipping?

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/test"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"

#Running script
nextflow run nf-core/rnaseq --input sample_sheet_test_1sam.csv -profile uppmax --project snic2022-5-34 -resume "modest_gates" --fasta $fasta --gtf $gtf --outdir . --skip_stringtie


### Design smaller experiment
Group	Stage	Head	M/F	Abdomen	M/F	Tot
AL	A	4	-	5	-	9
LI	A	5	-	5	-	10

HD=High density
LD=Low density
AL=Ad libitum
LI=Limited food

mkdir lack_resource
bash create_samplesheetLR.sh > sample_sheetLR.csv

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/lack_resource"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"

#Running script
nextflow run nf-core/rnaseq --input sample_sheetLR.csv -profile uppmax --project snic2022-5-34 --fasta $fasta --gtf $gtf --outdir ./results --skip_stringtie

nano run_rnaseq_LR.sh

#Make slurm script

#!/bin/bash -l
#SBATCH -A snic2022-5-34
#SBATCH --job-name=nextflow_rnaseq
#SBATCH -p node -n 4
#SBATCH --time=5-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=daria.shipilina@gmail.com

cd /crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/lack_resource
bash run_rnaseq_LR.sh


#############################################################################################################
###Run big experiment
mkdir HD_LD_stages

#Make new sample list
cp *sheet* HD_LD_stages/
cp run_rnaseq_LR* ../HD_LD_stages/
nano create_samplesheetHDLD.sh #see folder
bash create_samplesheetHDLD.sh > sample_sheetHDLD.csv


##Run script

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/HD_LD_stages"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"

#Running script
nextflow run nf-core/rnaseq --input sample_sheetHDLD.csv -profile uppmax --project snic2022-5-34 --fasta $fasta --gtf $gtf --outdir ./results --skip_stringtie


##SLURM script

#!/bin/bash -l
#SBATCH -A snic2022-5-34
#SBATCH --job-name=nextflow_rnaseq
#SBATCH -p node -n 4
#SBATCH --time=7-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=daria.shipilina@gmail.com

cd /crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/HD_LD_stages
bash run_rnaseq_HDLD.sh

#Running
Slurm Job_id=29831635 Name=nextflow_rnaseq Began, Queued time 00:02:33

#Analysis moves to R
#Loading data from the cluster
cd /crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/lack_resource/results/star_salmon

#HDLD set failed, getting summary
#star is timing out and uppmax killing the pipeline. I only found one option to control it: --max_time
#However, it says  default: '240.h' , so should have been ok w/o this flag
#This run was:
[sharp_meitner]

#Writing resume Scripts

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/HD_LD_stages"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"

#Running script
nextflow run nf-core/rnaseq --input sample_sheetHDLD.csv -profile uppmax --project snic2022-5-34 -resume "sharp_meitner" --max_time '100.h' --fasta $fasta --gtf $gtf --outdir ./results --skip_stringtie

##Preparing slurm jobs
nano run_rnaseq_HDLD_resume1.sh
cp run_rnaseq_HDLD.slurm  run_rnaseq_HDLD_resume1.slurm

###Crushed again

cd /crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/HD_LD_stages/assets/nf-core/rnaseq/conf
nano customVanessa.config

#Custom config file
process {
    withName: 'NFCORE_RNASEQ:RNASEQ:ALIGN_STAR:STAR_ALIGN' {
        time = 100.h
    }
}

#Writing resume-2 Scripts

#!/bin/bash -l
module load bioinfo-tools Nextflow/21.10.6

#Confiruging Nextflow in the working directory
export NXF_HOME="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/HD_LD_stages"
NXF_OPTS='-Xms1g -Xmx4g'

#Providing full path to new data
gtf="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/vcard.gtf"
fasta="/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/genome_data/GCA_905220365.1_ilVanCard2.1_genomic_chroms_masked.fna"
config="/crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/HD_LD_stages/assets/nf-core/rnaseq/conf/customVanessa.config"

#Running script
nextflow run nf-core/rnaseq --input sample_sheetHDLD.csv -profile uppmax -c $config --project snic2022-5-34 -resume "sad_murdock" --fasta $fasta --gtf $gtf --outdir ./results --skip_stringtie


nano nano  run_rnaseq_HDLD_resume2.sh
cp run_rnaseq_HDLD_resume1.slurm run_rnaseq_HDLD_resume2.slurm

#all finished
#uploading th second set

#Designing new experiment
Group	Stage	Head	M/F	Abdomen	M/F	Tot
HDAL	III	4	-/-	3	-/-	7
HDAL	V	4	-/-	4	-/-	8
HDAL	P	8	4/4	8	4/4	16
HDAL	A	5	2/3	5	2/3	10
#
HDLI	III	4(3)-/-	4(3) -/- 8(6)
HDLI	V	4	-/-	4	-/-	8
HDLI	P	7	4/3	8	4/4	15
HDLI	A	4	2/2	3	2/1	7
#
LDAL	III	4(3)	-/-	4	-/-	8(7)
LDAL	V	4	-/-	4	-/-	8
LDAL	P	8	4/4	7	3/4	15
LDAL	A	8	4/4	6	3/3	14
#
AL	A	4	-	5	-	9
LI	A	5	-	5	-	10

HD=High density
LD=Low density
AL=Ad libitum
LI=Limited food

##################################################
#FURTHR ANALYSIS AVAILABLE IN R

####################################################
#Candidate gene ANALYSIS
cd /crex/proj/uppstore2017185/b2014034/nobackup/Dasha/VanessaRNAseq/
mkdir BLASTingToDToL_FunctionalAnnotation
cd BLASTingToDToL_FunctionalAnnotation/

#Realized thr is no functional annotation AVAILABLE
#change direction
cd /Users/dshipilina/GitHub/VanessaExpression

less cand_genes_adult_ab_topUp2.tsv

#installing seqtk locally

brew install seqtk
#seqtk subseq makerrun3.all.maker.rename.proteins.AED50.fasta makerrun3.all.maker.rename.proteins.genenames.AED50.out > makerrun3.all.maker.rename.proteins.AED50.eAED50.fasta

seqtk subseq ../../GenomicData/eggNOG_run1/queries.fasta makerrun3.all.maker.rename.proteins.genenames.AED50.out > makerrun3.all.maker.rename.proteins.AED50.eAED50.fasta

../../GenomicData/eggNOG_run1/queries.fasta

tail -n +2 res05hef2topDowngenenames.tsv | sed 's/\"//' | sed 's/\"//' | awk '{print $1"-RA"}' > res05hef2topDowngenenamesBLAST.tsv

seqtk subseq ../../GenomicData/eggNOG_run1/queries.fasta res05hef2topDowngenenamesBLAST.tsv > res05hef2topDowngenenamesBLAST.fasta

#Trying wb browser - works

tail -n +2 res05hef2topUpgenenames.tsv | sed 's/\"//' | sed 's/\"//' | awk '{print $1"-RA"}' > res05hef2topUpgenenamesBLAST.tsv

seqtk subseq ../../GenomicData/eggNOG_run1/queries.fasta res05hef2topUpgenenamesBLAST.tsv > res05hef2topUpgenenamesBLAST.fasta

#Parsing BLAST results
 grep -f template_grep.out RYG4Z357013-Alignment.txt
 #checking

 #xtracting names of gene
grep -f template_grep.out res05hef2topDowngenenamesBLAST.results | grep -v ">" > res05hef2topDowngenenamesBLASTtmp.hits

#Preparing the table further
cd BLAST/res05hef2topDown/
sed -n 'p;n'  res05hef2topDowngenenamesBLASTtmp.hits | awk -F " " '{print $3}' > res05hef2topDowngenenamesBLAST.genes
sed -n 'n;p'  res05hef2topDowngenenamesBLASTtmp.hits | awk -F " V" '{print $1}' > res05hef2topDowngenenamesBLAST.proteins
paste res05hef2topDowngenenamesBLAST.genes res05hef2topDowngenenamesBLAST.proteins | sort > res05hef2topDowngenenamesBLAST.results

#Now up genes
mv RYJKT98A013-Alignment-2.txt res05hef2topUpgenenamesBLASTtmp.hits
cd BLAST/res05hef2topUp/
grep -f ../template_grep.out res05hef2topDowngenenamesBLAST.results | grep -v ">" > res05hef2topDowngenenamesBLASTtmp.hits
## Manual Check
sed -n 'p;n'  res05hef2topUpgenenamesBLASTtmp.hit | awk -F " " '{print $3}' > res05hef2topUpgenenamesBLAST.genes
sed -n 'n;p'  res05hef2topUpgenenamesBLASTtmp.hit | awk -F " V" '{print $1}' > res05hef2topUpgenenamesBLAST.proteins
paste res05hef2topUpgenenamesBLAST.genes res05hef2topUpgenenamesBLAST.proteins | sort > res05hef2topUpgenenamesBLAST.results

#Polishing tables for publication
mkdir Tables_CandGenes
cd Tables_CandGenes/
tail -n +2 cand_genes_adult_he_topDown2.tsv | sed 's/\"//g' | sed 's/,/  /g' | cut -f2- | sort > cand_genes_adult_he_topDown2_OurFA.tsv

#manual check
#Some genes are missing in our annotation
awk '{print $1"-RA"}' cand_genes_adult_he_topDown2_OurFA.tsv > tmp.compour
awk '{print $1}' res05hef2topDowngenenamesBLAST.results > tmp.compDTol
diff tmp.compDTol tmp.compour

#Results:
16d15
< Vcard_DToL05212-RA
20d18
< Vcard_DToL07573-RA
29d26
< Vcard_DToL10820-RA

#Adding manually

#Adding gene expression Results
sed 's/-RA//g' tmp.compDTol > tmp.compDTol2
#grep -f tmp.compDTol2 res05hef2.csv

grep -f tmp.compDTol2 res05hef2.csv > res05hef2DEresults.csv
sed 's/\"//g' res05hef2DEresults.csv | sed 's/,/  /g' > res05hef2DEresult.csv
paste res05hef2topDowngenenamesBLAST.results cand_genes_adult_he_topDown2_OurFA.tsv res05hef2DEresult.csv > res05hef2full_cand_genes_raw.csv

#Moving to UP regulated
mkdir Tables_CandGenes
cd Tables_CandGenes/
tail -n +2 cand_genes_adult_he_topUp2.tsv | sed 's/\"//g' | sed 's/,/  /g' | cut -f2- | sort > cand_genes_adult_he_topUp2_OurFA.tsv

#manual check
#Some genes are missing in our annotation
awk '{print $1"-RA"}' cand_genes_adult_he_topUp2_OurFA.tsv > tmp.compour
awk '{print $1}' res05hef2topUpgenenamesBLAST.results > tmp.compDTol
diff tmp.compDTol tmp.compour

4d3
< Vcard_DToL03441-RA
15d13
< Vcard_DToL08807-RA

tail -n +2 cand_genes_adult_he_topUp2.tsv | sort > cand_genes_adult_he_topUp2_OurFA.tsv
