# Questo è il primo script che useremo a lezione

library(raster)
 
# Settaggio cartella di lavoro
 setwd("C:/Users/Utente/Desktop/lab/") # windows
 
# import
l2011 <- brick("p224r63_2011.grd")
l2011
 
# plot
plot(l2011)
 
# https://www.r-graph-gallery.com/42-colors-names.html
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
#il 100 indica il numero di variazioni dei colori
plot(l2011, col=cl)
 
# dev.off()

# Landsat ETM+
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino a NIR

# plot della banda del blu  B1_sre
plot(l2011$B1_sre)
#or
plot(l2011[[1]])
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre, col=cl)

# plot b1 from dark blue to blue to light blue
clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col=clb) 

#esportiamo l'immagine
pdf("banda1.pdf")
plot(l2011$B1_sre, col=clb)
dev.off()

# plot b2 from dark green to green to light green
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col=clg) 

#multiframe
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# export multiframe plot
pdf("multiframe.pdf")
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()


# exercise: revert the multiframe
par(mfrow=c(2,1)
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg) 
dev.off()
# let's plot the first four bands
par(mfrow=c(2,2))
# blue
plot(l2011$B1_sre, col=clb) 
# green
plot(l2011$B2_sre, col=clg) 
# red
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col=clr)
# NIR
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clnir)
