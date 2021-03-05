# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset
# uses functions in the code/function directory

# Mikaela Kuan
# mkkuan@dons.usfca.edu
# February 19, 2021

# load functions
source("code/functions/subset_mobility_data_to_state_wide.R")
source("code/functions/subset_mobility_data_to_state_long.R")

#test out the use of the function
for (state_to_subset in c("California", "Nevada", "Washington", "Oregon",
                          "Arizona")) {
  subset_mobility_data_to_state(
    input_file_name = "data/raw_data/applemobilitytrends-2021-03-02.csv",
    state_to_subset)

  subset_data_wide_to_long(
    input_file_name = "data/raw_data/applemobilitytrends-2021-03-02.csv",
    state_to_subset)
}
