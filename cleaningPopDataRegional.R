## REGIONAL CALCULATIONS
# 2016-12-17

## LOADING IN DATA
population = read.csv("datasets/population2015.csv")

attach(population)
names(population)





## FIX POPULATION TO NUMERIC
no_commas_2 = sapply(Population, function(each_pop) {
  each_pop = gsub(",", "", each_pop)
})

pop = as.numeric(no_commas_2)




## REGIONAL POPULATION
# How many people per region
regions = levels(region)


regional_pops = rep(0, length(regions))
for (i in 1:length(Region)) {
  for (j in 1:length(regions)) {
    if (Region[i] == regions[j]) {
      regional_pops[j] = regional_pops[j] + pop[i]
    }
  }
}

regional_population = data.frame(regions, regional_pops)



## REGIONAL POPULATION WITHOUT FOR LOOP
# I wanna remove the for loop
# Recognize this vectorization only works because they're in order
df_region = as.vector(Region)

mf_shit = function(j) {
  region_indices = which(df_region==region[j])
  region_pop = sum(pop[region_indices])
}

regional_pops2 = sapply(1:length(region), mf_shit)
regional_pops2b = unique(regional_pops)

pops_table = data.frame(regions, regional_pops2b)
pops_table


write.csv(pops_table, "regionalPops.csv")
