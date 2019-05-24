
<!-- README.md is generated from README.Rmd. Please edit that file -->
climateStability
================

The goal of climateStability is to provide a simple set of `R`-based tools to generate climate stability estimates based on time slices of climate data.

Installation
------------

You can install climateStability from github with:

``` r
# install.packages("devtools")
devtools::install_github("hannahlowens/climateStability")
```

Example
-------

This is a basic example which shows you how to calculate climate stability using time-slice datasets for two variables:

``` r
# Set the working directory where you climate data are located (one sub-folder per variable)
dir <- "yourDirectory"

# First, calculate deviation through time using even time slices
precipDeviation <- deviationThroughTime(variableDirectory = 
                                          paste(dir, "../../ClimateStabilityManuscript/precipfiles/", sep = ""),
                                        timeSlicePeriod = 1000);
temperatureDeviation <- deviationThroughTime(variableDirectory = 
                                               paste(dir, "../../ClimateStabilityManuscript/tempfiles/", sep = ""),
                                             timeSlicePeriod = 1000);

# Next, calculate stability for each variable (the inverse of deviation)
precipInvDev <- 1/precipDeviation;
tempInvDev <- 1/temperatureDeviation;

# Then rescale the stability estimates between 0 and 1
precipStability <- rescale0to1(precipInvDev);
tempStability <- rescale0to1(tempInvDev);

# Finally, multiply them together and rescale to estimate relative climate stability
climateStability <- rescale0to1(precipStability * tempStability)
```

For more information, refer to the vignette.

``` r
browseVignettes("climateStability")
```
