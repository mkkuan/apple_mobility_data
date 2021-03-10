# Analysis of Apple Mobility Data in the Era of COVID-19

Mikaela Kuan  
mkkuan@dons.usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.

That data is available from the following URL:
https://covid19.apple.com/mobility

It currently uses dplyr to work with some of the tabular data. Eventually, it will also include use of ggplot2 to visualize the dataset.

### Change Log
* 2021-03-09: Add a timeseries plot for all types of transportation in `Analysis.Rmd`. Adding conditions for varying datasets.

* 2021-03-04: Add Rmd to drive entire analysis

* 2021-03-03: Created a new function to turn the Apple mobility wide data to long data. Edited the functions to use R packages instead of using base R. Deleted old output files and subsetted updated mobility data from 2021-03-02.

* 2021-02-24: Added second script to use dplyr to tally up the count of cities and counties in a given state that have data from the different transportation types. Refactored the data so that the code is more general and any subsetted state data can be used to count the geo type by transportation type. Used `for` loops to make it so different states can be subsetted at the same time. Deleted old output data. Committed and pushed all files into repository. Add gitkeep files to all major directories.

* 2021-02-22: Initialized a git repository in this project and commit all files into that repository.

* 2021-02-19: A new version of the data file was downloaded, and I also worked to refactor the code to be more general and to allow for any state to be subset from the larger file.

* 2021-02-02: The data file was originally downloaded for analysis.

