setwd("/Users/edie/Box Sync/GitThings/philippineCrime")

# These data were taken from data.ph.gov (?)

## RAPE
rape = read.csv("datasets/top_15_highest number_of_rape_cases nationwide.csv")
rape[which(rape[,3]==max(rape[,3])),2]

## CRIMES
crimes = read.csv("datasets/top_15_highest_number_of_index_crimes_from_2010-2015.csv")
names(crimes)

# Most murders
crimes[which(crimes[,3]==max(crimes[,3])),2] # Davao City

# Most homicides
crimes[which(crimes[,4]==max(crimes[,4])),2] # Quezon City

# Most roberry
crimes[which(crimes[,5]==max(crimes[,5])),2] # Quezon City

# Most theft
crimes[which(crimes[,6]==max(crimes[,6])),2] # Quezon City

# Most carnapping
crimes[which(crimes[,7]==max(crimes[,7])),2] # Quezon City

# Most physical injuries
crimes[which(crimes[,8]==max(crimes[,8])),2] # Quezon City

# Most crime in general
crimes[which(crimes[,9]==max(crimes[,9])),2] # Quezon City


## Further
# Need to understand population sizes of these cities


