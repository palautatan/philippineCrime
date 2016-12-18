### LOADING IN DATA
# This csv has already undergone Part 1 and another csv will
# be created in Part 2
population = read.csv("datasets/population/population2015.csv")


### PART 1: CHECKING HANDMADE COLUMNS
## Intended for viewing purposes
## Desired output already in population2015.csv
# To get the data as I did, by hand, fix all the provinces and regions
# to their city columns

## cleaning it up
# names(population)
# population = cbind(population[,1:4], population[,6:7])
# names(population)[5:6] = c("Area","Density")
# names(population) = tolower(names(population))
# attach(population)
# levels(region)
# detach(population)


## cleaning it up again
# names(population)
# names(population)[5:6] = c("Area","Density")
# names(population) = tolower(names(population))
# attach(population)
# levels(region) # still need to remove excess rows
# detach(population)


## cleaning it up hopefully the last time
# names(population)
# names(population)[5:6] = c("Area","Density")
# names(population) = tolower(names(population))
# attach(population)
# levels(region)
# which(region=="")
# length(region)
# city[1516] # Tandag City, Region XIII - Caraga # Fixed
# detach(population)





### PART 2: CHANGING DATA TYPES
attach(population)
names(population)
updated_df = data.frame(population[,1:3])
names(updated_df)[1:3] = c("region", "province", "city")


## FIX DENSITY TO NUMERIC
# fix up density, since factors -- those commas!
no_commas = sapply(Population.Density, function(each_density) {
  each_density = gsub(",", "", each_density)
})
density = as.numeric(no_commas)
updated_df  = cbind(updated_df, density)
rm(no_commas)


## FIX POPULATION TO NUMERIC
no_commas_2 = sapply(Population, function(each_pop) {
  each_pop = gsub(",", "", each_pop)
})
pop = as.numeric(no_commas_2)
updated_df = cbind(updated_df, pop)
rm(no_commas_2)


## FIX AREA TO NUMERIC
# this might already be numeric but wtf
area = as.numeric(updated_df[,5])
updated_df = cbind(updated_df, area)
head(updated_df)
detach(population)




### PART 3: ADD IN REGIONAL NUMBERS
# this was saved in regionalPop.csv

regionalPops = read.csv("datasets/population/regionalPops.csv")

regpop = rep(0,length(updated_df[,1]))

# saveRegPop = function(j) {
#   region_indices = which(updated_df$region==regionalPops[j,2])
#   regpop[region_indices] = regionalPops[j,3]
# }

for (j in 1:length(regionalPops)) {
  region_indices = which(updated_df$region==regionalPops[j,2])
  regpop[region_indices] = regionalPops[j,3]
}


### PART 4: SAVING CSV
write.csv(updated_df, "cleanPop.csv")
