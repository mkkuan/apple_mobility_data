# The Script is to read the Apple mobility dataset in a csv file
# and include only the subset of the rows the Washington state area
# and then write out the csv file to only include that data

# Mikaela Kuan
# mkkuan@dons.usfca.edu
# February 3, 2021

# read the csv file of the Apple mobility dataset
all_covid_data <- read.csv("data/raw data/applemobilitytrends-2021-02-01.csv")

# read the Apple mobility data set to include only the sub.region column
# 'Washington'
washington_data <- all_covid_data[all_covid_data$sub.region == "Washington", ]

# save the Washington data as a new csv file to the output directory
write.csv(washington_data, file = "output/washington_apple_mobility_data.csv")
