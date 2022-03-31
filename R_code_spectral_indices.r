library(raster)
# setwd("C:/lab/") # Windows
setwd("C:/Users/Utente/Desktop/lab/")
#import the first file: defor1_.png and name it l1992
l1992 <- brick("defor1_.png")
l1992

#RGB l1992
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

#layer 1= blue
#layer 2= red
#layer 3= green

#exercise: import the second file def2_.png and name it l2006
l2006 <- brick("defor2_.png")
l2006
#exercise: plottiamo inseme l1992 e 12006 per un confronto
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# DVI Difference Vegetation Index
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006

# day 2
#range DVI (8 bit): -255 a 255
#range NDVI (8 bit)= -1 a 1
#range DVI (16 bit)= -65535 a 65535
#range NDVI (16 bit)= -1 a 1
# l'ndvi si può usare con immagini che hanno diversa risoluzione radiometrica
#NDVI1992
dvi1992 = l1992[[1]] - l1992[[2]]
ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])

#exercise: multiframe with plotrgb above and ndiv1992 below
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)
#exercise 2: multigrame with l2006
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
par(mfrow=c(2,1))
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
plot(ndvi2006, col=cl)

#multiframe ndvi 1992 and 2006
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)







