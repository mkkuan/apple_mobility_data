# the goal of this function is to make the subset data of a state of the
# Apple mobility data from wide format to long format.

# Mikaela Kuan
# March 3, 2021
# mkkuan@dons.usfca.edu

# create a function
subset_data_wide_to_long <- function(input_file_name, state_to_subset) {
  # make sure the states with spaces in them are replaced with a "_" instead
  state_no_spaces <- gsub(state_to_subset, pattern = " ", replacement = "_")

  # read in the wide format subsetted data using readr
  wide_state_data <- readr::read_csv(file = paste0("output/",
                                                   "subsetted_states_wide/",
                                                   tools::file_path_sans_ext(
                                                     basename(input_file_name)),
                                                   "_",
                                                   state_no_spaces,
                                                   "_wide.csv"))

  # use tidyr to edit the column name using "XYYYY.MM.DD" wide format
  # to long format. The dates will have its own column.
  long_state_data <- tidyr::pivot_longer(wide_state_data,
                                         cols = starts_with("202"),
                                         names_to = "date",
                                         values_to = "relative_mobility")

  # add a defensive mechanism to stop data that has no information in it from
  # being written
  if (nrow(long_state_data) == 0) {
    stop("ERROR: No rows were detected. Did you input the wrong file?")
  }

  # write the long format data to a csv file
  readr::write_csv(long_state_data, file = paste0("output/",
                                                  "subsetted_states_long/",
                                                  tools::file_path_sans_ext(
                                                    basename(input_file_name)),
                                                  "_",
                                                  state_no_spaces,
                                                  "_long.csv"))

  return(long_state_data)
}
