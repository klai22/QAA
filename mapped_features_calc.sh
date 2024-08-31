#!/bin/bash

#sbatch mapped_features_calc.sh gene_count_file(.txt) label

#SBATCH --job-name=q14_assignment2
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.out
#SBATCH --error=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.err

#MANAGING VARIABLES / INPUTS / OUTPUTS 
gene_count_table=$1 #.txt file of gene counts (output of htseqcount)
label=$2 #label in ouput that will keep track of what library you are looking at / what type of strandedness used 

#Sum the number of reads that mapped to a feature
feature_sum=$(grep -v '^__' $gene_count_table | awk '{sum+=$2} END {print sum}')

#Calculate the total number of reads
total=$(cat $gene_count_table|awk '{sum+=$2} END {print sum}')

#Determine the percentage of reads mapped by dividing the number of mapping reads by the total number of reads.
percentage_mapped=$(($feature_sum*100/$total))

#printing out line counts to prove it worked 
echo "% of mapped features for $label: $percentage_mapped"

