## ee
# 2016-12

## RESOURCES:
# Data: http://www.gadm.org/country
# Tutorial: 
# https://www.students.ncl.ac.uk/keith.newman/r/maps-in-r-using-gadm
library(sp)


setwd("/Users/edie/Box Sync/GitThings/philippineCrime")


## LEVEL 0
level0 = readRDS("datasets/PHL_adm0.rds")
plot(level0, main="Level 0", col="lightgrey", border="darkgrey")



## LEVEL 1
level1 = readRDS("datasets/PHL_adm1.rds")
plot(level1, main="Level 1", col="lightgrey", border="darkgrey", xlim=c(115,130), ylim=c(5,20))

names(level1)
head(level1$NAME_0) # Nation: Philippines
head(level1$NAME_1) # name of counties?



## LEVEL 2
level2 = readRDS("datasets/PHL_adm2.rds")
plot(level2, main="Level 2")

names(level2)
head(level2$NAME_0) # Nation: Philippines

head(level2$NAME_1)
sample(level2$NAME_1, 10) # Provinces

head(level2$NAME_2)
sample(level2$NAME_2, 10) # Cities



# Level 3: Seems to be pretty black -- no documentation on this
level3 = readRDS("datasets/PHL_adm3.rds")
plot(level3, main="Level 3")

names(level3)
head(level3$NAME_0) # Philippines

head(level3$NAME_1)
sample(level3$NAME_1, 10) # Regions

head(level3$NAME_2)
sample(level3$NAME_2, 10) # Cities

head(level3$NAME_3)
sample(level3$NAME_3, 10) # Barangay = District