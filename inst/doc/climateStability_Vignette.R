## ----setup, include=FALSE-----------------------------------------------------
library(climateStability)
library(terra)
knitr::opts_chunk$set(error = TRUE)

## ----example of deviation through time with even time slices, eval=FALSE------
#  # deviationThroughTime using even time slices
#  precipDeviation <- deviationThroughTime(variableDirectory = "inst/extdata/precipfiles/",
#                                          timeSlicePeriod = 1000)
#  temperatureDeviation <- deviationThroughTime(variableDirectory = "inst/extdata/tempfiles/",
#                                               timeSlicePeriod = 1000)

## ----example of deviation through time with uneven time slices, eval=FALSE----
#  # deviationThroughTime using uneven time slices
#  unevenPrecipDeviation <- deviationThroughTime(variableDirectory = "inst/extdata/precipfilesUneven/",
#                                                timeSlicePeriod = c(1000, 1000, 1000, 1000, 5000, 5000, 6000))
#  unevenTemperatureDeviation <- deviationThroughTime(variableDirectory = "inst/extdata/tempfilesUneven/",
#                                                     timeSlicePeriod = c(1000, 1000, 1000, 1000, 5000, 5000, 6000))

## ----load the results of deviation through time from the package--------------
precipDeviation <- terra::rast(system.file("inst/extdata/precipDeviation.asc", package = "climateStability"))
temperatureDeviation <- terra::rast(system.file("inst/extdata/temperatureDeviation.asc", package = "climateStability"))

## ----calculate stability from deviation---------------------------------------
precipStability <- stabilityCalc(precipDeviation)

tempStability <- stabilityCalc(temperatureDeviation)

## ----calculate climate stability from individual climate variable stability estimates----
climateStability <- rescale0to1(precipStability * tempStability)

## ----plot stability rasters, fig.height=4, fig.width=8------------------------
plot(precipStability, main = "Relative Precipitation Stability")
plot(rangeBuilder::gshhs, add = T)
plot(tempStability, main = "Relative Temperature Stability")
plot(rangeBuilder::gshhs, add = T)
plot(climateStability, main = "Overall Relative Climate Stability")
plot(rangeBuilder::gshhs, add = T)

## ----plot latitudinal mean in stability, fig.height=4, fig.width=8------------
#Calculate mean values at rasters
plot(latitudinalMean(precipStability), main = "Precipitation Stability by Latitude", 
     ylab = "Relative Stability", type = "l")

plot(latitudinalMean(tempStability), main = "Temperature Stability by Latitude", 
     ylab = "Relative Stability", type = "l")

plot(latitudinalMean(climateStability), main = "Climate Stability by Latitude", 
     ylab = "Relative Stability", type = "l")

## ----plot absolute latitudinal mean in stability, fig.height=4, fig.width=8----
#Calculate mean values at rasters
plot(absLatitudinalMean(precipStability), main = "Precipitation Stability by Absolute Latitude", 
     ylab = "Relative Stability", type = "l")

plot(absLatitudinalMean(tempStability), main = "Temperature Stability by Absolute Latitude", 
     ylab = "Relative Stability", type = "l")

plot(absLatitudinalMean(climateStability), main = "Climate Stability by Absolute Latitude", 
     ylab = "Relative Stability", type = "l")

