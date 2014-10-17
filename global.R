library(TSP)
library(maptools)
library(ggplot2)
library(ggthemes)

data(eurodist)

distances <- as.matrix(eurodist)
cityList <- read.csv2(file = "countries.coords.csv", stringsAsFactors=FALSE)
cityList$long <- as.numeric(cityList$long)
cityList$lat <- as.numeric(cityList$lat)
rownames(cityList) <- cityList$CityName

t <- readShapeSpatial("world/MyEurope.shp")
mapToPlot <- fortify(t)


