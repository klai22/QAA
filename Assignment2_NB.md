Kenny's Notebook for ICA2 (BI623) [on talapas...]

Assignment: https://github.com/Leslie-C/QAA

Library Assignments: 'Kenneth 6_2D_mbnl_S5_L008       1_2A_control_S1_L008'
    Files: /projects/bgmp/shared/2017_sequencing/demultiplexed/______
    * 6_2D_mbnl_S5_L008_R1_001.fastq.gz
    * 6_2D_mbnl_S5_L008_R2_001.fastq.gz
    * 1_2A_control_S1_L008_R1_001.fastq.gz
    * 1_2A_control_S1_L008_R2_001.fastq.gz

Data Location: /projects/bgmp/shared/2017_sequencing/demultiplexed/

Notebook/WD Location: /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2

Creating interactive sessions: srun --account=bgmp -p bgmp -N 1 -c 4 --mem=100G -t 6:00:00 --pty bash

SLURM TRACKER Template: 
| Sample | JobID | Run Time(mm:ss) | CPU Usage (%)| Exit Status |
|---|---|---|---|---|
|6_2D|15903418|1:13.24|671|0|
____________________________________
08/22/24
____________________________________
# Part 1 – Read quality score distributions
# Q1 
*  Createded a conda env called QAA  & installed FASTQC 
```
$ conda create --name QAA
$ conda activate QAA
$ conda install bioconda::fastqc
```

# Q2 
* manual for FASTQC: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/
    * "FASTQC supports the following formats......GZip compressed FastQ"

* Running FASTQC (https://gist.github.com/Astahlke/d47794f50528f5e1b2fffe4cf21e43aa) on all 4 files 
#### 6_2D_mbnl_S5_L008_R1_001.fastq.gz
```
#mkdir to store fastqc result 
$ mkdir 6_2D_R1fastqc
#Runnning FASTQC on zipped FASTQ file 
$ fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R1_001.fastq.gz -o 6_2D_R1fastqc/
#Downloading the fastqc html to my local computer to view [run this from local command line, not on talapas]
$ scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/6_2D_R1fastqc/6_2D_mbnl_S5_L008_R1_001_fastqc.html /Users/kennethlai/Desktop/BI623/Assignments/Assignment2
```
#### 6_2D_mbnl_S5_L008_R2_001.fastq.gz 
```
#mkdir to store fastqc result 
$ mkdir 6_2D_R2fastqc
#Runnning FASTQC on zipped FASTQ file 
$ fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R2_001.fastq.gz -o 6_2D_R2fastqc/
#Downloading the fastqc html to my local computer to view [run this from local command line, not on talapas]
$ scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/6_2D_R2fastqc/6_2D_mbnl_S5_L008_R2_001_fastqc.html /Users/kennethlai/Desktop/BI623/Assignments/Assignment2
```
#### 1_2A_control_S1_L008_R1_001.fastq.gz
```
#mkdir to store fastqc result 
$ mkdir 1_2A_R1fastqc
#Runnning FASTQC on zipped FASTQ file 
$ fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R1_001.fastq.gz -o 1_2A_R1fastqc
#Downloading the fastqc html to my local computer to view [run this from local command line, not on talapas]
$ scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/1_2A_R1fastqc/1_2A_control_S1_L008_R1_001_fastqc.html /Users/kennethlai/Desktop/BI623/Assignments/Assignment2
```
#### 1_2A_control_S1_L008_R2_001.fastq.gz
```
#mkdir to store fastqc result 
$ mkdir 1_2A_R2fastqc
#Runnning FASTQC on zipped FASTQ file 
$ fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R2_001.fastq.gz -o 1_2A_R2fastqc
#Downloading the fastqc html to my local computer to view [run this from local command line, not on talapas]
$ scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/1_2A_R2fastqc/1_2A_control_S1_L008_R2_001_fastqc.html /Users/kennethlai/Desktop/BI623/Assignments/Assignment2
```

* Writing temp answer for Qs (will include all stuff that I'll need to include in the Rmark down report later into here) into Report_Notes.md


____________________________________
08/23/24
____________________________________

* The Assignment 2 information is now accesible on canvas and I am going to move all of my files to a new directory that is the git clone of the rep that I am going to make to match Leslie's template
```
$ git clone https://github.com/klai22/QAA
```

* OLD WORKING DIRECTORY: /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2
* UPDATED WORKING DIRECTORY: /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/

* testing fastqc version: (correct!)
```
$ fastqc --version
FASTQC v0.12.1
```

* Creating a file that will describe all scripts in my directory, but can't name it readme.md because that already exists 
```
$ nano Table_of_Contents.md
```

# Part 1 – Read quality score distributions
### Q3. Run your quality score plotting script from your Demultiplexing assignment in Bi622. (Make sure you're using the "running sum" strategy!!) Describe how the FastQC quality score distribution plots compare to your own. If different, propose an explanation. Also, does the runtime differ? Mem/CPU usage? If so, why?

PLAN: 
* 1. Create an sbatch script that runs qs-plotting script (part1.py) on input fastq.gz files & recrods runtime & Mem/GPU usage per run. Run the script multiple times (each time commenting only the command for the file we want) for each of the 4 files. Note which o/e files correlate to which input files' run. 

* 2. Create an sbatch [that records runtime & Mem/GPU usage per run] that will re-run fastqc for one of the input files, then compare the o/e results to the correlating version generated from my own script. 

* MY DEMULTIPLEXING SCRIPT: 
* From Demultiplexing Github NB: https://github.com/klai22/Demultiplex/blob/master/Assignment-the-first/part1.py
"    * part1.py --> code to take fq files --> histograms of avg qs PER POSITION 
    * Created sbatch scripts to run this .py script on all 4 sequence fqs (R1-R4) "

EXECUTION: 
For PLAN.1: 
* creating & prepping sbatch qs-plotting script (my own steps, not FASTQC)
```
#creating sbatch script to run qs-plotting script from demultiplex assignment (/home/kenlai/bgmp/bioinfo/Bi622/Assignments/Demultiplex/Assignment-the-first/part1.py)
$ nano plotqs.sh
#Customizing sbatch script 
#making a directory to hold o/e files of sbatch 
$ mkdir o_e_files
#checking the lengths of each file bc I will need the read lengths for the qs-plotting script --> CONCLUSION: all read_lens were 101 
$ cd /projects/bgmp/shared/2017_sequencing/demultiplexed
    #6_2D_mbnl_S5_L008_R1_001.fastq.gz
        #NR%4==2 (similar to awk '2~4...') grawbs every 4th line starting from line , length($0) refers to the current line that matched pattern (seq. line)
$ zcat 6_2D_mbnl_S5_L008_R1_001.fastq.gz | awk 'NR%4==2 {print length($0)}' 
101
    #6_2D_mbnl_S5_L008_R2_001.fastq.gz
$ zcat 6_2D_mbnl_S5_L008_R2_001.fastq.gz | awk 'NR%4==2 {print length($0)}' 
101
    #1_2A_control_S1_L008_R1_001.fastq.gz
$ zcat 1_2A_control_S1_L008_R1_001.fastq.gz | awk 'NR%4==2 {print length($0)}' 
101
    #1_2A_control_S1_L008_R2_001.fastq.gz
$ zcat 1_2A_control_S1_L008_R2_001.fastq.gz | awk 'NR%4==2 {print length($0)}' 
101
```
* Running plotqs.sh on all 4 files & recording runtime, mem usage and cpu usage & recording times in Table 1.3: 
```
#edited script to only include the command tailored to given input file each run. (job IDs vs. file are in Table 1.3)
$ sbatch plotqs.sh
```
* all 4 graphs seemed to be made succesfully: 
```1_2A_R1_qs_dist.png  1_2A_R2_qs_dist.png  6_2D_R1_qs_dist.png  6_2D_R2_qs_dist.png```


RESULTS: 
## Table 1.3 
| File name | label | Read length | JobID | Run Time(h:mm:ss) | CPU Usage (%)| Exit Status | Method Used | 
|---|---|---|---|---|---|---|---|
| 6_2D_mbnl_S5_L008_R1_001.fastq.gz | 6_2D_R1 | 101 | 15853756 | 2:35.65 | 95 | 0 |my own script|
| 6_2D_mbnl_S5_L008_R2_001.fastq.gz | 6_2D_R2 | 101 | 15853762 | 2:31.28 | 100 | 0 |my own script|
| 1_2A_control_S1_L008_R1_001.fastq.gz | 1_2A_R1 | 101 | 15853763 | 1:58.37 | 96 | 0 |my own script|
| 1_2A_control_S1_L008_R1_002.fastq.gz | 1_2A_R2 | 101 | 15853765 | 1:56.37| 99 | 0 |my own script|
| 1_2A_control_S1_L008_R1_002.fastq.gz | NA | 101 |---|---|---|---|FASTQC|


TO DO: 
* Just finished generating qs-dist plots per assigned file. Including o/e information. 
* Certain e file (1_2_R1)'s stats will be used to compared its mirror version (my own script from demultiplex-the-first)
* Create an sbatch that will TIME (& gaive out other o/e stats) run which produced a qs-dist. graph as before, but via FASTQC [lines 47 & 56 for command on how to run FASTQC]
    * Rmrbr to include a description for your new sabtch / .sh script in Table_of_Contents.md
* Finish filling out Table 1.3 and answer part 1 question 3 (from readme.md) in report Report_Notes.md 


____________________________________
08/26/24
____________________________________
# Part 1 – Read quality score distributions
### Q3

PLAN: 
* 1. Create an sbatch script that runs qs-plotting script (part1.py) on input fastq.gz files & recrods runtime & Mem/GPU usage per run. Run the script multiple times (each time commenting only the command for the file we want) for each of the 4 files. Note which o/e files correlate to which input files' run. 

* 2. Create an sbatch [that records runtime & Mem/GPU usage per run] that will re-run fastqc for one of the input files, then compare the o/e results to the correlating version generated from my own script. 

* MY DEMULTIPLEXING SCRIPT: 
* From Demultiplexing Github NB: https://github.com/klai22/Demultiplex/blob/master/Assignment-the-first/part1.py
"    * part1.py --> code to take fq files --> histograms of avg qs PER POSITION 
    * Created sbatch scripts to run this .py script on all 4 sequence fqs (R1-R4) "

EXECUTION: 
For PLAN.2: 
#rerunning FASTQC on one of the files (1_2A_control_S1_L008_R1_002.fastq.gz) to compare plots & efficiency
#### 1_2A_control_S1_L008_R1_001.fastq.gz
```
#create sbatch to run FASTQC on 1_2A_control_S1_L008_R1_001.fastq.gz
nano 1_2A_R1_FASTQC.sh
#edit & run the sbatch to perform & time FASTQC on this file 
```
* added results to Table 1.3 


RESULTS: 
## Table 1.3 
| File name | label | Read length | JobID | Run Time(h:mm:ss) | CPU Usage (%)| Exit Status | Method Used | 
|---|---|---|---|---|---|---|---|
| 6_2D_mbnl_S5_L008_R1_001.fastq.gz | 6_2D_R1 | 101 | 15853756 | 2:35.65 | 95 | 0 |my own script|
| 6_2D_mbnl_S5_L008_R2_001.fastq.gz | 6_2D_R2 | 101 | 15853762 | 2:31.28 | 100 | 0 |my own script|
| 1_2A_control_S1_L008_R1_001.fastq.gz | 1_2A_R1 | 101 | 15853763 | 1:58.37 | 96 | 0 |my own script|
| 1_2A_control_S1_L008_R1_002.fastq.gz | 1_2A_R2 | 101 | 15853765 | 1:56.37| 99 | 0 |my own script|
| 1_2A_control_S1_L008_R1_002.fastq.gz | NA | 101 | 15883238 | 0:41.95 | 94 | 0 |FASTQC|




* Added the following ANSWER to Report.md (Part 1, Q3): 
```
* Compare Methods' Plots : 
    * The overall trend (numbers) of the QS plots were conserved / still captured between both plots 
    * However, FASTQC was better bc the formatting of their visualization enhances the features that we are concerned with when performing quality CTRL for per base quality 
        QUALITIES OF FASTQC THAT MAKE IT BETTER......
        * The bins / intervals of both x (position #) & y-axes (qs) had higher resolution / were smaller, allowing me to more easily pin point exact data point values 
        * Zones of suggested quality cutoffs / thresholds are color coded to help better identify sites of concerning quality (green, yellow, red)
        * whereas my plot was a bar chart, FASTQC provides a scatter plot w/ emphasis on error bars and trendlines. 
        * THUS...one could argue that I could add on more steps to my own script that tailor the graph to include details that match the high quality of FASTQC's. However, considering that FASTQC generates high quality plots while being FASTER (discussion below) & MORE EFFICIENT than my own scripts, I can see why people may want to use FASTQC instead of writing their own scripts, especially when time is of the essnece. 

* Comparing job stats: 
    * Table 1.3 
        * personal scripts (just to generate one of FASTQC's plots) took ~2-2.5 minutes depending on script. When timing FASTQC of the SAME INPUT file, runtime was ~74 seconds faster! 
        * FASTQC jobs used slightly less (%) of CPU. 

```

# Part 2 – Adaptor Trimming Comparison 
### Q5
* installing cutadapt & Trimmomatic into QAA 
```
#activate conda envs. 
$ conda activate QAA
#install cutadapt 
$ conda install bioconda::cutadapt
#install Trimmomatic 
$ conda install bioconda::trimmomatic
#check versions of both software 
$ cutadapt --version
4.9
$ trimmomatic -version
0.39
```
### Q6
PLAN: 
* Create a bash script that will...
    * A. check that adaptor(s) are in sequences (count appearences of adaptor seq. )
    * B. run cutadapt 
    * C. check that adaptor(s) are NOT in sequences anymore
* Correct Adaptor Seq.s: 
    R1: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA
    R2: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT

```
#Creating bash script 
nano cutadapt.sh
#edit the .sh script to do the above
```
### Sanity check: Use your Unix skills to search for the adapter sequences in your datasets and confirm the expected sequence orientations. Report the commands you used, the reasoning behind them, and how you confirmed the adapter sequences.
* I wrote cutadapt.sh so that it would output 4 lines from the following code: 
    * Confirming Orientation: We should expect 0 for the 1st line (undesired adaptor count) bc this is the adaptor of the other orientation. If it is 0, we can confirm that our library is the orientation that we expect it to be (R1 vs. R2)
    * Confirm Adaptor Sequences: to make sure that the adaptor seq. of the expected orientation was in the library's seq.s, I counted the occurance of said adaptor seq. in each seq. line of the file. This number should be higher than 0. 
    * Confirm that cutadapt worked: we should see that the last line should drop to 0, proving that the adapter sequences have been cutout of the fastq file. This code counts occurances of adaptor seq. in new file.  
* to count occurances of barcodes I used (in .sh script): ```zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R1_001.fastq.gz | awk 'NR%4==2' | grep -c 'AGATCGGAAGAGCACACGTCTGAACTCCAGTCA'```
```
echo "Undesired Adaptor count: $unwanted_count"
echo "Adaptor count BEFORE cutadapt: $pre_count"
echo "Adaptor count AFTER cutadapt: $post_count"
```

```
#Running cutadapt.sh / library 
# 6_2D_R1
sbatch cutadapt.sh "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" "/projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R1_001.fastq.gz" "/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/6_2D_R1_cut.fastq.gz" "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"

Submitted batch job 15884094

# 6_2D_R2
sbatch cutadapt.sh "GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" "/projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R2_001.fastq.gz" "/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/6_2D_R2_cut.fastq.gz" "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"

Submitted batch job 15884128

# 1_2A_R1
sbatch cutadapt.sh "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" "/projects/bgmp/shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R1_001.fastq.gz" "/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/1_2A_R1_cut.fastq.gz" "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"

Submitted batch job 15884130

# 1_2A_R2
sbatch cutadapt.sh "GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" "/projects/bgmp/shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R2_001.fastq.gz" "/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/1_2A_R2_cut.fastq.gz" "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"

Submitted batch job 15884131
```

JOB TRACKER / STATS/ SANITY CHECK DATA: 
| Sample | JobID | Run Time(mm:ss) | CPU Usage (%)| Exit Status | Undesired Adaptor count | Correct Orient. | Adaptor count BEFORE cutadapt | Adaptor count AFTER cutadapt | Adaptors Removed Succesfully | 
|---|---|---|---|---|---|---|---|---|---|
|6_2D_R1|15884094|1:18.50|98|0|0|T|12870|0|T| 
|6_2D_R2|15884128|1:22.11|99|0|0|T|15377|0|T|
|1_2A_R1|15884130|1:01.32|99|0|0|T|31837|0|T|
|1_2A_R2|15884131|1:06.32|97|0|0|T|32536|0|T|

* produced files: 
```
1_2A_R1_cut.fastq.gz  1_2A_R2_cut.fastq.gz  6_2D_R1_cut.fastq.gz  6_2D_R2_cut.fastq.gz
```

TO DO: 
* Part 2 Q7, use trimmomatic to quality trim reads of your libraries. Input for this already generated (trimmed adaptor sequences) in step 6, filenames above^^^

____________________________________
08/27/24
____________________________________
# Part 2 – Adaptor Trimming Comparison 
### Q7
* Using trimmomatic to quality trim reads of your libraries
    * Creating a script to automate this 
```
#create .sh script 
nano trimmomatic.sh 
#write script to run trimmomatic on all 4 post-cutadapt files 
```
* Running trimmomatic.sh 
```
#6_2D library 
sbatch trimmomatic.sh "6_2D_R1_cut.fastq.gz" "6_2D_R2_cut.fastq.gz" "6_2D_R1_paired_trim.fastq.gz" "6_2D_R1_unpaired_trim.fastq.gz" "6_2D_R2_paired_trim.fastq.gz" "6_2D_R2_unpaired_trim.fastq.gz"

#1_2A library 
sbatch trimmomatic.sh "1_2A_R1_cut.fastq.gz" "1_2A_R2_cut.fastq.gz" "1_2A_R1_paired_trim.fastq.gz" "1_2A_R1_unpaired_trim.fastq.gz" "1_2A_R2_paired_trim.fastq.gz" "1_2A_R2_unpaired_trim.fastq.gz"

```

JOB TRACKER / STATS/ SANITY CHECK DATA: 
| Sample | JobID | Run Time(mm:ss) | CPU Usage (%)| Exit Status |
|---|---|---|---|---|
|6_2D|15888873|4:14.26|210|0|
|1_2A|15888874|3:14.59|212|0|


produced files: /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA
```
"6_2D_R1_paired_trim.fastq.gz" "6_2D_R1_unpaired_trim.fastq.gz" "6_2D_R2_paired_trim.fastq.gz" "6_2D_R2_unpaired_trim.fastq.gz"
"1_2A_R1_paired_trim.fastq.gz" "1_2A_R1_unpaired_trim.fastq.gz" "1_2A_R2_paired_trim.fastq.gz" "1_2A_R2_unpaired_trim.fastq.gz"
```

### Q8: 
"Plot the trimmed read length distributions for both R1 and R2 reads (on the same plot - yes, you will have to use Python or R to plot this. See ICA4 from Bi621). You can produce 2 different plots for your 2 different RNA-seq samples. There are a number of ways you could possibly do this. One useful thing your plot should show, for example, is whether R1s are trimmed more extensively than R2s, or vice versa. Comment on whether you expect R1s and R2s to be adapter-trimmed at different rates and why." 

- putting answers in Report_Notes.md 



* Creating script to generate read_len_distribution plots: 
```
nano read_len_dist_plot.py 
```
* Running script to make plots: 
```
#activating matplotlib 
conda activate bgmp_py312
#changing permissions of script 
chmod 755 read_len_dist_plot.py
#Running scripts on paired trimmed fastq.gz files 
./read_len_dist_plot.py -R1 "6_2D_R1_paired_trim.fastq.gz" -R2 "6_2D_R2_paired_trim.fastq.gz" -label "6_2D"
./read_len_dist_plot.py -R1 "1_2A_R1_paired_trim.fastq.gz" -R2 "1_2A_R2_paired_trim.fastq.gz" -label "1_2A"
```
* Examined plots and added descriptions / answers to Report_Notes.md 

# Part 3 – Alignment & Strand Specificity 
### Q7
Installing requested software into my QAA env. 
```
#Activating QAA 
conda activate QAA
#STAR 
conda install bioconda::star
#NUMPY 
conda install conda-forge::numpy
#MATPLOTLIB 
conda install conda-forge::matplotlib
#HTSEQ 
conda install bioconda::htseq
```
* checking versions of software 
```
$STAR --version
2.7.11b
$numpy --version #this didn't work for some reason, instead used "conda list" 
1.26.4
$matplotlib --version #this didn't work for some reason, instead used "conda list" 
3.9.2
$htseq --version #this didn't work for some reason, instead used "conda list" 
2.0.5
```

TO DO: 
PART3.11: "Find publicly available mouse genome fasta files (Ensemble release 112) and generate an alignment database from them. Align the reads to your mouse genomic database using a splice-aware aligner. Use the settings specified in PS8 from Bi621."

____________________________________
08/29/24
____________________________________
# Part 2 – Adaptor Trimming Comparison 
* fixing read len dist plots: --> /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/read_len_dist_plot.py
    * log y values 
    * change color to R & B bc color blind friendly 

# Part 3 – Alignment & Strand Specificity 
* My PS8 PATH on talapas: /home/kenlai/bgmp/bioinfo/Bi621/PS/ps8-klai22

### Q11: 
#### A. 'Find publicly available mouse genome fasta files (Ensemble release 112) and generate an alignment database from them'
* URL to the enesmble files: 
    https://ftp.ensembl.org/pub/release-112/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
    https://ftp.ensembl.org/pub/release-112/gtf/mus_musculus/Mus_musculus.GRCm39.112.gtf.gz
* Downloading files: 
```
#Creating new directory to hold mouse genome fasta files- CHECK 
mkdir mouse_ensembl_files
#downloading files into this dir - CHECK 
wget -P /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/mouse_ensembl_files https://ftp.ensembl.org/pub/release-112/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
wget -P /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/mouse_ensembl_files https://ftp.ensembl.org/pub/release-112/gtf/mus_musculus/Mus_musculus.GRCm39.112.gtf.gz
#unzipping files - COMPLETE 
cd /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/mouse_ensembl_files
gunzip Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
gunzip Mus_musculus.GRCm39.112.gtf.gz

```
* Generate Alignment Database (w/ STAR)
```
#make a new dir to hold the database #including assembly name, ensemble release, & STAR version - CHECK 
mkdir Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b

#activate env w/ STAR - COMPLETE 
conda activate QAA 

#Creating STAR Database (Alignment Databse) - COMPLETE - started @ 10:44.31PM - finished @ 11:10PM 
$ /usr/bin/time -v STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b --genomeFastaFiles /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/mouse_ensembl_files/Mus_musculus.GRCm39.dna.primary_assembly.fa --sjdbGTFfile /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/mouse_ensembl_files/Mus_musculus.GRCm39.112.gtf
```
* output: 
```
        User time (seconds): 4592.05
        System time (seconds): 45.12
        Percent of CPU this job got: 322%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 23:57.93
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 32373856
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 34171786
        Voluntary context switches: 19534
        Involuntary context switches: 316910
        Swaps: 0
        File system inputs: 0s
        File system outputs: 0
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0
```

#### B. 'Align the reads to your mouse genomic database using a splice-aware aligner. Use the settings specified in PS8 from Bi621.'
* NOTE: STAR = the splice-aware aligner [aligns w/ introns/exons in mind ]

* Files (reads) that I am aligning to the STARDB(ref genome)
/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/__________
    "6_2D_R1_paired_trim.fastq.gz" "6_2D_R2_paired_trim.fastq.gz" 
    "1_2A_R1_paired_trim.fastq.gz" "1_2A_R2_paired_trim.fastq.gz"
    * excluded the unpaired filess, paired only

* Creating a script that will do this 
```
#making .sh script to align - COMPLETE 
nano star_align.sh 
#wrote script (based off of https://github.com/2024-BGMP/ps8-klai22/blob/master/star_align.sh)
```
* running script - COMPLETE 
```
#changing permission 
chmod 755 star_align.sh
#running 
sbatch star_align.sh
```
| Sample | JobID | Run Time(mm:ss) | CPU Usage (%)| Exit Status |
|---|---|---|---|---|
|6_2D|15903418|1:13.24|671|0|
* output files: 
```
1_2A_Aligned.out.sam  1_2A_Log.out  1_2A_SJ.out.tab 1_2A_Log.final.out    1_2A_Log.progress.out  1_2A_R1_FASTQC.sh

6_2D_Aligned.out.sam  6_2D_Log.out  6_2D_Log.final.out    6_2D_Log.progress.out 6_2D_SJ.out.tab
```


### Q12. 
'Using your script from PS8 in Bi621, report the number of mapped and unmapped reads from each of your 2 sam files. Make sure that your script is looking at the bitwise flag to determine if reads are primary or secondary mapping (update/fix your script if necessary).'
* my script DOES determine if they are primary or secondary mappings...
"if ((flag & 256)!=256)": This checks if the read is not a supplementary alignment (indicating that it's either primary or secondary)
"if ((flag & 4)!=4)": This checks if the read is mapped (i.e., not unmapped).

* Since my PS8 script was HARDCODED, I am just going to make a new one here. 

```
#create script - COMPLETE 
nano sam_parse.py 
#writing script - COMPLETE 
#chaning permissions - COMPLETE 
chmod 755 sam_parse.py
```

* Running script to get mapped vs. unmapped read count per library's SAM  FILE 

```
#6_2D SAM file 
./sam_parse.py -sam_file 6_2D_Aligned.out.sam
Mapped Reads:20127382
Unmapped Reads:795232
#1_2A SAM file 
./sam_parse.py -sam_file 1_2A_Aligned.out.sam
Mapped Reads:15530231
Unmapped Reads:402461
```
MAPPED vs. UNMAPPED COUNT RESULTS: 
| Library | Mapped Reads Count | Unmapped Reads Count |
|---|---|---|
|6_2D|20127382|795232|
|1_2A|15530231|402461|

* added Q12 answer to Report_Notes.md


### Q13. 
'Count reads that map to features using htseq-count. You should run htseq-count twice: once with --stranded=yes and again with --stranded=reverse. Use default parameters otherwise.'

* https://htseq.readthedocs.io/en/release_0.11.1/count.html
"Important: The default for strandedness is yes. If your RNA-Seq data has not been made with a strand-specific protocol, this causes half of the reads to be lost. Hence, make sure to set the option --stranded=no unless you have strand-specific data!"
"For stranded=no, a read is considered overlapping with a feature regardless of whether it is mapped to the same or the opposite strand as the feature. For stranded=yes and single-end reads, the read has to be mapped to the same strand as the feature. For paired-end reads, the first read has to be on the same strand and the second read on the opposite strand. For stranded=reverse, these rules are reversed."
"-t <feature type>, --type=<feature type>
feature type (3rd column in GFF file) to be used, all features of other type are ignored (default, suitable for RNA-Seq analysis using an Ensembl GTF file: exon)"
"For paired-end data, the alignment have to be sorted either by read name or by alignment position. If your data is not sorted, use the samtools sort function of samtools to sort it. Use this option, with name or pos for <order> to indicate how the input data has been sorted. The default is name."
* I looked @ the sam files and they are sorted by the 1st column (qname) and NOT by position (4th col) 

* RUNNING HTSEQCOUNT 
```
#ACTIVATE ENV w/ HTSEQ 
conda activate QAA
#for gtf file, using same one I used to build the STAR database in P.3 Q11.
#navigating: 
cd /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA
#6_2D SAM 
htseq-count -f sam -r name --stranded=yes -t exon -i gene_id 6_2D_Aligned.out.sam mouse_ensembl_files/Mus_musculus.GRCm39.112.gtf > 6_2D_counts.txt
htseq-count -f sam -r name --stranded=reverse -t exon -i gene_id 6_2D_Aligned.out.sam mouse_ensembl_files/Mus_musculus.GRCm39.112.gtf > 6_2D_rev_counts.txt
htseq-count -f sam -r name --stranded=no -t exon -i gene_id 6_2D_Aligned.out.sam mouse_ensembl_files/Mus_musculus.GRCm39.112.gtf > 6_2D_no_counts.txt
#1_2A SAM 
htseq-count -f sam -r name --stranded=yes -t exon -i gene_id 1_2A_Aligned.out.sam mouse_ensembl_files/Mus_musculus.GRCm39.112.gtf > 1_2A_counts.txt
htseq-count -f sam -r name --stranded=reverse -t exon -i gene_id 1_2A_Aligned.out.sam mouse_ensembl_files/Mus_musculus.GRCm39.112.gtf > 1_2A_rev_counts.txt
htseq-count -f sam -r name --stranded=no -t exon -i gene_id 1_2A_Aligned.out.sam mouse_ensembl_files/Mus_musculus.GRCm39.112.gtf > 1_2A_no_counts.txt
```
* output files: 
```
6_2D_counts.txt
6_2D_rev_counts.txt
6_2D_no_counts.txt
1_2A_counts.txt
1_2A_rev_counts.txt
1_2A_no_counts.txt
```

### Q14. 
'Demonstrate convincingly whether or not the data are from "strand-specific" RNA-Seq libraries. Include any comands/scripts used. Briefly describe your evidence, using quantitative statements (e.g. "I propose that these data are/are not strand-specific, because X% of the reads are y, as opposed to z.").'

* Stranded RNA-seq benefits [keeping info. on which strand said read belonged too] = more accurate differential expression analyses & 'higher assembly' (?), but costs more. 

PLAN: 
I am going to write a .sh script (with commands from Part 2 of https://github.com/2024-BGMP/ica4-klai22/blob/master/ICA4.md) that calc.s % of reads mapped to a feature for the reverse vs. yes (strandedness) gene count tables. I will then compare these %s for each library. If there is a higher % in the table from strandednes=yes, I will assume it is strand-specific library. If there is a higher % in the table for strandedness = no instead, I will assume it is NOT strand-specific[reverse ]. 

* Creating a bash script called mapped_features_calc.sh 
```
#creating script 
nano mapped_features_calc.sh 
#writing the script 
```

* Running script 
```
#navigating
cd /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA
#changing permissions 
chmod 755 mapped_features_calc.sh

#RUNNING 
#6_2D_yes
sbatch mapped_features_calc.sh 6_2D_counts.txt 6_2D_yes
#6_2D_rev
sbatch mapped_features_calc.sh 6_2D_rev_counts.txt 6_2D_rev
#6_2D_no
sbatch mapped_features_calc.sh 6_2D_no_counts.txt 6_2D_no
#1_2A_yes
sbatch mapped_features_calc.sh 1_2A_counts.txt 1_2A_yes
#1_2A_rev
sbatch mapped_features_calc.sh 1_2A_rev_counts.txt 1_2A_rev
#1_2A_no
sbatch mapped_features_calc.sh 1_2A_no_counts.txt 1_2A_no
```
OUTPUTS: 

| Sample | Strand-Specificity (parameter used for htseq-count to gen. input table) | JobID | Output | % of mapped features|
|---|---|---|---|---|
|6_2D_yes|yes|15903612|% of mapped features for 6_2D_yes: 3|3|
|6_2D_rev|reversed|15903624|% of mapped features for 6_2D_rev: 82|82|
|6_2D_no|none|15903625|% of mapped features for 6_2D_no: 79|79|
|1_2A_yes|yes|15903626|% of mapped features for 1_2A_yes: 3|3|
|1_2A_rev|reversed|15903627|% of mapped features for 1_2A_rev: 85|85|
|1_2A_no|none|15903629|% of mapped features for 1_2A_no: 83|83|

* Included interpertation in Report_Notes.md

____________________________________
08/30/24
____________________________________


```
SCP......to local....
/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/________
* the directories (unzipped folder) that include all fastqc plots (need the per-base qs -dist. & per-base N content plots for each library's R1 & R2)...each located in..
    * 1_2A_R2fastqc/1_2A_control_S1_L008_R2_001_fastqc/1_2A_control_S1_L008_R1_001_fastqc.zip.gz
    * 1_2A_R2fastqc/1_2A_control_S1_L008_R1_001_fastqc/
    * 6_2D_R1fastqc/6_2D_mbnl_S5_L008_R1_001_fastqc/
    * 6_2D_R2fastqc/6_2D_mbnl_S5_L008_R2_001_fastqc/

* Post-quality-trimming read length distributions per library 
    * 6_2D_read_len_dist.png
    * 1_2A_read_len_dist.png 

* Executing from local: 
```
scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/1_2A_R1fastqc/1_2A_control_S1_L008_R1_001_fastqc.zip.gz /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/1_2A_R2fastqc/1_2A_control_S1_L008_R2_001_fastqc.zip.gz /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/6_2D_R1fastqc/6_2D_mbnl_S5_L008_R1_001_fastqc.zip.gz /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/6_2D_R2fastqc/6_2D_mbnl_S5_L008_R2_001_fastqc.zip.gz /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/6_2D_read_len_dist.png /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/1_2A_read_len_dist.png /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/Report_Notes.md /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/Assignment2_NB.md /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

scp ktalapas:/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/*qs_dist.png /Users/kennethlai/Desktop/BI623/Assignments/Assignment2

```