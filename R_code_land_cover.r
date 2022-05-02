#code for genersting land cover maps from satellite images

library(raster)
library(RStoolbox) #for classification
#setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac
setwd("/Users/Utente/Desktop/lab/")
l92 <- brick("defor1_.png")
plotRGB(l92, r=1, g=2, b=3, dtretch='lin')

#exercise: import defor2 and import both in a single window
l06 <- brick("defor2_.png")
par(mfrow=c(2,1))
plotRGB(l92, r=1, g=2, b=3, stretch='lin')
plotRGB(l06, r=1, g=2, b=3, stretch='lin')

#instal packages ggplot2
install.packages("ggplot2")
library(ggplot2)
ggRGB(l92, r=1, g=2, b=3, stretch='lin')
ggRGB(l06, r=1, g=2, b=3, stretch='lin')
p1 <- ggRGB(l92, r=1, g=2, b=3, stretch='lin')
p2 <- ggRGB(l06, r=1, g=2, b=3, stretch='lin')
p1+p2
p1/p2
#classification
l92c <- unsuperClass(l92, nClasses=2)
plot(l92c$map)
#class1= forest
#class2= agricoltural areas + (water)
#set.seed(number)
#exercise: classify the landsat image from 2006
l06c <- unsuperClass(l06, nClasses=2)
plot(l06c$map)
#class2= forest
#class1= agricoltural areas + (water)
#set.seed(number)

#frequence clacolation
freq(l92c$map)
class1= 306597 pixel #forest
class2= 34695 pixel
#prpportion of classes
tot92 <- 341292 #pixel totali l92
prop_forest_92 <- 306597/tot92
#prop_forest_92 = 0.8983422
#percent of classes
perc_forest_92 <- 306597 * 100/tot92

#Exercise: calculate the percentage of agricultural areas in 1992
perc_agri_92 <- 34695 * 100/tot92

freq(l06c$map)
class1= 164211 pixel
class2= 78515 pixel #forest
#percent l06
tot_06 <- 342726
percent_forest_06 <- 78515 * 100/ tot_06
percnt_agri_06 <- 164211 * 100/ tot_06
#or
percnt_agri_06 <- 100 - percent_forest_06

#FINAL DATA
# prop_forest_92= 89.83422
#prop_agri_92= 10.16578

#prop_forest_06= 52.0868
#prop_agri_06= 47.9132

#let's build a dataframe with our data
#Colums (fields)
class <- c("Forest","Agricolture")
percent_1992 <- c(89.83422, 10.16578)
percent_2006 <- c(52.0868, 47.9132)
multitemporal <- data.frame(class, percent_1992, percent_2006)
#for visualize it like a tabel: 
View(multitemporal)

ggplot(multitemporal, aes(x=class,y=percent_1992, color=class)) + geom_bar(stat="identity", fill="white")
ggplot(multitemporal, aes(x=class,y=percent_2006, color=class)) + geom_bar(stat="identity", fill="white")

#pdf
pdf("percentage_1992.pdf")
ggplot(multitemporal, aes(x=class,y=percent_1992, color=class)) + geom_bar(stat="identity", fill="white")
dev.off()
pdf("percentage_2006.pdf")
ggplot(multitemporal, aes(x=class,y=percent_2006, color=class)) + geom_bar(stat="identity", fill="white")
dev.off()
