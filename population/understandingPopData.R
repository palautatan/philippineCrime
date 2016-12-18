## PRELIMINARY ANALYSES


## LOADING IN DATA
cleanPop = read.csv("datasets/cleanPop.csv")




### DEAD CODE (AS OF 2016-12-17)
### PLEASE WAIT


# let's find something cool, yeah?
all_cities = city # Multiple city names are repeated, obvi
# Or is this unambiguously obvi?

names(population)

population[which(density == max(density)),] # Manila




## CITY DENSITY
# Most dense
population[sort(density)[1:6],]
# Manila, City of Las Piñas, Makati -- why are there two Makati's --, Makati, Mandaluyong City, Marikina


## CITY POPULATION
# Most populated
population[sort(Population)[1:6],]
# Manila, Quezon City, Caloocan, Pasay, Las Piñas, Makati