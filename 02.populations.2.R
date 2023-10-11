#Code related to population

# A package is needed for point pattern analysis
# Spatstat analysis spatial patterns of points in two-dimensional space

# let's use the bei data:
# data description:
# https://CRAN.R-project.org/package=spatstat
install.pcakages("spatstat")
library(spatstat)

bei 
# changing dimension - cex
plot(bei, cex=.2)

# changing the symbol - pch
plot(bei, cex=.5, pch=19)

# additional datasets
bei.extra
plot(bei.extra)
 
# let's use only part of the dataset: elev
plot(bei.extra$elev)
elevation <- bei.extra$elev
plot(elevation)

# second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)

# passing from points to a countinuous surface
densitymap <- density(bei)
plot(densitymap)
points(bei, cex=.2)

plot(bei.extra[[1]])
plot(bei, pch=19, cex=.5, add=T) 

# Multiframe
par(mfrow=c(2,1))
plot(bei.extra[[1]])
plot(density_map)

cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(densitymap, col=cl)

cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(4)
plot(densitymap, col=cl)

clnew <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(densitymap, col=clnew)

plot(bei.extra[[1]], col=cl)
plot(density_map, col=cl)

plot(bei.extra)

elev <- bei.extra[[1]] # bei.extra$elev
plot(elev)

# multiframe
par(mfrow=c(1,2))
plot(densitymap)
plot(elev)

par(mfrow=c(2,1))
plot(densitymap)
plot(elev)

par(mfrow=c(1,3))
plot(bei)
plot(densitymap)
plot(elev)

#-----
bei.rast <- rast(bei.extra[[1]])
density.rast <- rast(densitymap)

randompoints <- spatSample(bei.rast, 100, "random", as.points = TRUE)
bei.points <- terra::extract(bei.rast, randompoints)
density.points <- terra::extract(density.rast, randompoints)
 
pointmaps <- data.frame(bei.points[1:2], density.points[2])

names(pointmaps)

attach(pointmaps)
plot(lyr.1, lyr.1.1)
