# # cleaning it up
names(population)
population = cbind(population[,1:4], population[,6:7])
names(population)[5:6] = c("Area","Density")
names(population) = tolower(names(population))
attach(population)
levels(region)


# # cleaning it up again
names(population)
names(population)[5:6] = c("Area","Density")
names(population) = tolower(names(population))
attach(population)
levels(region) # still need to remove excess rows


# cleaning it up hopefully the last time
names(population)
names(population)[5:6] = c("Area","Density")
names(population) = tolower(names(population))
attach(population)
levels(region)
which(region=="")
length(region)
city[1516] # Tandag City, Region XIII - Caraga # Fixed

