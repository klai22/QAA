#!/usr/bin/env python

#./sam_parse.py -sam_file ___

# MANAGING INPUTS 
#setting get_args 
import argparse
#defining input args 
def get_args():
    parser = argparse.ArgumentParser(description="setting global vars for parsing")
    parser.add_argument("-sam_file") # path to sam file
    return parser.parse_args()

#setting input args--> variables 
args=get_args()
filename=args.sam_file

#Initializing mapped vs. unmapped reads count 
mapped_reads=0
unmapped_reads=0

#Parsing file for mapped vs. unmapped reads 
with open (filename,"r") as fh:
    for line in fh:
        #skipping first ocuple lines that we dont want 
        if line.startswith("@"):
            continue
        #splitting each tab-separated value into a list 
        sam_list=line.split("\t")
        #we want the 2nd line (flag = bitscore)
        flag=int(sam_list[1])
        #ENSURING WE DONT COUNT MULTIPLE ALIGNMENTS FOR A SINGLE READ
        #if read is a secondary alignment
        if ((flag & 256)!=256):
            if((flag & 4)!=4):
                mapped_reads+=1
            else:
                unmapped_reads+=1


print(f"Mapped Reads:{mapped_reads}")
print(f"Unmapped Reads:{unmapped_reads}")