# checking out population data

## LOADING IN DATA
population = read.csv("datasets/population2015.csv")

attach(population)
names(population)


## START THE DATA CLEANING
# let's find something cool, yeah?
all_cities = city # Multiple city names are repeated, obvi
# Or is this unambiguously obvi?


## FIX DENSITY TO NUMERIC
# fix up density, since factors -- those commas!
no_commas = sapply(Population.Density, function(each_density) {
  each_density = gsub(",", "", each_density)
})

density = as.numeric(no_commas)
population = cbind(population, density)
names(population)

population[which(density == max(density)),] # Manila



## FIX POPULATION TO NUMERIC
no_commas_2 = sapply(Population, function(each_pop) {
  each_pop = gsub(",", "", each_pop)
})

pop = as.numeric(no_commas_2)



## CITY DENSITY
# Most dense
population[sort(density)[1:6],]
# Manila, City of Las Piñas, Makati -- why are there two Makati's --, Makati, Mandaluyong City, Marikina


## CITY POPULATION
# Most populated
population[sort(Population)[1:6],]
# Manila, Quezon City, Caloocan, Pasay, Las Piñas, Makati



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
