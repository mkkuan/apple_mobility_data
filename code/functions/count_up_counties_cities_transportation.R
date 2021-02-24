# the goal of this function is to use the dplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually to save it to a csv

# Mikaela Kuan
# February 24, 2021
# mkkuan@dons.usfca.edu

# load the package "dplyr"
library("dplyr")

# we would like to get a count of the number of cities and the
# number of counties in a given state and their tranportation type
# data. The input to this will be the output of the previous function
# namely the state csv files that were already subsetted

subset_data_count_city_county <- function(input_file_name, state_to_subset) {
  # load in the csv file to read
  state_data <- read.csv(file = paste0("output/",
                          tools::file_path_sans_ext(
                            basename(input_file_name)),
                          "_",
                          state_to_subset,
                          ".csv"))

  # using the "dplyr" package, we will pull data from the csv file
  count_cities_counties_by_type <- state_data %>%

    # this is to select the columns in the csv file
    select(geo_type, region, transportation_type) %>%

    # this is so we can have a count of the transportation type in the city
    # geotype and the county geotype
    group_by(geo_type, transportation_type) %>%
    tally()

  # this is a check to make sure there is data in the geo_type
  # and transportation_type
  if (nrow(count_cities_counties_by_type) == 0) {
    stop("ERROR: No rows where detected.
         Does this file contain any geo types or transportation types?")
  }

  # create a csv file from the from the dplyr chain data
  write.csv(count_cities_counties_by_type, paste0("output/",
                                                  tools::file_path_sans_ext(
                                                    basename(input_file_name)),
                                                  "_",
                                                  state_to_subset,
                                                  "_cities_counties_counts",
                                                  ".csv"))
}
