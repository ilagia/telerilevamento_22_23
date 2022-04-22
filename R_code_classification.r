 library(raster)
 library(RStoolbox)
 setwd("C:/Users/Utente/Desktop/lab/")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, 1, 2, 3, stretch="lin")

#classifing the solar data
soc <- unsuperClass(so, nClasses=3)
soc
cl <- colorRampPalette(c('yellow','black','red'))(100)

#day 2
library(raster)
 library(RStoolbox)
 setwd("C:/Users/Utente/Desktop/lab/")
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

#classification
gcclass2 <- unsuperClass(gc, nClasses=2)
plot(gcclass2$map)
#exercise: classify the map with 4 classes
gcclass4 <- unsuperClass(gc, nClasses=4)
plot(gcclass4$map)
clc <- colorRampPalette(c('yellow','red','blue','black'))(100)
plot(gcclass4$map, col=clc)
#compare the classified map with the original set
par(mfrow=c(2,1))
plot(gcclass4$map, col=clc)
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

