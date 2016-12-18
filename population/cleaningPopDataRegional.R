## REGIONAL CALCULATIONS
# 2016-12-17

## LOADING IN DATA
population = read.csv("datasets/population2015.csv")

attach(population)
names(population)





## FIX POPULATION TO NUMERIC
no_commas = sapply(Population, function(each_pop) {
  each_pop = gsub(",", "", each_pop)
})

pop = as.numeric(no_commas)




## REGIONAL POPULATION
# How many people per region
regions = levels(region)


# regional_pops = rep(0, length(regions))
# for (i in 1:length(Region)) {
#   for (j in 1:length(regions)) {
#     if (Region[i] == regions[j]) {
#       regional_pops[j] = regional_pops[j] + pop[i]
#     }
#   }
# }
# 
# regional_population = data.frame(regions, regional_pops)



## REGIONAL POPULATION WITHOUT FOR LOOP
# recognize this only works because they're in order
df_region = as.vector(Region)

savePops = function(j) {
  region_indices = which(df_region==region[j])
  region_pop = sum(pop[region_indices])
}

regional_pops = sapply(1:length(region), savePops)
regional_pops = unique(regional_pops)

pops_table = data.frame(regions, regional_pops)
pops_table



### WRITE CSV
write.csv(pops_table, "regionalPops.csv")
