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
zcat "$file_name" | bioawk -c fastx '{print $name}' | wc -l | while read -r line
do
	echo "There are a total of $line sequences."
done

# this is to tally up the number of SARS-CoV-2 sequences in the dataset from each country and sort this output 
# from largest to smallest
zcat "$file_name" | grep ">" | cut -f 5 -d "|" | sort | uniq -c | sort -rn 

# this is to count up the number of sequences in the file that have more than 29,000 base pairs in them
bioawk -c fastx '{print length($seq)}' "$file_name" | awk '$seq>29000' | wc -l | while read -r greater
do
	echo "There are a total of $greater sequences with more than 29000 bases."
done

# this is to count up the number that have less than 29,000 base pairs
bioawk -c fastx '{print length($seq)}' "$file_name" | awk '$seq<29000' | wc -l | while read -r lesser
do
	echo "There are a total of $lesser sequences with less than 29000 bases."
done
