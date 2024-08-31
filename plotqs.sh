#!/bin/bash

#sbatch plotqs.sh

#SBATCH --job-name=pltqs_assignment2
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.out
#SBATCH --error=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.err


#Activate matplotlib
conda activate bgmp_py312

#Running part1.py
# /usr/bin/time -v /home/kenlai/bgmp/bioinfo/Bi622/Assignments/Demultiplex/Assignment-the-first/part1.py -rl 101 -f /projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R1_001.fastq.gz -l 6_2D_R1
# /usr/bin/time -v /home/kenlai/bgmp/bioinfo/Bi622/Assignments/Demultiplex/Assignment-the-first/part1.py -rl 101 -f /projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R2_001.fastq.gz -l 6_2D_R2
# /usr/bin/time -v /home/kenlai/bgmp/bioinfo/Bi622/Assignments/Demultiplex/Assignment-the-first/part1.py -rl 101 -f /projects/bgmp/shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R1_001.fastq.gz -l 1_2A_R1
/usr/bin/time -v /home/kenlai/bgmp/bioinfo/Bi622/Assignments/Demultiplex/Assignment-the-first/part1.py -rl 101 -f /projects/bgmp/shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R2_001.fastq.gz -l 1_2A_R2

exit