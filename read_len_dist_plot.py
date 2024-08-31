#!/usr/bin/env python

#BFORE RUNNING SCRIPT BE SURE TO ACTIVATE CONDA ENV w/ MATPLOTLIB: conda activate bgmp_py312

#./read_len_dist_plot.py -R1 "6_2D_R1_paired_trim.fastq.gz" -R2 "6_2D_R2_paired_trim.fastq.gz" -label "6_2D"
#./read_len_dist_plot.py -R1 "1_2A_R1_paired_trim.fastq.gz" -R2 "1_2A_R2_paired_trim.fastq.gz" -label "1_2A"

# MANAGING INPUTS 
#setting get_args 
import argparse
#defining input args 
def get_args():
    parser = argparse.ArgumentParser(description="setting global vars for parsing")
    parser.add_argument("-R1") # filepath for R1.fastq.gz (paired reads)
    parser.add_argument("-R2") # filepath for R2.fastq.gz (paired reads)
    parser.add_argument("-label") # some ID to distinguish the library you are plotting 
    return parser.parse_args()

#setting input args--> variables 
args=get_args()
R1_file=args.R1
R2_file=args.R2
lib_label=args.label

#Importing modules
import gzip
import matplotlib.pyplot as plt
import numpy as np

#Creating FXNs 
def length_list_from_fq(filename):
    '''creates list of lengths for input file (fastq.gz), ideal for creating histograms via ax.hist()'''
    with gzip.open(filename,"rt") as fh:
        #initalize variables 
        seq_length=0
        len_dist_list=[]
        #iterate through file 
        for i,line in enumerate(fh):
            #isolate seq. line 
            if i%4==1:
                #measure length of line & append to list 
                seq_length=len(line)
                len_dist_list.append(seq_length)
                line_length=0
    return len_dist_list

#Generating a list of lengths per fq 
R1_list = length_list_from_fq(R1_file)
R2_list = length_list_from_fq(R2_file)

#Generating plots - googled how to do this

#Define bins 
bins = np.arange(min(min(R1_list), min(R2_list)), max(max(R1_list), max(R2_list)) + 2) - 0.5

#Calc. Histogram Values 
R1_hist, _=np.histogram(R1_list, bins=bins)
R2_hist, _=np.histogram(R2_list, bins=bins)

#Defining bar width & positions 
bar_width = 0.5
bin_centers = (bins[:-1] + bins[1:]) / 2

#setting plot 
fig, ax = plt.subplots()
#Plotting R1 & R2 lengths 
ax.bar(bin_centers - bar_width/2, R1_hist, width=bar_width, color='blue', label = "R1")
ax.bar(bin_centers + bar_width/2, R2_hist, width=bar_width, color='red', label = "R2")

#Logging y values 
ax.set_yscale("log")

#adding titles 
plt.xlabel('Seq. Length(bp)')
plt.ylabel('Frequency(log)')
plt.title('Read Length Distribution')
plt.legend(title="Read Type")
#Saving Figure 
plt.savefig(fname=f"{lib_label}_read_len_dist.png")


#PREVIOUS VERSIONS / AUTHOR NOTES 

# #Generating plots 
# #setting plot 
# fig, ax = plt.subplots()
# #Plotting R1 lengths 
# ax.hist(R1_list, color='c',bins=range(min(R1_list + R2_list), max(R1_list + R2_list) + 1),label="R1")
# #Plotting R2 lengths 
# ax.hist(R2_list, color='green',bins=range(min(R1_list + R2_list), max(R1_list + R2_list) + 1),label="R2")
# #adding titles 
# plt.xlabel('Seq. Length(bp)')
# plt.ylabel('Frequency')
# plt.title('Read Length Distribution')
# plt.legend(title="Read Type")
# #Saving Figure 
# plt.savefig(fname=f"{lib_label}_read_len_dist.png")