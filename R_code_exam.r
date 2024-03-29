# Analyzing the change in Amazon deforestation between the years 2006 and 2019

# Installing the packages to be used
library(terra)
library(imageRy)

# Setting the working directory and assign it to a value
setwd("C:/Users/ferstinawady.scott/Desktop/Spatial_Ecology_Exam/R_code_exam.r")

# Loading the images and visually comparing them to observe the changes in deforestation patterns over time.
yuri2001 <- rast("yurimaguas_ls7_2001181_lrg.jpg")
plot(yuri2001)
yuri2019 <- rast("yurimaguas_oli_2019191_lrg.jpg")
plot(yuri2019)

# Plot side by side
par(mfrow = c(1, 2))
plot(yuri2001, main = "Deforestation 2001")
plot(yuri2019, main = "Deforestation 2019")
par(mfrow = c(1, 1))  # Reset to single plot

# Calculating the changes in areas where deforestation occurred between the two points:
# Calculating the difference
change_map <- yuri2019 - yuri2001

# Plotting the change map
plot(change_map, main = "Deforestation Change (2019 - 2001)")

# Specifying a color scheme
cl <- colorRampPalette(c("darkgrey", "grey", "blue"))(100)

# Plotting the change map with different colors
plot(change_map, main = "Deforestation Change (2019 - 2001)", col = cl)

# Quantitative Analysis:
# Calculating statistics on deforested areas, such as total deforested areas and Percentage change in deforestation
total_deforestation_2001 <- sum(values(yuri2001))
total_deforestation_2019 <- sum(values(yuri2019))
percentage_change <- ((total_deforestation_2019 - total_deforestation_2001) / total_deforestation_2001) * 100


cat("Total Deforested Area in 2001:", total_deforestation_2001, "\n")
cat("Total Deforested Area in 2019:", total_deforestation_2019, "\n")
cat("Percentage Change:", percentage_change, "%\n")

# Histogram Comparison:
# Comparing the histograms of pixel values between 2001 and 2019. 
# A wider spread in the histograms may indicate greater variability.
par(mfrow = c(1, 2))
hist(values(yuri2001), main = "Histogram 2001", col = "blue", xlim = c(0, 255))
hist(values(yuri2019), main = "Histogram 2019", col = "grey", xlim = c(0, 255))
par(mfrow = c(1, 1))
dev.off()

# Analyzing vegetation indices; NDVI (Normalized Difference Vegetation Index):
# The NDVI values range from -1 to 1, where higher values indicate healthier vegetation. 
# NDVI = NIR - RED / NIR + RED
# NDVI 2001
ndvi2001 = (yuri2001[[1]] - yuri2001[[2]]) / (yuri2001[[1]] + yuri2001[[2]])
ndvi2001
plot(ndvi2001)

# NDVI 2019
ndvi2019 = (yuri2019[[1]] - yuri2019[[2]]) / (yuri2019[[1]] + yuri2019[[2]])
ndvi2019
plot(ndvi2019)

# Specifying a color scheme
cl <- colorRampPalette(c("grey", "darkblue", "lightblue"))(100)

# Plotting NDVI maps
par(mfrow = c(1, 2))
plot(ndvi2001, main = "NDVI 2001", col = cl, legend = TRUE)
plot(ndvi2019, main = "NDVI 2019", col = cl, legend = TRUE)
par(mfrow = c(1, 1))

# Visualizing the change in NDVI
ndvi_change <- ndvi2019 - ndvi2001
plot(ndvi_change, main = "Change in NDVI", col = cl, legend = TRUE)
# The ndvi_2001 and ndvi_2019 are directly calculated from the red and NIR bands of the raster images

# DVI is calculated as the difference between the NIR and red bands without normalization.
# Formula: 
# DVI is used to measure absolute vegetation density and can be sensitive to changes in atmospheric conditions and sensor calibration.
# DVI = NIR − RED

# DVI 2001
dvi_2001 = yuri2001[[1]] - yuri2001[[2]]
plot(dvi_2001)

cl <- colorRampPalette(c("dark blue", "yellow", "red")) (100)
plot(dvi_2001, col=cl)

# DVI 2019
dvi_2019 = yuri2019[[1]] - yuri2019[[2]]
plot(dvi_2019, col=cl)

# Plotting side by side
par(mfrow=c(1,2))
plot(dvi_2001, main = "DVI 2001", col=cl)
plot(dvi_2019, main = "DVI 2019", col=cl)
