#R code vsrisbility

library(raster)
library(RStoolbox) # for image viewing and variability calculation
library(ggplot2) # for ggplot plotting
library(patchwork)
library(viridis)

setwd("C:/Users/Utente/Desktop/lab/") # Windows
# setwd("~/lab/") # Linux
# setwd("/Users/name/Desktop/lab/") # Mac

# Exercise: import the Similaun image
sen <- brick("sentinel.png")

# band1 = NIR
# band2 = red
# band3 = green

# Exercise: plot the image by the ggRGB function
ggRGB(sen, 1, 2, 3, stretch="lin") # stretch is done automatically
# hence:
ggRGB(sen, 1, 2, 3)

# NIR on g (green) component
ggRGB(sen, 2, 1, 3)

# Exercise: plot the two graphs one beside the other
g1 <- ggRGB(sen, 1, 2, 3)
g2 <- ggRGB(sen, 2, 1, 3)

# Exercise: plot one graph on top of the other
g1/g2

# Exercise (suggested by the students) - 4 plots: 
(g1+g2)/(g1+g2)
# calculation of variability over NIR
nir <- sen[[1]]
plot (nir)
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(sd3, col=clsd)
#blue= low variability #red,yellow= hight variability

# plotting with ggplot
ggplot() + 
geom_raster(sd, mapping=aes(x=x, y=y, fill=layer))
# light blue zone= rift or border between the woods and the mean
# with viridis # one of the possible packages for colorblind people
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis() +
ggtitle("Standard deviation by viridis")

# cividis
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "cividis") +
ggtitle("Standard deviation by viridis package")

# magma
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation by viridis package")

# inferno
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "inferno") +
ggtitle("Standard deviation by viridis package")

#Exercise: make the same calculation with a 7x7 window
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)






