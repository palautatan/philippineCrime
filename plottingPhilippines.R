setwd("/Users/edie/Box Sync/GitThings/philippineCrime")

## TRY 1
# I wanted to see if I could go about using this method, but it did not zoom into the Philippines the way I would've preferred
library(ggplot2)
library(ggmap)

pi_map = get_map("Philippines", maptype="toner-lite", zoom=6)
ggmap(pi_map)



## TRY 2
# This is the route I will use
# Data Source: http://www.gadm.org/country
library(sp)

# Here's a tutorial I'm reading through
# https://www.students.ncl.ac.uk/keith.newman/r/maps-in-r-using-gadm

# Level 0: The outline of the country (in the UK this is anywhere shaded in yellow)
level0 = readRDS("datasets/PHL_adm0.rds")
plot(level0, main="Level 0", col="lightgrey", border="darkgrey")

# Level 1: Major borders in the country, marking the boundaries between England, Scotland, Wales and Northern Ireland (in the UK map these are the red lines)
level1 = readRDS("PHL_adm1.rds")
plot(level1, main="Level 1", col="lightgrey", border="darkgrey", xlim=c(115,130), ylim=c(5,20))

names(level1)
head(level1$NAME_0) # just PI
head(level1$NAME_1) # name of counties?
# These are actually provinces
# https://en.wikipedia.org/wiki/Quezon



# Level 2: Boundaries of counties
# boroughs and districts in the UK image are the blue lines
level2 = readRDS("datasets/PHL_adm2.rds")
plot(level2, main="Level 2")

names(level2)
head(level2$NAME_0) # just PI
head(level2$NAME_1) # these are all provinces
head(level2$NAME_2) # these are all cities

# Level 3: Seems to be pretty black -- no documentation on this
level3 = readRDS("datasets/PHL_adm3.rds")
plot(level3, main="Level 3")
