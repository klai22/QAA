#!/bin/bash

#SBATCH --job-name=star_align
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.out
#SBATCH --error=/home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/o_e_files/slurm-special-name-%j.err

#activating conda env w/ STAR 
conda activate QAA

#running STAR on all files 
#6_2D Library 
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads\
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/6_2D_R1_paired_trim.fastq.gz /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/6_2D_R2_paired_trim.fastq.gz \
 --genomeDir /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
 --outFileNamePrefix 6_2D_

 #1_2A Library 
 /usr/bin/time -v STAR --runThreadN 8 --runMode alignReads\
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/1_2A_R1_paired_trim.fastq.gz /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/1_2A_R2_paired_trim.fastq.gz \
 --genomeDir /home/kenlai/bgmp/bioinfo/Bi623/Assignments/Assignment2/QAA/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
 --outFileNamePrefix 1_2A_