#R code variability 2 - using computer components
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
library(viridis)

#setwd("~/lab/") # Linux
setwd("C:/Users/Utente/Desktop/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac 

sen <- brick("sentinel.png")
ggRGB(sen, 1, 2, 3)
#visualize the image such as vegetation becomes green(fluo!)
ggRGB(sen, 2, 1, 3)

#Multivariate analysis
sen_pca <- rasterPCA(sen)
summary(sen_pca$model)
plot(sen_pca$map)

pc1 <- sen_pca$map$PC1
pc2 <- sen_pca$map$PC2
pc3 <- sen_pca$map$PC3

g1 <- ggplot() +
geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))
 
g2 <- ggplot() +
geom_raster(pc2, mapping=aes(x=x, y=y, fill=PC2))
 
g3 <- ggplot() +
geom_raster(pc3, mapping=aes(x=x, y=y, fill=PC3))
 
g1 + g2 + g3

#standard deiation of PC1
sd3 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
#Map by ggplot standard deviation of the first #plrincipal component
ggplot()+
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer))

ggplot() +
geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis()
ggplot() +
geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="cividis")
im1 <- ggRGB(sen, 2, 1, 3)
 
im2 <- ggplot() +
geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))
 
im3 <- ggplot() +
geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="inferno")
 
 ###Calculate heterogeneity in a 5x5 window
 sd5 <- focal(pc1, matrix(1/25, 5, 5), fun=sd)
 im4 <- ggplot() +
geom_raster(sd5, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="inferno")

 ###Calculate heterogeneity in a 7x7 window
 sd7 <- focal(pc1, matrix(1/49, 7, 7), fun=sd)
 im5 <- ggplot() +
geom_raster(sd7, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="inferno")
im3 + im4 + im5


 









 
