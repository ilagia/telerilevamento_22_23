#code for genersting land cover maps from satellite images

library(raster)
library(RStoolbox)
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
p1 + p2
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
freq(l06c$map)
class1= 164211 pixel
class2= 78515 pixel #forest
