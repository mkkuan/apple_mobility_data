# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset

# Mikaela Kuan
# mkkuan@dons.usfca.edu
# February 19, 2021

# create a function to subset any US state out of the full dataset
# this should also create an output CSV file that is named based on the state
# that is subsetted
subset_mobility_data_to_state <- function(input_file_name,
                                          state_to_subset) {
  # read in the complete csv file
  all_covid_data <- read.csv(input_file_name)

  # subset the dataset to only include the sub.region column has
  # the state name in it but we want all columns.
  state_data <- all_covid_data[all_covid_data$sub.region == state_to_subset, ]

  # check that the subsetted data actually has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR: No rows matching given state name. Did you make a typo?")
  }

  # save the state data to a new csv file in the output directory
  write.csv(state_data, file = paste0("output/subsetted_states/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_",
                                      state_to_subset,
                                      ".csv"))
}
