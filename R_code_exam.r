# Analyzing the change in Amazon deforestation between the years 2006 and 2019

# Installing the packages to be used
library(terra)
library(ggplot2)

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

# Calculating the changes in areas where deforestation has occurred between the two time points.
