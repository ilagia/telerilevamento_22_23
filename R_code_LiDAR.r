#R code for analysing LiDAR data
library(raster)
library(ggplot2)
library(viridis)
library(RStoolbox)

# setwd("~/lab/") # Linux
setwd("C:/Users/Utente/Desktop/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

dsm_2004 <- raster("2004Elevation_DigitalElevationModel-2.5m.tif")
dsm_2004
dtm_2004 <- raster("2004Elevation_DigitalTerrainModel-2.5m.tif")
dtm_2004
#make the difference between DSM and DTM to find CHM
chm_2004 <- dsm_2004 - dtm_2004
plot(chm_2004) 
dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013
dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")
dtm_2013
chm_2013 <- dsm_2013 - dtm_2013
chm_2013
