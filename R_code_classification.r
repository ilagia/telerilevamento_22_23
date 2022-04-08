 library(raster)
 library(RStoolbox)
 setwd("C:/Users/Utente/Desktop/")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, 1, 2, 3, stretch="lin")

#classifing the solar data
soc <- unsuperClass(so, nClasses=3)
soc
cl <- colorRampPalette(c('yellow','black','red'))(100)
