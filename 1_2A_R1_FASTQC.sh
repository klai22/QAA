#!/bin/bash

#sbatch 1_2A_R1_FASTQC.sh

#SBATCH --job-name=fastqc_assignment2
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.out
#SBATCH --error=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.err


#Activate FASTQC
conda activate QAA

#mkdir to store fastqc result 
mkdir test_1_2A_R1fastqc

#Runnning FASTQC on zipped FASTQ file 
/usr/bin/time -v fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R1_001.fastq.gz -o test_1_2A_R1fastqc

exit