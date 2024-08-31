#!/bin/bash

#sbatch cutadapt.sh adaptor_seq input_path output_path unwanted_adaptor_seq

#SBATCH --job-name=cutadapt_assignment2
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.out
#SBATCH --error=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.err

#MANAGING VARIABLES / INPUTS / OUTPUTS 
adaptor_seq=$1 #sequence of adaptor you desire to remove 
input_file=$2 # path to input file (zipped fastq.....input.fastq.gz)
output_file=$3 # path of output file (zipped fastq w/ REMOVED ADAPTORS...output.fastq.gz )
unwanted_adaptor_seq=$4 # sequence of opposite adaptor. If you're working w/ R1 library, put R2 adaptor seq. here (vis versa)

#counting occurances of incorrect adaptor in file (we want to 0 of this, confirming the expected seq. orientation)
unwanted_count=$(zcat $input_file | awk 'NR%4==2' | grep -c $unwanted_adaptor_seq)

#counting occurances of adaptor sequence in file UPSTREAM of cutadapt (zcat file, isolate seq. lines, count occurance of provided seq.)
pre_count=$(zcat $input_file | awk 'NR%4==2' | grep -c $adaptor_seq)

#Activate cutadapt 
conda activate QAA

#Running cutadapt (https://cutadapt.readthedocs.io/en/stable/guide.html)
/usr/bin/time -v cutadapt -a $adaptor_seq -o $output_file $input_file

#counting occurances of adaptor sequence in file DOWNSTREAM of cutadapt 
post_count=$(zcat $output_file | awk 'NR%4==2' | grep -c $adaptor_seq)

#printing out line counts to prove it worked 
echo "Undesired Adaptor count: $unwanted_count"
echo "Adaptor count BEFORE cutadapt: $pre_count"
echo "Adaptor count AFTER cutadapt: $post_count"



exit