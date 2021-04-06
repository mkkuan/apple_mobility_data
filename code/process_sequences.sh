#!/bin/bash

# this bash script is to use the SARS-CoV-2 sequence data 
# from the NCBI's GenBank available on March 20, 2021 to 
# calculate the total number of sequences on this file, the 
# total in each country, and then sort it from largest to 
# smallest.

# Mikaela Kuan
# April 5, 2021
# mkkuan@dons.usfca.edu

# this is to add a defensive program to the script
if [ $# -eq 0 ]
then
	echo "To run this script, please include the file in the argmument."
	exit 1
fi

file_name=$1

# this is to calculate and report out the total number of sequences in the file
zcat $1 | bioawk -c fastx '{print $name}' | wc -l | while read line
do
	echo "There are a total of $line sequences."
done

# this is to tally up the number of SARS-CoV-2 sequences in the dataset from each country and sort this output 
# from largest to smallest
