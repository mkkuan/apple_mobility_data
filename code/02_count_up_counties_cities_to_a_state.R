# the goal of this script is to use the dplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually to save it to a csv

# Mikaela Kuan
# February 24, 2021
# mkkuan@dons.usfca.edu

# load function
source(file = "code/functions/count_up_counties_cities_transportation.R")

# test the function
for (state_to_subset in c("California", "Nevada", "Washington", "Oregon",
                          "Arizona")) {
  subset_data_count_city_county(input_file_name = paste0(
                                  "data/raw_data/",
                                  "applemobilitytrends-2021-03-02.csv"),
                                state_to_subset)
}
