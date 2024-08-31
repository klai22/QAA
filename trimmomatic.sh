#!/bin/bash

#sbatch trimmomatic.sh $R1_fastq $R2_fastq $R1_paired_output $R1_unpaired_output $R2_paired_output $R2_unpaired_output

#SBATCH --job-name=trimmomatic_assignment2
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.out
#SBATCH --error=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.err

#MANAGING VARIABLES / INPUTS / OUTPUTS 
R1_fastq=$1 # path to fastq.gz from R1 library 
R2_fastq=$2 # path to fastq.gz from R2 library 
R1_paired_output=$3 # path of trimmed output file for R1 library (includes R1 reads where both corresponding mates [R1 & R2] were still present after trimming)
R1_unpaired_output=$4 # path of trimmed output file for R1 library (includes R1 reads that LOST THEIR corresponding mates [R1 vs. R2] after trimming)
R2_paired_output=$5 # path of trimmed output file for R2 library (includes R2 reads where both corresponding mates [R1 & R2] were still present after trimming)
R2_unpaired_output=$6 # path of trimmed output file for R2 library (includes R2 reads that LOST THEIR corresponding mates [R1 vs. R2] after trimming)

#Activate cutadapt 
conda activate QAA

#Running cutadapt (https://cutadapt.readthedocs.io/en/stable/guide.html)
/usr/bin/time -v trimmomatic PE -phred33 $R1_fastq $R2_fastq $R1_paired_output $R1_unpaired_output $R2_paired_output $R2_unpaired_output LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

exit